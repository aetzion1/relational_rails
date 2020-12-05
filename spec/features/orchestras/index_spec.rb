require 'rails_helper'

RSpec.describe 'Orchestra Index page' do
    describe 'As a visitor' do
        describe 'When I visit the orchestra index page' do

            it 'Can show orchestra names' do
                nyphil = Orchestra.create!(
                    name:'New York Philharmonic', 
                    date_established: '1842-04-02'
                )
                orpheus = Orchestra.create!(
                    name:'Orpheus Chamber Orchestra', 
                    date_established: '1972-01-01'
                )

                visit "/orchestras/"

                expect(page).to have_content(nyphil.name)
                expect(page).to have_content(orpheus.name)
            end

            it 'shows new Orchestra link' do
                nyphil = Orchestra.create!(
                    name:'New York Philharmonic', 
                    date_established: '1842-04-02'
                )
                orpheus = Orchestra.create!(
                    name:'Orpheus Chamber Orchestra', 
                    date_established: '1972-01-01'
                )

                visit "/orchestras/"

                expect(page).to have_link('New Section', href: "/orchestras/new")

                click_link 'New Orchestra'
                expect(current_path).to eq("/sections/new")
            end
        end
    end
end