class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :image, presence: true

  belongs_to :image
end
