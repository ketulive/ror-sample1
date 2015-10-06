class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    Image.create(params.require(:image).permit(:url, :title))
    respond_to do |format|
      format.html { redirect_to action: :index }
      format.json { head 201 }
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    Image.find(params[:id]).destroy
    redirect_to action: :index
  end
end
