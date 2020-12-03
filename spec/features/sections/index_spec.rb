require 'rails_helper'

RSpec.describe 'Show name of each section' do
    
    it  'Can show section names' do
        clarinet = Section.create!(
            name: 'Clarinet', 
            created_date: '2005-01-01',
            section_full: false
        )
        violin = Section.create!(
            name: 'Violin', 
            created_date: '2000-03-29',
            section_full: true
        )

        visit "/sections/"

        expect(page).to have_content(clarinet.name)
        expect(page).to have_content(violin.name)
    end

end