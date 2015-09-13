require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  describe "#index" do
    it "assigns @images" do
      get :index
      expect(assigns(:images)).to_not be_nil
    end
  end
end
