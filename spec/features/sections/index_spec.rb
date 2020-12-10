require 'rails_helper'

RSpec.describe 'Section index page' do
    describe 'as a visitor' do
        describe 'I visit the index page' do
            it  'Can show section names in order of cartage and created time' do
                clarinet = Section.create!(
                    name: 'Clarinet',
                    created_date: '2005-01-01',
                    cartage: true
                )
                violin = Section.create!(
                    name: 'Violin',
                    created_date: '2000-03-29',
                    cartage: false
                )

                visit "/sections/"

                expect(page).to have_content(clarinet.name)
                expect(page).to have_content(violin.name)
                expect(page.text.index(clarinet.name)).to be < page.text.index(violin.name)
                expect(page).to have_content(violin.created_at)
                expect(page).to have_content(clarinet.created_at)
            end

            it 'shows a link to edit the section info and takes me to the edit page' do
              clarinet = Section.create!(
                  name: 'Clarinet',
                  created_date: '2005-01-01',
                  cartage: true
              )
              violin = Section.create!(
                  name: 'Violin',
                  created_date: '2000-03-29',
                  cartage: false
              )

              visit "/sections/"
              expect(page).to have_button('Edit')
              expect(page).to have_button('Edit')
              #, :href "/sections/#{violin.id}/edit")
              click_on "Edit", href: "/sections/#{clarinet.id}/edit"
              expect(current_path).to eq("/sections/#{clarinet.id}/edit")
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

            it "can sort sections by number of instruments" do
                clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)
                violin = Section.create!(name: 'Violin', created_date: '2000-03-29', cartage: false)

                p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
                p_violin = Instrument.create!(name: 'Principal', date_hired: '2006-04-20', age: 13, section_id: violin.id)
                vp_violin = Instrument.create!(name: 'Vice Principal', date_hired: '2020-02-17', age: 58, section_id: violin.id)

                visit '/sections'

                click_link 'Sort by Total Instruments'

                expect(current_path).to eq('/sections')
                expect(page.all('h3')[0]).to have_content(violin.name)
                expect(page.all('h3')[1]).to have_content(clarinet.name)
                expect(page).to have_content(violin.count_instruments)
                expect(page).to have_content(clarinet.count_instruments)
            end
        end
    end
end
