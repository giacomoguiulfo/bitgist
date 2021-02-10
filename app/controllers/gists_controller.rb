class GistsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource
  skip_authorize_resource only: :show

  # GET /gists or /gists.json
  def index
    @q = Gist.accessible_by(current_ability).ransack(params[:q])
    @pagy, @gists = pagy(@q.result.includes(:user, :files))
  end

  # GET /gists/1 or /gists/1.json
  def show
  end

  # GET /gists/new
  def new
    @gist = Gist.new(files: [Gist::File.new])
  end

  # GET /gists/1/edit
  def edit
  end

  # POST /gists or /gists.json
  def create
    @gist = current_user.gists.new(gist_params)

    respond_to do |format|
      if @gist.save
        format.html { redirect_to @gist, notice: "Gist was successfully created." }
        format.json { render :show, status: :created, location: @gist }
      else
        @gist.files = [Gist::File.new]
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gists/1 or /gists/1.json
  def update
    respond_to do |format|
      if @gist.update(gist_params)
        format.html { redirect_to @gist, notice: "Gist was successfully updated." }
        format.json { render :show, status: :ok, location: @gist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gists/1 or /gists/1.json
  def destroy
    @gist.destroy
    respond_to do |format|
      format.html { redirect_to gists_url, notice: "Gist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gist
    @gist = Gist.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gist_params
    params.require(:gist).permit(
      :description, :public,
      files_attributes: [:id, :filename, :language, :content, :_destroy]
    ).tap do |params|
      params["files_attributes"].to_h.each_with_index do |attrs, idx|
        if params["files_attributes"][attrs[0]]["filename"].blank?
          params["files_attributes"][attrs[0]]["filename"] = "gistfile#{idx}.txt"
        end
      end
    end
  end
end
