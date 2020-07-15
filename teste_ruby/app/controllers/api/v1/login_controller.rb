module Api
  module V1
    class LoginController < ApplicationController

      def create
        user = User.find_by("email = ?", user_params[:email])
        printf(user['password_digest'])
        if user && user.password_digest == user_params[:password_digest]
          # user.authenticate(user_params[:password_digest])
          render json: { token: token(user['id']), user_id: user['id'] }, status: :created
        else
          render json: { errors: [ "Sorry, incorrect username or password" ] }, status: :unprocessable_entity
        end
      end

      private
      def user_params
        params.permit(:email, :password_digest)
      end
    end
  end
end