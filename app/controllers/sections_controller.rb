class SectionsController < ApplicationController

  def index
    @sections = Section.all
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

private
  def section_params
    params.permit(:name, :created_date)
  end

end
