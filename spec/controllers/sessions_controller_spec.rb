require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "GET sessions#new" do
    it "success when render template new" do
      get :new
      expect(response).to render_template :new
    end
  end

  # describe "POST sessions#create" do
  #   let!(:user) {FactoryBot.create(:user)}
  #   let!(:params) {{session: {email:  user.email, password:  user.password}}}

  #   context "success when valid attributes" do
  #     it "success when user is admin" do
  #       post :create, params: params
  #       expect(response).to redirect_to admin_root_path
  #     end

  #     it "success when user is customer" do
  #       user.update_column :role, 0
  #       post :create, params: params
  #       expect(response).to redirect_to user
  #     end
  #   end

  #   context "fail when invalid attributes" do
  #     it "fail when authentication failed" do
  #       post :create, params: {session: {email:  user.email }}
  #       expect(flash[:danger]).to eq I18n.t("users.invalid_email")
  #       expect(response).to render_template :new
  #     end

  #     it "fail when account not active" do
  #       user.update_column :activated_at, nil
  #       post :create, params: params
  #       expect(response).to redirect_to root_path
  #     end
  #   end
  # end

  # describe "GET sessions#destroy" do
  #   it "success when redirect to root path" do
  #     delete :destroy
  #     expect(response).to redirect_to root_path
  #   end
  # end
end
