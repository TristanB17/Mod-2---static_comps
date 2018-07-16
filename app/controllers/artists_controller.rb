class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    # session[:secret] = "This time for real, though"
  end

  def new
    @artist = Artist.new
  end

  def create
    if Artist.create(artist_params)
      redirect_to '/artists'
    else
      redirect_to '/artists/new'
    end
  end

  private

    def artist_params
      params.require(:artist).permit(:name)
    end
end
