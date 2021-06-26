require "rails_helper"

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

RSpec.describe "/weapons", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Weapon. As you add validations to Weapon, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:weapon).attributes.except("id", "created_at", "updated_at")
  }

  let(:invalid_attributes) {
    build(:weapon, name: nil).attributes.except("id", "created_at", "updated_at")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # WeaponsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Weapon.create! valid_attributes
      get weapons_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      weapon = Weapon.create! valid_attributes
      get weapon_url(weapon), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Weapon" do
        expect {
          post weapons_url,
            params: {weapon: valid_attributes}, headers: valid_headers, as: :json
        }.to change(Weapon, :count).by(1)
      end

      it "renders a JSON response with the new weapon" do
        post weapons_url,
          params: {weapon: valid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Weapon" do
        expect {
          post weapons_url,
            params: {weapon: invalid_attributes}, as: :json
        }.to change(Weapon, :count).by(0)
      end

      it "renders a JSON response with errors for the new weapon" do
        post weapons_url,
          params: {weapon: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        build(:weapon, name: "OPQ").attributes.except("id", "created_at", "updated_at")
      }

      it "updates the requested weapon" do
        weapon = Weapon.create! valid_attributes
        patch weapon_url(weapon),
          params: {weapon: new_attributes}, headers: valid_headers, as: :json
        weapon.reload
        expect(weapon.name).to eq(new_attributes["name"])
      end

      it "renders a JSON response with the weapon" do
        weapon = Weapon.create! valid_attributes
        patch weapon_url(weapon),
          params: {weapon: new_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the weapon" do
        weapon = Weapon.create! valid_attributes
        patch weapon_url(weapon),
          params: {weapon: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested weapon" do
      weapon = Weapon.create! valid_attributes
      expect {
        delete weapon_url(weapon), headers: valid_headers, as: :json
      }.to change(Weapon, :count).by(-1)
    end
  end
end
