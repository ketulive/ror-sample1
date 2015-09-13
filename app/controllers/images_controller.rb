class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    Image.create(params.require(:image).permit(:url, :title))
    redirect_to action: :index
  end
end
