# require 'byebug'

class ProjectsController < ApplicationController

  def new
    find_hackathon
    @project = Project.new
  end

  def show
    find_project
  end

  def edit
  	find_project
  	@project.update(params.permit(:product, :design, :frontdev, :backdev, :presentation))
  	render 'new'
  end

  def update
  	find_project
  	@project.update(params[:project].permit(:product, :design, :frontdev, :backdev, :presentation))
  	render 'new'
  end

  def create
    find_hackathon
    @project = @hackathon.projects.create(project_params)
    redirect_to "/projects/#{@project.id}"
  end

  def project_params
    params.require(:project).permit(:name)
  end

  def find_hackathon
    @hackathon = Hackathon.find(params[:hackathon_id])
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
