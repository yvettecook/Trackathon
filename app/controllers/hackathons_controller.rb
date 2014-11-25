class HackathonsController < ApplicationController

  def show
    @hackathon = Hackathon.find(params[:id])
  end
end
