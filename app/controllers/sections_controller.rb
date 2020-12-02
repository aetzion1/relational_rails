class SectionsController < ApplicationController

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def create
    section = Section.new({name: params[:section][:title],
                           section_full: params[:section][:section_full]
                           })
    section.save
    redirect_to '/sections'
  end

  def new

  end
end
