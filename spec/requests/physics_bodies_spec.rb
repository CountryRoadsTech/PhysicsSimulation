require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/physics_bodies", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # PhysicsBody. As you add validations to PhysicsBody, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      PhysicsBody.create! valid_attributes
      get physics_bodies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      physics_body = PhysicsBody.create! valid_attributes
      get physics_body_url(physics_body)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_physics_body_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      physics_body = PhysicsBody.create! valid_attributes
      get edit_physics_body_url(physics_body)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PhysicsBody" do
        expect {
          post physics_bodies_url, params: { physics_body: valid_attributes }
        }.to change(PhysicsBody, :count).by(1)
      end

      it "redirects to the created physics_body" do
        post physics_bodies_url, params: { physics_body: valid_attributes }
        expect(response).to redirect_to(physics_body_url(PhysicsBody.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PhysicsBody" do
        expect {
          post physics_bodies_url, params: { physics_body: invalid_attributes }
        }.to change(PhysicsBody, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post physics_bodies_url, params: { physics_body: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested physics_body" do
        physics_body = PhysicsBody.create! valid_attributes
        patch physics_body_url(physics_body), params: { physics_body: new_attributes }
        physics_body.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the physics_body" do
        physics_body = PhysicsBody.create! valid_attributes
        patch physics_body_url(physics_body), params: { physics_body: new_attributes }
        physics_body.reload
        expect(response).to redirect_to(physics_body_url(physics_body))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        physics_body = PhysicsBody.create! valid_attributes
        patch physics_body_url(physics_body), params: { physics_body: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested physics_body" do
      physics_body = PhysicsBody.create! valid_attributes
      expect {
        delete physics_body_url(physics_body)
      }.to change(PhysicsBody, :count).by(-1)
    end

    it "redirects to the physics_bodies list" do
      physics_body = PhysicsBody.create! valid_attributes
      delete physics_body_url(physics_body)
      expect(response).to redirect_to(physics_bodies_url)
    end
  end
end
