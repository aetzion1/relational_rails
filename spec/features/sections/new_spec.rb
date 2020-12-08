require 'rails_helper'

describe "New Section" do
  describe 'As a visitor' do
    describe 'When I visit the new section form by clicking a link on the index' do

      it 'I can create a new section' do
        visit '/sections/'

        click_link 'New Section'

        expect(current_path).to eq('/sections/new')

        fill_in 'Name', with: 'Trumpet'
        fill_in 'created_date', with: '2015-02-15'
        fill_in 'Cartage', with: false
        click_on 'Create Section'

        expect(current_path).to eq("/sections")
        expect(page).to have_content('Trumpet')
      end
    end
  end
end
