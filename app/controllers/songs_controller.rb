class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @artists = Artist.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:id])
    song_data = song_params
    song_data[:artist_id] = @artist.id
    if Song.create(song_data)
      redirect_to '/songs'
    else
      redirect_to '/songs/new'
    end
  end

  private

    def song_params
      params.require(:song).permit(:title, :length, :play_count, :artist_id)
    end

end
