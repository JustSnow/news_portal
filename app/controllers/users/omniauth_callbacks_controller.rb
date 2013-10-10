class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
  	@user = User.find_for_facebook_oauth request.env["omniauth.auth"]
    @categories = Category.find(:all)
    
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:alert] = "authentication error"
      redirect_to root_path
    end
  end
end
