class TracelogsController < ApplicationController

  def create
    @tracelog = Tracelog.new tracelog_params
    @tracelog.remote_ip = request.remote_ip
    @tracelog.raw_json = JSON.parse( params[:data] ) if params[:data].present?

    if @tracelog.save
      respond_to do |format|
        format.json { render json: { success: true } }
      end
    else
      respond_to do |format|
        format.json { render json: { success: false, errors: @tracelog.errors } }
      end
    end
  end

  private

    def tracelog_params
      params.permit(:client_id, :project_id)
    end

end
