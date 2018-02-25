# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rake db:reset 日后资料库设定 ( migrate ) 重建时发生错误时的 bug fix

# mock一个管理员账户 执行rake db:seed
if User.find_by(email: "admin@shiyuanzhong.com").nil?
  u = User.new
  u.email = "admin@test.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end
if User.find_by(email: "admin@qiuguixin.com").nil?
  u = User.new
  u.email = "admin@test.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end

# mock一个普通账户 执行rake db:seed
if User.find_by(email: "student@qiuguixin.com").nil?
  u = User.new
  u.email = "student@qiuguixin.com"       # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = false
  u.save
  puts "Student 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Student 已经建立过了，脚本跳过该步骤。"
end
if User.find_by(email: "student@shiyuanzhong.com").nil?
  u = User.new
  u.email = "student@shiyuanzhong.com"       # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = false
  u.save
  puts "Student 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Student 已经建立过了，脚本跳过该步骤。"
end
