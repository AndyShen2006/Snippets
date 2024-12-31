# 班级考核分登记系统

# 结构

## 概要设计

前端：？

服务器：Nginx

后端：Flask

数据库：PostgreSQL

## 部分设计

登录子系统：负责登录鉴权

加扣分子系统：负责进行加扣分计算，并负责签字

加扣分记录格式：ID+缘由+分数变动+操作人+时间

审计子系统：负责统计计算

# 权限

administrator:管理员，可以调整其他人的角色并拥有以下所有权限。

moderator:仲裁员，可以对最终的加扣分申请进行签字审核并计入总表，拥有以下所有权限。

user:用户，可以提出加扣分申请，拥有以下所有权限。

guest:可以查看所有人的分数，并进行审计。
