require "rails_helper"

RSpec.describe Image, type: :request do
  let!(:image) { Image.create(url: "http://example.com/", title: "test") }

  describe "GET /images.json" do
    it "return json" do
      get "/images.json"
      expect(response.body).to be_json(
                                 images: [
                                   id: image.id,
                                   title: "test",
                                   url: "http://example.com/",
                                 ],
                               )
    end
  end

  describe "GET /images/:id.json" do
    let!(:comment) { image.comments.create!(body: "test") }

    it "return json" do
      get "/images/#{image.id}.json"
      expect(response.body).to be_json(
                                 id: image.id,
                                 title: "test",
                                 url: "http://example.com/",
                                 comments: [
                                   {
                                     id: comment.id,
                                     body: "test",
                                   },
                                 ],
                               )
    end
  end

  describe "POST /images.json" do
    it "create images" do
      post "/images.json", image: { url: "http://example.com/", title: "test" }
      expect(response.status).to be 201
    end
  end
end
