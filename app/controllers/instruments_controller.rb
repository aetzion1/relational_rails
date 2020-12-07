class InstrumentsController < ApplicationController

    def index
        @instruments = Instrument.all
    end

    def show
        @instrument = Instrument.find(params[:id])
    end

    private
    def instrument_params
        params.permit(:name, :date_hired, :age)
    end

end