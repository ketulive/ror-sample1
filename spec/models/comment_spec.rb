require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validation" do
    let(:image) { Image.create(url: "http://example.com/", title: "test") }

    describe "body" do
      subject(:no_body_comment) { image.comments.build(body: nil) }

      it "require" do
        expect(no_body_comment).to_not be_valid
        expect(no_body_comment.errors[:body].size).to be 1
      end
    end

    describe "image_id" do
      context "empty" do
        subject(:no_image_id_comment) { Comment.new(image_id: nil, body: "body") }

        it "invalid" do
          expect(no_image_id_comment).to_not be_valid
          expect(no_image_id_comment.errors[:image].size).to be 1
        end
      end

      context "illegal id" do
        subject(:illegal_image_id_comment) { Comment.new(image_id: image.id + 1, body: "body") }

        it "invalid" do
          expect(illegal_image_id_comment).to_not be_valid
          expect(illegal_image_id_comment.errors[:image].size).to be 1
        end
      end
    end
  end
end

RSpec.describe Comment, type: :request do
  let(:image) { Image.create(url: "http://example.com/", title: "test") }

  describe "POST /images/:id/comments.json" do
    it "create comments" do
      post "/images/#{image.id}/comments.json", comment: { body: "test" }
      expect(response.status).to be 201
    end
  end
end
