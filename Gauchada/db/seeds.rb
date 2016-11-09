# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Creo algunos logros"
Logro.find_or_create_by(nombre: "Promedio", puntaje_min: 0, puntaje_max: 10)
Logro.find_or_create_by(nombre: "Piola", puntaje_min: 11, puntaje_max: 20)
Logro.find_or_create_by(nombre: "Buena Persona", puntaje_min: 21, puntaje_max: 30)
Logro.find_or_create_by(nombre: "Capo", puntaje_min: 31, puntaje_max: 100)
Logro.find_or_create_by(nombre: "Juan Pablo II", puntaje_min: 101, puntaje_max: 2000)