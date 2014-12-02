
class HackathonsController < ApplicationController

  def show
    find_hackathon
    redirect_to "/dashing/dashboards/hackathon?id=#{@hackathon.id}"
  end

  def new
  	@hackathon = Hackathon.new
  end

  def create
  	@hackathon = Hackathon.create(params.require(:hackathon).permit(:name, :end_time))
  	redirect_to "/dashing/dashboards/hackathon?id=#{@hackathon.id}"
  end

  private

  def find_hackathon
    @hackathon = Hackathon.find(params[:id])
  end

end
