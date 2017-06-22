class BandsController < ApplicationController

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render json: ["invalid input"]
    end
  end

  def edit
    @band = band_find_params
    if @band.nil?
      redirect_to bands_url
    else
      render :edit
    end
  end

  def destroy
    @band = band_find_params
    if @band.destroy
      redirect_to bands_url
    else
      render json: ["can't delete what was never there"]
    end
  end

  def show
    @band = band_find_params
    @albums = Album.all.where(band_id: @band.id)
    render :show
  end

  def index
    render :index
  end

  def update
    @band = band_find_params
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

  def band_find_params
    Band.find(params[:id])
  end

end
