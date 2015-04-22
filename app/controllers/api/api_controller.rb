class Api::ApiController < ApplicationController
  # no fetch_user before_action here
  attr_accessor :current_user

  def current_user
    @current_user ||= User.first(name: params[:name], token: params[:token])
  end
end