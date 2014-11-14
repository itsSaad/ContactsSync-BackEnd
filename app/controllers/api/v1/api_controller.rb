class Api::V1::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  before_action :check_app_api_key_presence




  def check_app_api_key_presence
    app_key = params[:app_id]
    app = App.find_by_api_key(app_key)
    if !app
      render :json => {
        message: "Invalid API Key. Please provide valid key."
      }, status: 401
    end
  end
end
