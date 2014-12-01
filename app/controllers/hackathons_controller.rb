
class HackathonsController < ApplicationController

  def show
    @hackathon = Hackathon.find(params[:id])
    # @project = Project.find(params[:hackathon_id])
    @name = @hackathon.name
    redirect_to '/dashing/dashboards/september'
  end

  def new
  	@hackathon = Hackathon.new
  end

  def create
  	@hackathon = Hackathon.create(params.require(:hackathon).permit(:name, :end_time))
  	redirect_to '/dashing/dashboards/september' # hard coded --> '/dashing/dashboards/project'
  end


end
