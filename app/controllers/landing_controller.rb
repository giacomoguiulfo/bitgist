class LandingController < ApplicationController
  layout 'plain'

  skip_before_action :authenticate_user!

  def show
  end
end
