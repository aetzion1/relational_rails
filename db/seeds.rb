# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Section.destroy_all
Instrument.destroy_all
Orchestra.destroy_all
Conductor.destroy_all

clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)
violin = Section.create!(name: 'Violin', created_date: '2000-03-29', cartage: false)

p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)
p_violin = Instrument.create!(name: 'Principal', date_hired: '2006-04-20', age: 13, section_id: violin.id)
vp_violin = Instrument.create!(name: 'Vice Principal', date_hired: '2020-02-17', age: 58, section_id: violin.id)

nyphil = Orchestra.create!(name:'New York Philharmonic', date_established: '1842-04-02')
orpheus = Orchestra.create!(name:'Orpheus Chamber Orchestra', date_established: '1972-01-01')

ureli = Conductor.create!(name:'Ureli Corelli Hill', current_conductor: false, years_in_residence: 7, orchestra_id: nyphil.id)
jaap = Conductor.create!(name:'Jaap van Zweden', current_conductor: true, years_in_residence: 4, orchestra_id: nyphil.id)