class Web::PasswordResetsController < Web::ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params.dig('user', 'email'))

    if @user.present?
      @token = @user.generate_token
      UserMailer.with(user: @user, token: @token).reset_password.deliver_now
      @user.update(reset_password_token_digest: @token)
    end
    redirect_to new_session_path
  end

  def edit
    @user = GlobalID::Locator.locate_signed(params[:token], for: 'password_reset')
    if @user.nil?
      redirect_to new_session_path
    elsif @user.reset_password_token_digest != params[:token]
      redirect_to new_session_path
    end
  end

  def update
    @user = GlobalID::Locator.locate_signed(params[:token], for: 'password_reset')
    if @user.update(password_params.merge(reset_password_token_digest: nil))
      redirect_to new_session_path
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
