class HomeController < ApplicationController

  def index
    @hackathons = Hackathon.all
  end
  
end
