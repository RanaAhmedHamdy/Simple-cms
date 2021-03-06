class SectionController < ApplicationController
  layout "admin"

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "section '#{section.name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end
  end

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new({:name => "default"})
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  private
  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
