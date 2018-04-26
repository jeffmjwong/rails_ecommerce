# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { username: 'shaunspin',
    email: 'shaun@ss',
    password: '123456'
  },
  { username: 'denisdman',
    email: 'denis@ss',
    password: '123456'
  },
  { username: 'jeffwong',
    email: 'jeff@ss',
    password: '123456',
    admin: true
  }
])

product.image = Rails.root.join('app', 'assets', 'images', 'product.jpg').open
