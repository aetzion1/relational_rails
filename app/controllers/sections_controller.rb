class SectionsController < ApplicationController

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def create
    section = Section.new(section_params)
    section.save!
    redirect_to "/sections"
  end

  def new
    @section = Section.new({name: params[:section][:title],
                           section_full: params[:section][:section_full]
                           })
  end

private

  def section_params
    params.permit(:name, :section_full, :play_count)
  end
end
