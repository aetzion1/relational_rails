class InstrumentsController < ApplicationController

    def index
        @instruments = Instrument.all
    end

    def list
        @section_id = params[:id]
        @section_name = Section.where(id: @section_id)[0].name
        @instruments = Instrument.where(section_id: @section_id)
    end

    def show
        @instrument = Instrument.find(params[:id])
        @section_name = Section.where(id: @instrument.section_id)[0].name
    end

    # private
    # def instrument_params
    #     params.permit(:name, :date_hired, :age)
    # end

end