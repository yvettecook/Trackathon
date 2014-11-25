class HackathonsController < ApplicationController

  def show
    @hackathon = Hackathon.find(params[:id])
    redirect_to '/dashing/dashboards/september'
  end
end
