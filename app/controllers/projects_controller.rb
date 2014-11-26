require 'byebug'

class ProjectsController < ApplicationController

  def new
    @hackathon = Hackathon.find(params[:hackathon_id])
    @project = Project.new
  end

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

  def create
    @hackathon = Hackathon.find(params[:hackathon_id])
    @project = @hackathon.projects.create(project_params)
    redirect_to "/projects/#{@project.id}"
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
