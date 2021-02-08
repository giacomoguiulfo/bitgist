class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_ransack

  def new_session_path(scope)
    new_user_session_path
  end

  private

  def set_ransack
    @q = Gist.ransack(params[:q])
  end
end
