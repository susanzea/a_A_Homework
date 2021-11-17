require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password"
        post :create, {}
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password) }
      it "validates that the password is at least 6 characters long"
        post :create, {}
        it { should validate_length_of(:password).is_at_least(6) }
    end

    context "with valid params" do
      it "redirects user to bands index on success"
        post :create, {}
        expect(response).to redirect_to("index")
    end
  end
end