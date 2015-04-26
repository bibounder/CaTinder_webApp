class Api::UsersController < Api::ApiController
  skip_before_action :authenticate!, only: [:authenticate, :create]
  permits :name, :role, :tw_user, :fb_user

  def authenticate(email, password)
    @user = User.find_by_email(email)
    if @user.try(:authenticate, password)
      render :show
    else
      render json: {error: 'User not found / incorrect password'}
    end
  end

  def social_network_authenticate(name, email, tw_user:, fb_user:)
    if tw_user
      user = User.where(tw_user: tw_user)
    end
  end

  def create
    @user = User.new(user_create_params)

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
      if @user.update(user_update_params)

        format.json { render :show }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def user_create_params
    params.permit(:email, :name, :password, :tw_user, :fb_user)
  end

  def user_update_params
    params.permit(:pet_number, :has_exterior)
  end
end