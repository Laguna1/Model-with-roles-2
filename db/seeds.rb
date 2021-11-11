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