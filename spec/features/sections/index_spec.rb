require 'rails_helper'

RSpec.describe 'Section index page' do

    it  'Can show section names' do
        clarinet = Section.create!(
            name: 'Clarinet',
            created_date: '2005-01-01',
        )
        violin = Section.create!(
            name: 'Violin',
            created_date: '2000-03-29',
        )

        visit "/sections/"

        expect(page).to have_content(clarinet.name)
        expect(page).to have_content(violin.name)
    end

    it 'shows parent link' do
      clarinet = Section.create!(
          name: 'Clarinet',
          created_date: '2005-01-01',
      )
      violin = Section.create!(
          name: 'Violin',
          created_date: '2000-03-29',
      )

      visit "/sections/"

      expect(page).to have_link('New Section', href: "/sections/new")

      click_link 'New Section'
      expect(current_path).to eq("/sections/new")
    end


end
