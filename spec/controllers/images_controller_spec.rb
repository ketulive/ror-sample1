require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  describe "#index" do
    it "assigns @images" do
      get :index
      expect(assigns(:images)).to_not be_nil
    end
  end

  describe "#new" do
    it "assigns @image" do
      get :new
      expect(assigns(:image)).to_not be_nil
    end
  end

  describe "#create" do
    it "create new image" do
      expect {
        post :create, image: { url: "http://example.com/", title: "test" }
      }.to change {
        Image.count
      }.from(0).to(1)
    end
  end

  describe "#show" do
    let(:image) { Image.create(url: "http://example.com/", title: "test") }

    it "assigns @image" do
      get :show, id: image.id
      expect(assigns(:image)).to eq image
    end
  end

  describe "#destroy" do
    let!(:image) { Image.create(url: "http://example.com/", title: "test") }

    it "destroy image" do
      expect {
        delete :destroy, id: image.id
      }.to change {
        Image.count
      }.from(1).to(0)
    end
  end
end
