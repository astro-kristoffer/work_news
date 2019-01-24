admin_first = Admin.new(
  :email => 'krist.sycheva@gmail.com',
  :password => '123456'
)
admin_first.save

admin_second = Admin.new(
  :email => 'krist.sycheva@mail.ru',
  :password => '123456'
)
admin_second.save