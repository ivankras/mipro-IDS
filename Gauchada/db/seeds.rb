# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creo usuarios administradores"
Usuario.create(nombre: "Nancy", apellido: "Netramonti", email: "nancy@gauchada.com", fecha_nacimiento: Date.new(1967,6,16), telefono: 542262106509, password: "Abracadabra", admin: true)
Usuario.create(nombre: "Ulises", apellido: "Sunetri", email: "ulises@gauchada.com", fecha_nacimiento: Date.new(1963,3,15), telefono: 542211097607, password: "Abracadabra", admin: true)
Usuario.create(nombre: "Iván", apellido: "Krasowski Bissio", email: "ivankras@hotmail.com", fecha_nacimiento: Date.new(1996,4,30), telefono: 542314401890, password: "Abracadabra")
Usuario.create(nombre: "Rocío", apellido: "Madou", email: "rocio.madou@hotmail.com", fecha_nacimiento: Date.new(1995,9,27), telefono: 542346571510, password: "Abracadabra")
Usuario.create(nombre: "Gonzalo Julián", apellido: "Poch", email: "gonzalopoch@hotmail.com", fecha_nacimiento: Date.new(1996,4,29), telefono: 542215794999, password: "Abracadabra")

puts "Creo algunos logros"
Logro.create(nombre: "Promedio", puntaje_min: 0, puntaje_max: 10)
Logro.create(nombre: "Piola", puntaje_min: 11, puntaje_max: 20)
Logro.create(nombre: "Buena Persona", puntaje_min: 21, puntaje_max: 30)
Logro.create(nombre: "Capo", puntaje_min: 31, puntaje_max: 100)
Logro.create(nombre: "Juan Pablo II", puntaje_min: 101, puntaje_max: 2000)