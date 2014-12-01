
class HackathonsController < ApplicationController

  def show
    @hackathon = Hackathon.find(params[:id])
    redirect_to "/dashing/dashboards/september?id=#{@hackathon.id}"
  end

  def new
  	@hackathon = Hackathon.new
  end

  def create
  	@hackathon = Hackathon.create(params.require(:hackathon).permit(:name, :end_time))
  	redirect_to "/dashing/dashboards/september?id=#{@hackathon.id}"
  end


end
