class TracksController < ApplicationController

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      render json: track_params
    end
  end

  def destroy
    @track = track_find_params
    if @track.destroy
      redirect_to track_url(@track)
    else
      render json: ["can't delete what was never there"]
    end
  end

  def edit
    @track = track_find_params
    if @track.nil?
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def show
    @track = track_find_params
    render :show
  end

  def update
    @track = track_find_params
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  private
  def track_params
    params.require(:track).permit(:song, :album_id, :lyrics)
  end

  def track_find_params
    Track.find(params[:id])
  end

end
