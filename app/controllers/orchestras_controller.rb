class OrchestrasController < ApplicationController

    def index
        @orchestras = Orchestra.all
    end

    def show
    end

    def create
    end

    def new
    end

end