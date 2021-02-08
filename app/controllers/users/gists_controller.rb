class Users::GistsController < ApplicationController
  before_action :set_username
  before_action :set_gist, only: %i[ show ]

  # GET /gists or /gists.json
  def index
    @gists = @user.gists
  end

  # GET /gists/1 or /gists/1.json
  def show
  end

  private
    def set_username
      @user = User.find_by(username: params[:username])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_gist
      @gist = Gist.find(params[:id])
    end
end
