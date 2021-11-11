# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r1 = Role.create({ name: 'Patient', description: 'Can create and read vizits. Can read own appointments' })
r2 = Role.create({ name: 'Doctor', description: 'Can read vizits. Can create, read and update own appointments' })
r3 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ fullname: 'Sally Major', mobile_no: '380501234567', address: 'Kharkiv, Danilevskogo str. 7', email: 'sally@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id })
u2 = User.create({ fullname: 'Sue Kostner', mobile_no: '380661111111', address: 'Kharkiv, Danilevskogo str. 8', email: 'sue@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u3 = User.create({ fullname: 'Kevin Spacy', mobile_no: '380672222222', address: 'Kharkiv, Danilevskogo str. 9', email: 'kevin@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u4 = User.create({ fullname: 'Jack Nortingen', mobile_no: '380733333333', address: 'Kharkiv, Danilevskogo str. 17', email: 'jack@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r3.id })