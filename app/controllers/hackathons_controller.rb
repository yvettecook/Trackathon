class HackathonsController < ApplicationController

  def show
    @hackathon = Hackathon.find(params[:id])
    @name = @hackathon.name
    redirect_to '/dashing/dashboards/september'
  end


end
