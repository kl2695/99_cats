# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Cat.create(birth_date: '2015/01/20', color: 'black', name: 'mr.boots', sex: 'M', description: 'meow')
cat2 = Cat.create(birth_date: '2015/01/20', color: 'white', name: 'mrs.boots', sex: 'F', description: 'meow')
# cat2 = Cat.create(birth_date: '2015/01/20', color: 'abc', name: 'mrs.boots', sex: 'F', description: 'meow')
rent1 = CatRentalRequest.create(cat_id: 1, start_date: '2017/10/20', end_date: '2017/10/31', status: 'APPROVED')
rent2 = CatRentalRequest.create(cat_id: 2, start_date: '2017/10/20', end_date: '2017/10/31', status: 'APPROVED')
rent3 = CatRentalRequest.create(cat_id: 1, start_date: '2017/10/25', end_date: '2017/10/31', status: 'DENIED')
rent4 = CatRentalRequest.create(cat_id: 2, start_date: '2017/11/02', end_date: '2017/11/15', status: 'APPROVED')
rent5 = CatRentalRequest.create(cat_id: 4, start_date: '2017/11/20', end_date: '2017/12/30', status: 'DENIED')
rent6 = CatRentalRequest.create(cat_id: 4, start_date: '2017/11/20', end_date: '2017/12/30', status: 'PENDING')
rent7 = CatRentalRequest.create(cat_id: 4, start_date: '2017/11/22', end_date: '2017/12/30', status: 'APPROVED')
