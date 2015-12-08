module ControllerMacros

  def login_my_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      my_user = create(:user)
      sign_in my_user
    end
  end

end
