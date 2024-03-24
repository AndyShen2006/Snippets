{-# LANGUAGE ForeignFunctionInterface #-}

module Base64 where

import Data.Char
import Foreign
import Foreign.C (CString, newCString, peekCString)
import Foreign.C.Types

foreign export ccall "base64Encoder" base64EncoderFFI :: CString -> IO CString
foreign export ccall "base64Decoder" base64DecoderFFI :: CString -> IO CString

byteEncoder :: Int -> Char
byteEncoder x
    | x <= 26 = chr (ord 'A' + x)
    | x <= 52 = chr (ord 'a' + x - 26)
    | x <= 62 = chr (ord '0' + x - 52)
    | x == 63 = '+'
    | otherwise = '/'

byteDecoder :: Char -> Int
byteDecoder x
    | x <= 'Z' = ord x - ord 'A'
    | x <= 'z' = ord x - ord 'a' + 26
    | x <= '9' = ord x - ord '0' + 52
    | x == '+' = 63
    | otherwise = 64

bytesEncoder :: [Char] -> [Char]
bytesEncoder [a, b, c] = fmap byteEncoder [x `div` 262144 `mod` 64, x `div` 4096 `mod` 64, x `div` 64 `mod` 64, x `mod` 64]
  where
    x = ord a * 65536 + ord b * 256 + ord c
bytesEncoder [a, b] = bytesEncoder [a, b, chr 0]
bytesEncoder [a] = bytesEncoder [a, chr 0, chr 0]
bytesEncoder _ = error "Error"

bytesDecoder :: [Char] -> [Char]
bytesDecoder [a, b, '=', '='] = bytesDecoder [a, b, 'A', 'A']
bytesDecoder [a, b, c, '='] = bytesDecoder [a, b, c, 'A']
bytesDecoder [a, b, c, d] = fmap chr [x `div` 65536 `mod` 256, x `div` 256 `mod` 256, x `mod` 256]
  where
    x = byteDecoder a * 262144 + byteDecoder b * 4096 + byteDecoder c * 64 + byteDecoder d
bytesDecoder _ = error "Error"

base64Encoder :: [Char] -> [Char]
base64Encoder (x : y : z : xs) = bytesEncoder [x, y, z] ++ base64Encoder xs
base64Encoder (x : y : "") =
    ( \cur -> case cur of
        'A' -> '='
        _ -> cur
    )
        <$> bytesEncoder [x, y]
base64Encoder (x : "") =
    ( \cur -> case cur of
        'A' -> '='
        _ -> cur
    )
        <$> bytesEncoder [x]
base64Encoder "" = ""

base64Decoder :: [Char] -> [Char]
base64Decoder (a : b : "==") = bytesDecoder [a, b, '=', '=']
base64Decoder (a : b : c : "=") = bytesDecoder [a, b, c, '=']
base64Decoder (a : b : c : d : xs) = bytesDecoder [a, b, c, d] ++ base64Decoder xs
base64Decoder "" = ""
base64Decoder _ = error "Error"

base64EncoderFFI :: CString -> IO CString
base64EncoderFFI cStr = do
    str <- peekCString cStr
    newCString $ base64Encoder str

base64DecoderFFI :: CString -> IO CString
base64DecoderFFI cStr = do
    str <- peekCString cStr
    newCString $ base64Decoder str
