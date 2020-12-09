require 'rails_helper'

RSpec.describe 'Section index page' do

    it  'Can show section names in order' do
        clarinet = Section.create!(
            name: 'Clarinet',
            created_date: '2005-01-01',
            cartage: false
        )
        violin = Section.create!(
            name: 'Violin',
            created_date: '2000-03-29',
            cartage: false
        )

        visit "/sections/"
        save_and_open_page

        expect(page).to have_content(clarinet.name)
        expect(page).to have_content(violin.name)
        expect(page.text.index(clarinet.name)).to be < page.text.index(violin.name)
        expect(page).to have_content(violin.created_at)
        expect(page).to have_content(clarinet.created_at)
    end

    it 'shows parent link' do
      clarinet = Section.create!(
          name: 'Clarinet',
          created_date: '2005-01-01',
          cartage: false
      )
      violin = Section.create!(
          name: 'Violin',
          created_date: '2000-03-29',
          cartage: false
      )

      visit "/sections"

      expect(page).to have_link('New Section', href: "/sections/new")

      click_link 'New Section'
      expect(current_path).to eq("/sections/new")
    end


end
