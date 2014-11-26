class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def edit
  	@project = Project.find(params[:id])
  	@project.update(params.permit(:product))
  	render 'new'
  end

  def update
  	@project = Project.find(params[:id])
  	@project.update(params[:project].permit(:product))
  	render 'new'

  end



end
