require 'rails_helper'

describe 'Section show page' do
  it 'Shows the section data' do
    clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)

    p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
    vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)

    visit "/sections/#{clarinet.id}"
    expect(page).to have_content(clarinet.name)
    expect(page).to have_content(clarinet.created_date)
    expect(page).to have_content(clarinet.cartage)
  end

  it 'It displays an update section link that links to the update page' do
    clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)

    p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
    vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)


    visit "/sections/#{clarinet.id}"

    click_link 'Update Section'

    expect(current_path).to eq ("/sections/#{clarinet.id}/edit")

    fill_in 'Name', with: 'Clarinet'
    fill_in 'Created Date', with: '2005-02-01'
    fill_in 'Cartage', with: false
    click_on 'Update Section'

    expect(current_path).to eq("/sections/#{clarinet.id}")
    expect(page).to have_content('2005-02-01')
  end

  it 'It displays an delete section link that redirects to the index page' do
    clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)

    p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
    vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)

    visit "/sections/#{clarinet.id}"

    click_button 'Delete Section'

    expect(current_path).to eq("/sections")
    expect(current_path).to_not have_content(clarinet.name)
  end
end
