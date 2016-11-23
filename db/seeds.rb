# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if true
	
	Logro.destroy_all
	puts "Creo algunos logros"
	Logro.create(id: 1, nombre: "Promedio", puntaje_min: 0, puntaje_max: 10)
	Logro.create(nombre: "Piola", puntaje_min: 11, puntaje_max: 20)
	Logro.create(nombre: "Buena Persona", puntaje_min: 21, puntaje_max: 30)
	Logro.create(nombre: "Capo", puntaje_min: 31, puntaje_max: 100)
	Logro.create(nombre: "Juan Pablo II", puntaje_min: 101, puntaje_max: 2000)
	Logro.create(id: 8000, nombre: "Sin Logro", puntaje_min: -8000, puntaje_max: 7999, activo: false)

end

if true
	
	f = Favor.count

	Favor.destroy_all
	Favor.create!([{
		titulo: "Donald Trump",
		foto_url: "https://cdn.theatlantic.com/assets/media/img/2016/05/select_32/hero_wide_640.jpg?1463509000",
		descripcion: "Donald John Trump was elected the 45th president of the United States on Tuesday in a stunning culmination of an explosive, populist and polarizing campaign that took relentless aim at the institutions and long-held ideals of American democracy.
	
		The surprise outcome, defying late polls that showed Hillary Clinton with a modest but persistent edge, threatened convulsions throughout the country and the world, where skeptics had watched with alarm as Mr. Trump’s unvarnished overtures to disillusioned voters took hold.
	
		The triumph for Mr. Trump, 70, a real estate developer-turned-reality television star with no government experience, was a powerful rejection of the establishment forces that had assembled against him, from the world of business to government, and the consensus they had forged on everything from trade to immigration.",
		ciudad: "New York",
		usuario_id: 7998,
		},
	   {
	   titulo: "Ecuación sencilla",
	   foto_url: "http://static.vix.com/es/sites/default/files/styles/large/public/btg/curiosidades.batanga.com/files/7-hermosas-ecuaciones-matematicas-que-tienes-que-conocer-6.jpg?itok=JsP0xHhe.jpg",
	   descripcion: "Por favor, necesito algún matemático que pueda resolverme esta duda. Estoy hace unos días tratando de resolver esta sencilla ecuación, que está resultando no ser tan sencilla para mí. Gracias por su colaboración",
	   ciudad: "Londres, Catamarca",
	   usuario_id: 7999,
	   },
	   {
	   titulo: "¡Encontrar al payaso!",
	   foto_url: "http://i2.esmas.com/2016/04/26/858946/eso-el-payaso-624x351.jpg",
	   descripcion: "Este payaso se escapó el día viernes último de la facultad de Informática. Dicen que anda paseando en el Ecobus. Necesito que lo encuentren y lo reporten a la oficina de alumnos. ¿Voluntarios?",
	   ciudad: "La Plata",
	   usuario_id: 7999,
	   },
		{
		titulo: "Favor Sin Foto",
		descripcion: "Dale a tu cuerpo alegria macarena que tu cuerpo es pa darle alegria y cosa buena",
		ciudad: "Yapeyú",
		usuario_id: 8000,
		},
		{
		titulo: "Favor Prueba",
		foto_url: "https://pbs.twimg.com/profile_images/473506797462896640/_M0JJ0v8.png",
		descripcion: "Esto es una prueba.",
		ciudad: "Tokio",
		usuario_id: 7998,
	}])
	
	puts "Creo #{Favor.count - f} favores. Hay #{Favor.count} favores en total."


	Comentario.destroy_all
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

end

if true

	Usuario.destroy_all
	puts "Creación de usuarios"
	Usuario.create(id: 1, nombre: "Nancy", apellido: "Netramonti", sexo: "femenino", fecha_nacimiento: Date.new(1967,6,16), telefono: 542262106509, email: "nancy@gauchada.com", password: "abracadabra", admin: true); 
	Usuario.create(id: 2, nombre: "Ulises", apellido: "Sunetri", sexo: "masculino", fecha_nacimiento: Date.new(1963,3,15), telefono: 542211097607, email: "ulises@gauchada.com", password: "abracadabra", admin: true); 
	Usuario.create(id: 3, nombre: "Rocío", apellido: "Madou", sexo: "femenino", fecha_nacimiento: Date.new(1995,9,27), telefono: 542346571510, email: "rocio.madou@hotmail.com", password: "Abracadabra", admin: true); 
	Usuario.create(id: 4, nombre: "Iván", apellido: "Krasowski Bissio", sexo: "masculino", fecha_nacimiento: Date.new(1996,4,30), telefono: 542314401890, email: "ivankras@hotmail.com", password: "Abracadabra", admin: true); 
	Usuario.create(id: 5, nombre: "Gonzalo Julián", apellido: "Poch", sexo: "masculino", fecha_nacimiento: Date.new(1996,4,29), telefono: 542215794999, email: "gonzalopoch@hotmail.com", password: "Abracadabra", admin: true); 
	Usuario.create(id: 7998, nombre: "Perla", apellido: "Bassi", sexo: "femenino", fecha_nacimiento: Date.new(1957,10,24), telefono: 542345773457, email: "aa@hotmail.com", password: "Abracadabra", logro_id: 1);
	Usuario.create(id: 7999, nombre: "Hector", apellido: "Petrón", sexo: "masculino", fecha_nacimiento: Date.new(1954,01,10), telefono: 542673457823, email: "bb@hotmail.com", password: "Abracadabra", logro_id: 1);
	Usuario.create(id: 8000, nombre: "Usuario", apellido: "Prueba", sexo: "masculino", fecha_nacimiento: Date.new(1990,01,12), telefono: 542673457823, email: "prueba@gauchada.com", password: "abracadabra", logro_id: 1);

end