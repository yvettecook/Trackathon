
class HackathonsController < ApplicationController

  def show
    @hackathon = Hackathon.find(params[:id])
    @name = @hackathon.name
    redirect_to '/dashing/dashboards/september'
  end

  def new
  	@hackathon = Hackathon.new
  end

  def create
  	@hackathon = Hackathon.create(params.require(:hackathon).permit(:name, :end_time))
  	redirect_to '/dashing/dashboards/september'
  end


end
