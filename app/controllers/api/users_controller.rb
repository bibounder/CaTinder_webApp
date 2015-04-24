class Api::UsersController < Api::ApiController
  skip_before_action :authenticate!, only: [:authenticate, :create]
  permits :name, :role, :tw_user, :fb_user

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
        format.json { render :show }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)

        format.json { render :show }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def user_params
    params.permit(:email, :name, :password, :tw_user, :fb_user)
  end
end