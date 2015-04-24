class Api::UsersController < Api::ApiController
  before_action :fetch_user!, only: [:update]
  permits :name, :role, :tw_user, :fb_user

  def show
  end

  def authenticate(email, password)
    @user = User.find_by_email(email)
    unless @user.try(:authenticate, password)
      render json: {error: 'User not found / incorrect password'}
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render action: :show }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.json { render action: :show }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
