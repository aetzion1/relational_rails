require 'rails_helper'

RSpec.describe "Instrument Index" do
    describe "As a visitor" do
        describe "When I visit /instruments I see each Instrument and their attributes" do
            it "Shows each instrumnt and their attributes in order" do
                clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)
                # violin = Section.create!(name: 'Violin', created_date: '2000-03-29', cartage: false)

                p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
                vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)
                # p_violin = Instrument.create!(name: 'Principal', date_hired: '2006-04-20', age: 13, section_id: violin.id)
                # vp_violin = Instrument.create!(name: 'Vice Principal', date_hired: '2020-02-17', age: 58, section_id: violin.id)

                visit "/instruments"
                # save_and_open_page
                expect(page).to have_content(p_clarinet.name)
                expect(page).to have_content(p_clarinet.date_hired)
                expect(page).to have_content(p_clarinet.age)

                expect(page.text.index(p_clarinet.name)).to be < page.text.index(vp_clarinet.name)
                expect(page).to have_content(p_clarinet.created_at)
                expect(page).to have_content(vp_clarinet.created_at)

                expect(p_clarinet.section_id).to eq(clarinet.id)
            end
        end

        describe "When I visit /sections/:section_id/instruments I see each instrument within that section and their attributes" do
            it "Shows section instruments and their attributes" do
                clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)

                p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
                vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)

                visit "/sections/#{clarinet.id}/instruments"

                expect(page).to have_content(clarinet.name)
                expect(page).to have_content(p_clarinet.name)
                expect(page).to have_content(p_clarinet.date_hired)
                expect(page).to have_content(p_clarinet.age)
            end
        end
        describe "when I visit a section's instrument index page" do
          it "shows the number of instruments associated with the section" do
            clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)

            p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
            vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)

            visit "/sections/#{clarinet.id}/instruments"
            save_and_open_page

            fill_in 'age', with: '50'
            click_on 'Only return instruments over the age of:'  

            expect(current_path).to eq("/instruments")
            expect(page).to have_content(clarinet.count_instruments)
          end
        end

  end
end
