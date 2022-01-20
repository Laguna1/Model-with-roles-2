# frozen_string_literal: true

require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Role.destroy_all
# Category.destroy_all
# User.destroy_all
Visit.destroy_all

# r1 = Role.create({ name: 'Patient', description: 'Can create and read vizits. Can read own appointments' })
# r2 = Role.create({ name: 'Doctor', description: 'Can read vizits. Can create, read and update own appointments' })
# r3 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

# p "Created #{Role.count} roles"

# c = Category.create(speciality: 'Therapist')
# c2 = Category.create(speciality: 'Surgeon')
# c3 = Category.create(speciality: 'Pediatrician')
# c4 = Category.create(speciality: 'Gynecologist')
# c5 = Category.create(speciality: 'Dentist')
# c6 = Category.create(speciality: 'Dermatologist')
# c7 = Category.create(speciality: 'Ophthalmologist')
# c8 = Category.create(speciality: 'Urologist')
# c9 = Category.create(speciality: 'Psychiatrist')

# p "Created #{Category.count} categories"

# u1 = User.create({ fullname: 'Sally Major', mobile_no: '380501234567', address: 'Kharkiv, Danilevskogo str. 7', email: 'sally@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: Role.first.id })
# u5 = User.create({ fullname: 'Oksana Petrova', mobile_no: '380957029857', address: 'Kharkiv, Danilevskogo str. 78', email: 'oksana@mail.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: Role.first.id })
# u2 = User.create({ fullname: 'Sue Kostner', mobile_no: '380661111111', address: 'Kharkiv, Danilevskogo str. 8', email: 'sue@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: Role.second.id, category_id: Category.first.id })
# u3 = User.create({ fullname: 'Kevin Sparky', mobile_no: '380672222222', address: 'Kharkiv, Danilevskogo str. 19', email: 'kevin@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: Role.second.id, category_id: Category.first.id })
# u6 = User.create({ fullname: 'Doctor Pain', mobile_no: '380682222222', address: 'Kharkiv, Danilevskogo str. 29', email: 'pain@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: Role.second.id, category_id: Category.first.id })
# u7 = User.create({ fullname: 'Doctor Dulitl', mobile_no: '380692222222', address: 'Kharkiv, Danilevskogo str. 9', email: 'dulitl@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: Role.second.id, category_id: Category.last.id })
# u4 = User.create({ fullname: 'Jack Nortingen', mobile_no: '380733333333', address: 'Kharkiv, Danilevskogo str. 17', email: 'jack@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: Role.last.id })

# p "Created #{User.count} users"

v1 = Visit.create({ date: '2021-12-10 11:00:00', note: 'Headache', pat_id: 1, doc_id: 3 })
v2 = Visit.create({ date: '2021-11-12 12:00:00', note: 'Toothache', pat_id: 1, doc_id: 6 })
v3 = Visit.create({ date: '2021-11-12 16:30:00', note: 'Injury of the joints of the hand', pat_id: 2, doc_id: 5 })
v4 = Visit.create({ date: '2021-11-15 15:45:00', note: 'Stomach pain', pat_id: 1, doc_id: 4 })
v4 = Visit.create({ date: '2021-11-15 15:45:00', note: 'Anywhere pain', pat_id: 1, doc_id: 5 })

p "Created #{Visit.count} visits"
