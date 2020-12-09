class InstrumentsController < ApplicationController

    def index
        @section_id = params['section_id']
        if @section_id.to_i > 0
            @instruments = Instrument.where(section_id: @section_id)
        else
            @instruments = Instrument.all
        end
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
        @section_id = params[:section_id]
    end

    def create
        @section_id = params[:section_id]
      @section = Section.find(params[:section_id])
      instrument = @section.instruments.create!(instrument_params)
      redirect_to "/sections/#{@section_id}/instruments"
    end

    private
    def instrument_params
        params.permit(:name, :date_hired, :age, :section_id)
    end

end