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

    def new

    end

    def create
      @section = Section.find(params[:id])
      require 'pry'; binding.pry
      @section_id = @section.id
      @instrument = @section.instruments.create!(instrument_params)
      redirect_to "/sections/#{@section_id}/instruments"
    end

    private
    def instrument_params
        params.permit(:name, :date_hired, :age)
    end

end