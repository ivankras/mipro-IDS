# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creo usuarios administradores"
Usuario.find_or_create_by(nombre: "Nancy", apellido: "Netramonti", email: "nancy@gauchada.com", fecha_nacimiento: Date.new(1967,6,16), telefono: 542262106509, password: "Abracadabra", admin: true)
Usuario.find_or_create_by(nombre: "Ulises", apellido: "Sunetri", email: "ulises@gauchada.com", fecha_nacimiento: Date.new(1963,3,15), telefono: 542211097607, password: "Abracadabra", admin: true)
Usuario.find_or_create_by(nombre: "Iván", apellido: "Krasowski Bissio", email: "ivankras@hotmail.com", fecha_nacimiento: Date.new(1996,4,30), telefono: 542314401890, password: "Abracadabra")
Usuario.find_or_create_by(nombre: "Rocío", apellido: "Madou", email: "rocio.madou@hotmail.com", fecha_nacimiento: Date.new(1995,9,27), telefono: 542346571510, password: "Abracadabra")
Usuario.find_or_create_by(nombre: "Gonzalo Julián", apellido: "Poch", email: "gonzalopoch@hotmail.com", fecha_nacimiento: Date.new(1996,4,29), telefono: 542215794999, password: "Abracadabra")

puts "Creo algunos logros"
Logro.find_or_create_by(nombre: "Promedio", puntaje_min: 0, puntaje_max: 10)
Logro.find_or_create_by(nombre: "Piola", puntaje_min: 11, puntaje_max: 20)
Logro.find_or_create_by(nombre: "Buena Persona", puntaje_min: 21, puntaje_max: 30)
Logro.find_or_create_by(nombre: "Capo", puntaje_min: 31, puntaje_max: 100)
Logro.find_or_create_by(nombre: "Juan Pablo II", puntaje_min: 101, puntaje_max: 2000)

Favor.create!([{
	titulo: "Donald Trump",
	foto_URL: "https://cdn.theatlantic.com/assets/media/img/2016/05/select_32/hero_wide_640.jpg?1463509000",
	descripcion: "Donald John Trump was elected the 45th president of the United States on Tuesday in a stunning culmination of an explosive, populist and polarizing campaign that took relentless aim at the institutions and long-held ideals of American democracy.

	The surprise outcome, defying late polls that showed Hillary Clinton with a modest but persistent edge, threatened convulsions throughout the country and the world, where skeptics had watched with alarm as Mr. Trump’s unvarnished overtures to disillusioned voters took hold.

	The triumph for Mr. Trump, 70, a real estate developer-turned-reality television star with no government experience, was a powerful rejection of the establishment forces that had assembled against him, from the world of business to government, and the consensus they had forged on everything from trade to immigration.",
	ciudad: "New York",
	},
	{
	titulo: "Favor Sin Foto",
	descripcion: "Dale a tu cuerpo alegria macarena que tu cuerpo es pa darle alegria y cosa buena",
	ciudad: "Yapeyú",
	},
	{
	titulo: "Favor Prueba",
	foto_URL: "https://pbs.twimg.com/profile_images/473506797462896640/_M0JJ0v8.png",
	descripcion: "Esto es una prueba.",
	ciudad: "Tokio",
}])

puts "Creo #{Favor.count} favores."