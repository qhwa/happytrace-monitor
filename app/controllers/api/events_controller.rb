class Api::EventsController < ApplicationController

  def index
    @project = Project.find('53f9a11171687739dc010000')
    @events  = @project.events
    @count   = @events.count
    since    = params[:since]
    @events  = @events.where( :created_at.gt => since ) if since.present?
    @events  = @events.order('created_at DESC')
  end

  def show
  end
end
