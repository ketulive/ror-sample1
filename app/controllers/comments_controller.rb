class CommentsController < ApplicationController
  def create
    image = Image.find(params[:image_id])
    image.comments.create(params.require(:comment).permit(:body))
    respond_to do |format|
      format.html { redirect_to image_path(image) }
      format.json { head 201 }
    end
  end
end
