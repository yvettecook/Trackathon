require 'byebug'

class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def edit
  	@project = Project.find(params[:id])
  	@project.update(params.permit(:product, :design, :frontdev, :backdev, :presentation))
  	render 'new'
  end

  def update
  	@project = Project.find(params[:id])
  	@project.update(params[:project].permit(:product, :design, :frontdev, :backdev, :presentation))
  	render 'new'

  end



end
