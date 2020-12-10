class SectionsController < ApplicationController

  def index
    # if params["commit"] == "submit"
      # @sections = section.by_sections
    # if params[:sort]
    #   @sections = Section.all.sort_by(&:count_instruments)
    # else
      @sections = Section.order(cartage: :desc).order(:created_at)
    # end
  end

  def show
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.create!(section_params)
    redirect_to "/sections"
  end

  def new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    @section.update(section_params)
    redirect_to "/sections/#{@section.id}"
  end

  def destroy
    Section.destroy(params[:id])
    redirect_to "/sections"
  end

private
  def section_params
    params.permit(:name, :created_date, :cartage)
  end

end
