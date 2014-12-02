module Dashing
  class DashboardsController < ApplicationController

    before_filter :add_dashboard_request, only: :index
    before_filter :check_dashboard_name, only: :show

    rescue_from ActionView::MissingTemplate, with: :template_not_found

    def index
      render file: dashboard_path(Dashing.config.default_dashboard || Dashing.first_dashboard || ''), layout: Dashing.config.dashboard_layout_path
    end

    def show
      hackathon = Hackathon.find_by(:id => params[:id])
      @name = hackathon.name
      @end_time = hackathon.end_time
      @id = hackathon.id
      @projects = hackathon.projects.all
      render file: dashboard_path(params[:name]), layout: Dashing.config.dashboard_layout_path
    end

    private

    def check_dashboard_name
      raise 'bad dashboard name' unless params[:name] =~ /\A[a-zA-z0-9_\-]+\z/
    end

    def dashboard_path(name)
      Dashing.config.dashboards_views_path.call.join(name)
    end

    def template_not_found
      raise "Could not find template for dashboard '#{params[:name]}'. Define your dashboard in #{dashboard_path('')}"
    end

    def add_dashboard_request
      DashboardRequest.create
    end

  end
end
