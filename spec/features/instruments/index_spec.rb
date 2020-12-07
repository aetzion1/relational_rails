require 'rails_helper'

RSpec.describe "Instrument Index" do
    describe "As a visitor" do
        describe "When I visit /instruments I see each Instrument and their attributes" do
            it "Shows each instrumnt and their attributes" do
                clarinet = Section.create!(name: 'Clarinet', created_date: '2005-01-01', cartage: false)
                # violin = Section.create!(name: 'Violin', created_date: '2000-03-29', cartage: false)
                
                p_clarinet = Instrument.create!(name: 'Principal', date_hired: '2020-03-29', age: 52, section_id: clarinet.id)
                vp_clarinet = Instrument.create!(name: 'Vice Principal', date_hired: '2010-04-15', age: 24, section_id: clarinet.id)
                # p_violin = Instrument.create!(name: 'Principal', date_hired: '2006-04-20', age: 13, section_id: violin.id)
                # vp_violin = Instrument.create!(name: 'Vice Principal', date_hired: '2020-02-17', age: 58, section_id: violin.id)
                
                visit "/instruments"
                
                expect(page).to have_content(p_clarinet.name)
                expect(page).to have_content(p_clarinet.date_hired)
                expect(page).to have_content(p_clarinet.age)

                expect(p_clarinet.section_id).to eq(clarinet.id)
            end
        end
    end
end         