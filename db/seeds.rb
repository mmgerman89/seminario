# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
  { name: 'Islas Malvinas', country: Country.find_by_name('Argentina') }
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

categories = Category.create([
  { name: 'Restaurante' },
  { name: 'Bar' },
  { name: 'China' },
  { name: 'Argentina' },
  { name: 'Arabe' },
  { name: 'Picadas' },
  { name: 'Italiana' },
  { name: 'Espanola' }
])

types = Type.create([
  { name: 'Principal' },
  { name: 'Sucursal'}
])

commerce = Commerce.create([
  { name: 'Mak Lucas' }
])

branches = Branch.create([
  { name: '3C', address: 'Virrey Toledo 1354', phone: '(0387) 4215239',
    commerce: Commerce.find_by_name('Mak Lucas') }
])
