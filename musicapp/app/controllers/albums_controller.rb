class AlbumsController < ApplicationController
  def new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render json: album_params
    end
  end

  def destroy
    @album = album_find_params
    if @album.destroy
      redirect_to albums_url
    else
      render json: ["can't delete what was never there"]
    end
  end

  def edit
    @album = album_find_params
    if @album.nil?
      redirect_to albums_url
    else
      render :edit
    end
  end

  def show
    @album = album_find_params
    @tracks = Track.all.where(album_id: @album.id)
    render :show
  end

  def update
    @album = album_find_params
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id)
  end

  def album_find_params
    Album.find(params[:id])
  end
end
