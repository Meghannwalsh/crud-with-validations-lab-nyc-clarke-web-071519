class SongsController < ApplicationController

def index 
    @songs = Song.all
end 

def show 
    @song = Song.find(params[:id])

end 

def new 

end 

def create 
  @song = Song.new(params_)
  if @song.valid?
    @song.save
    redirect_to song_path(@song)
  else 
    render :new
  end 
end 

def edit 
    @song = Song.find(params[:id])

end 

def update 
    @song = Song.find(params[:id])
    if @song.update(params_)
    redirect_to song_path(@song)
  else 
    render :edit
  end 
end 

def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
end 

private 

def params_
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
end 
end
