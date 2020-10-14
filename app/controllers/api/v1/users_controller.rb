module Api  
  module V1
    class UsersController < ApiController
      skip_before_action :authenticate_user, only: [:create]

      def create
        @user = User.new user_params
        if @user.save
          render :create  
        else
          render json: { status: :unprocessable_entity, error: @user.errors.full_messages.to_sentence }  
        end
      end

      private

        def user_params
          params.require(:user).permit(:password, :password_confirmation, :email, :first_name, :last_name, :username)
        end
    end
  end
end
