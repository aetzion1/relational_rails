require 'rails_helper'

describe 'Section show page' do
  it 'Shows the section data' do
    clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', section_full: false)

    p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', section_id: clarinet.id)
    vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', section_id: clarinet.id)

    visit "/sections/#{clarinet.id}"
    expect(page).to have_content(clarinet.name)
    expect(page).to have_content(clarinet.created_date)
    expect(page).to have_content(clarinet.section_full)
  end
end
