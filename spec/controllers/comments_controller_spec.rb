# coding: utf-8
require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:image) { Image.create(url: "http://example.com/", title: "text") }

  describe "#create" do
    it "create new comment" do
      expect {
        post :create, image_id: image.id, comment: { body: "コメント" }
      }.to change {
        Comment.count
      }.from(0).to(1)
    end
  end
end
