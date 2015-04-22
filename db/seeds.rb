#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
sexes = Sex.create([
  { name: 'Masculino'},
  { name: 'Femenino'}
 ])

countries = Country.create([
  { name: 'Argentina'},
  { name: 'Uruguay'},
  { name: 'Chile'},
  { name: 'Paraguay'},
  { name: 'Brasil'},
  { name: 'Bolivia'}
])

provinces = Province.create([
  { name: 'Salta', country: Country.find_by_name('Argentina') },
  { name: 'Jujuy', country: Country.find_by_name('Argentina') },
  { name: 'Tucuman', country: Country.find_by_name('Argentina') },
  { name: 'Formosa', country: Country.find_by_name('Argentina') },
  { name: 'Santiago del Estero', country: Country.find_by_name('Argentina') },
  { name: 'Catamarca', country: Country.find_by_name('Argentina') },
  { name: 'Chaco', country: Country.find_by_name('Argentina') },
  { name: 'Buenos Aires', country: Country.find_by_name('Argentina') },
  { name: 'La Rioja', country: Country.find_by_name('Argentina') },
  { name: 'San Luis', country: Country.find_by_name('Argentina') },
  { name: 'Cordoba', country: Country.find_by_name('Argentina') },
  { name: 'Misiones', country: Country.find_by_name('Argentina') },
  { name: 'Entre Rios', country: Country.find_by_name('Argentina') },
  { name: 'Corrientes', country: Country.find_by_name('Argentina') },
  { name: 'Santa Fe', country: Country.find_by_name('Argentina') },
  { name: 'Mendoza', country: Country.find_by_name('Argentina') },
  { name: 'La Pampa', country: Country.find_by_name('Argentina') },
  { name: 'Chubut', country: Country.find_by_name('Argentina') },
  { name: 'Rio Negro', country: Country.find_by_name('Argentina') },
  { name: 'Santa Cruz', country: Country.find_by_name('Argentina') },
  { name: 'Tierra del Fuego', country: Country.find_by_name('Argentina') },
  { name: 'Neuquen', country: Country.find_by_name('Argentina') },
  { name: 'Islas Malvinas', country: Country.find_by_name('Argentina') },
  { name: 'Valparaiso', country: Country.find_by_name('Chile') },
  { name: 'Vina del Mar', country: Country.find_by_name('Chile') }
])

cities = City.create([
  { name: 'Salta', province: Province.find_by_name('Salta')},
  { name: 'Rosario de Lerma', province: Province.find_by_name('Salta')},
  { name: 'Cerrillos', province: Province.find_by_name('Salta')},
  { name: 'El Carril', province: Province.find_by_name('Salta')},
  { name: 'Coronel Moldes', province: Province.find_by_name('Salta')},
  { name: 'San Miguel de Tucuman', province: Province.find_by_name('Tucuman')},
  { name: 'Yerba Buena', province: Province.find_by_name('Tucuman')},
  { name: 'Amaicha del Valle', province: Province.find_by_name('Tucuman')}
])


# Datos de ejemplo
users = User.create([
    { email: "german@martinez.com", first_name: "Germán", last_name: "Martínez",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino"),
    photo_url: "/img/1.jpg"},
    { email: "ned@stark.com", first_name: "Ned", last_name: "Stark",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino"),
    photo_url: "/img/2.jpg"},
    { email: "catelyn@stark.com", first_name: "Catelyn", last_name: "Stark",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Femenino"),
    photo_url: "/img/3.jpg"},
    { email: "jon@snow.com", first_name: "Jon", last_name: "Snow",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino"),
    photo_url: "/img/4.png"},
    { email: "tyrion@lannister.com", first_name: "Tyrion", last_name: "Lannister",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino"),
    photo_url: "/img/5.jpg"},
    { email: "robert@baratheon.com", first_name: "Robert", last_name: "Baratheon",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino"),
    photo_url: "/img/6.jpg"},
    { email: "danny@targaryen.com", first_name: "Dany", last_name: "Targaryen",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Femenino"),
    photo_url: "/img/7.jpg"},
    { email: "khal@drogo.com", first_name: "Khal", last_name: "Drogo",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino"),
    photo_url: "/img/8.jpg"}
])

mircoposts = Micropost.create([
    { content: "Bienvenidos a RestOnLine!", user: User.first },
    { content: "Winter is coming!", user: User.second },
    { content: "Dónde están mis dragones???", user: User.find_by_first_name("Danny") },
    { content: "Bran! No trepes más las paredes...", user: User.find_by_first_name("Catelyn") },
    { content: "Una mente necesita libros, así como una espada necesito ser afilada", user: User.find_by_first_name("Tyrion") },
    { content: "Mi luna y estrellas", user: User.find_by_first_name("Khal") },
    { content: "Ah! No sé nada yo...", user: User.find_by_first_name("Jon") }
])

commerce = Commerce.create([
  { name: 'Mak Lucas', user: User.first },
  { name: 'El Nacional', user: User.last }
])

branches = Branch.create([
  { name: 'Tres Cerritos', address: 'Virrey Toledo 1354', phone: '(0387) 4215239',
    city: City.find_by_name('Salta'), photo_url: "/img/maklucas.jpg",
    commerce: Commerce.find_by_name('Mak Lucas') },
  { name: 'El Tribuno', address: 'Barrio el Tribuno', phone: '(0387) 4225588',
    city: City.find_by_name('Salta'), photo_url: "/img/maklucas.jpg",
    commerce: Commerce.find_by_name('Mak Lucas') },
  { name: 'El Nacional I', address: 'Virrey Toledo 256', phone: '(0387) 4336699',
    city: City.find_by_name('Salta'), photo_url: "/img/elnacional.jpg",
    commerce: Commerce.find_by_name('El Nacional') }
])

admins = Administrator.create([
  { user: User.first, branch: Branch.find_by_name('Tres Cerritos')},
  { user: User.first, branch: Branch.find_by_name('El Tribuno')},
  { user: User.last, branch: Branch.find_by_name('El Nacional I')}
])

items = Item.create([
  { name: "Hamburguesa", description: "Hamburguesa Paty en pan Bimbo con aderezos e ingredientes a elección",
    price: 35.3, photo: "/img/hamburguesa.jpg", branch: Branch.first },
  { name: "Lomito", description: "Lomito de ternera o cerdo en pan comun o arabe",
    price: 37.5, photo: "/img/lomito.jpg", branch: Branch.first },
  { name: "Pizza Fugazzeta", description: "Pizza con mucha cebolla dorada y cruda. Con queso muzzarella",
    price: 65.5, photo: "/img/fugazzeta.jpg", branch: Branch.first },
  { name: "Cerveza Corona x 350ml.", description: "Cerveza Corona importada de primer nivel. Botella de 350 ml.",
    price: 26.65, photo: "/img/cerveza.jpg", branch: Branch.first }
])



