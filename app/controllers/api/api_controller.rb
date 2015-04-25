class Api::ApiController < ApplicationController
  # no fetch_user before_action here
  attr_accessor :current_user
  before_action :authenticate!

  # @return [User]
  def current_user
    if params[:email] && params[:token]
      @current_user ||= User.where(email: params[:email], token: params[:token]).first
    end
  end

  def authenticate!
    render json: {error: 'You are not logged in'} unless authenticated?
  end

  def authenticated?
    !!current_user
  end

  def anonymous!
    render json: {error: 'You are not logged in'} if authenticated?
  end
end