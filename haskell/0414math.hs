gnum :: [Rational] -> Rational -> Int
gnum [] k = 0
gnum (x : xs) k =
    if k > x
        then
            1 + gnum xs k
        else
            gnum xs k

main = do
    let a = [9.8, 9.7, 9.55, 9.54, 9.48, 9.42, 9.4, 9.35, 9.3, 9.25]
    let b = [9.78, 9.56, 9.51, 9.36, 9.32, 9.23]
    let c = [9.85, 9.65, 9.2, 9.16]
    print $ (sum $ zipWith (*) (map (/ 4) (map (gnum c) a)) (map (/ 6) (map (gnum b) a)))
