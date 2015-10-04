json.(@image, :id, :title, :url)
json.comments @image.comments, :id, :body
