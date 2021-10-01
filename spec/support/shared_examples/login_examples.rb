RSpec.shared_examples "login example" do
  before{get :index}
  
  it "show flash danger please login" do
    expect(flash[:danger]).to eq I18n.t("users.please_login")
  end

  it {expect(response).to redirect_to(login_path)}
end
