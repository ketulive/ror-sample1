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
end
