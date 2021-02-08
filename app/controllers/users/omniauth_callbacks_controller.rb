class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable

  skip_before_action :verify_authenticity_token, only: :github
  before_action :set_user, only: %i[github]

  def failure
    redirect_to landing_path
  end

  def github
    remember_me(user)
    sign_in_and_redirect user, event: :authentication
    set_flash_message :notice, :success, kind: 'Github'
  end

  private

  attr_reader :user

  def auth
    request.env["omniauth.auth"]
  end

  def set_user
    @user = if user_signed_in?
      current_user
    elsif User.where(email: auth.info.email).any?
      User.where(email: auth.info.email).first
    else
      create_user
    end
  end

  def create_user
    User.create(
      name: auth.info.name,
      username: auth.info.nickname,
      email: auth.info.email,
    )
  end
end
