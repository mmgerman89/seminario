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
    { email: "ned@stark.com", first_name: "Ned", last_name: "Stark",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino")},
    { email: "catelyn@stark.com", first_name: "Catelyn", last_name: "Stark",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Femenino")},
    { email: "jon@snow.com", first_name: "Jon", last_name: "Snow",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino")},
    { email: "tyrion@lannister.com", first_name: "Tiryon", last_name: "Lannister",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino")},
    { email: "robert@baratheon.com", first_name: "Robert", last_name: "Baratheon",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino")},
    { email: "danny@targaryen.com", first_name: "Danny", last_name: "Targaryen",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Femenino")},
    { email: "rob@arryn.com", first_name: "Robb", last_name: "Arryn",
    password: "asdasdasd", password_confirmation: "asdasdasd", sex: Sex.find_by_name("Masculino")}
])

commerce = Commerce.create([
  { name: 'Mak Lucas', user: User.first },
  { name: 'El Nacional', user: User.second }
])

branches = Branch.create([
  { name: '3C', address: 'Virrey Toledo 1354', phone: '(0387) 4215239',
    city: City.find_by_name('Salta'),
    commerce: Commerce.find_by_name('Mak Lucas') },
  { name: 'El Tribuno', address: 'Barrio el Tribuno', phone: '(0387) 4225588',
    city: City.find_by_name('Salta'),
    commerce: Commerce.find_by_name('Mak Lucas') },
  { name: 'El Nacional I', address: 'Virrey Toledo 256', phone: '(0387) 4336699',
    city: City.find_by_name('Salta'),
    commerce: Commerce.find_by_name('El Nacional') }
])

admins = Administrator.create([
  { user: User.first, branch: Branch.find_by_name('3C')},
  { user: User.first, branch: Branch.find_by_name('El Tribuno')},
  { user: User.second, branch: Branch.find_by_name('El Nacional I')}
])



