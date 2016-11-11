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

f = Favor.count

Favor.create!([{
	titulo: "Donald Trump",
	foto_url: "https://cdn.theatlantic.com/assets/media/img/2016/05/select_32/hero_wide_640.jpg?1463509000",
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
	foto_url: "https://pbs.twimg.com/profile_images/473506797462896640/_M0JJ0v8.png",
	descripcion: "Esto es una prueba.",
	ciudad: "Tokio",
}])

puts "Creo #{Favor.count - f} favores. Hay #{Favor.count} favores en total."



c = Comentario.count


Comentario.create!([{
	descripcion: "Qué tal?",
	respuesta: "Todo bien",
	favor_id: Favor.first.id,
	},
	{
	descripcion: "Cómo te llamas?",
	respuesta: "Carlitos",
	favor_id: Favor.first.id,
	},
	{
	descripcion: "No tengo respuesta.",
	favor_id: Favor.first.id,
}])

puts "Creo #{Comentario.count - c} comentarios. Hay #{Comentario.count} comentarios en total."

puts "Creación de usuarios"
Usuario.find_or_create_by(nombre: "Nancy", apellido: "Netramonti", sexo: "femenino", fecha_nacimiento: Date.new(1967,6,16), telefono: 542262106509, email: "nancy@gauchada.com", password: "abracadabra", admin: true); 
Usuario.find_or_create_by(nombre: "Ulises", apellido: "Sunetri", sexo: "masculino", fecha_nacimiento: Date.new(1963,3,15), telefono: 542211097607, email: "ulises@gauchada.com", password: "abracadabra", admin: true); 
Usuario.find_or_create_by(nombre: "Rocío", apellido: "Madou", sexo: "femenino", fecha_nacimiento: Date.new(1995,9,27), telefono: 542346571510, email: "rocio.madou@hotmail.com", password: "Abracadabra", admin: true); 
Usuario.find_or_create_by(nombre: "Iván", apellido: "Krasowski Bissio", sexo: "masculino", fecha_nacimiento: Date.new(1996,4,30), telefono: 542314401890, email: "ivankras@hotmail.com", password: "Abracadabra", admin: true); 
Usuario.find_or_create_by(nombre: "Gonzalo Julián", apellido: "Poch", sexo: "masculino", fecha_nacimiento: Date.new(1996,4,29), telefono: 542215794999, email: "gonzalopoch@hotmail.com", password: "Abracadabra", admin: true); 
Usuario.find_or_create_by(nombre: "Perla", apellido: "Bassi", sexo: "femenino", fecha_nacimiento: Date.new(1957,10,24), telefono: 542345773457, email: "@hotmail.com", password: "Abracadabra");
Usuario.find_or_create_by(nombre: "Hector", apellido: "Petrón", sexo: "masculino", fecha_nacimiento: Date.new(1954,01,10), telefono: 542673457823, email: "@hotmail.com", password: "Abracadabra");