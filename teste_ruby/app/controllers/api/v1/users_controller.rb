module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)
        if user.save
          render json: { status: 'SUCCESS', message: 'Usuário salvo', data: user }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Usuário não salvo', data: user.errors }, status: :unprocessable_entity
        end
      end

      # Excluir feirante
      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { status: 'SUCCESS', message: 'Usuário deletado', data: user }, status: :ok
      end

      # Atualizar Feirante
      def update
        user = User.find(params[:id])
        if user.update_attributes(feirante_params)
          render json: { status: 'SUCCESS', message: 'Usuário atualizado', data: user }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Usuário não atualizado', data: user.errors }, status: :unprocessable_entity
        end
      end

      # Limitação de parâmetros aceitos
      private
      def user_params
        params.permit(:email, :password_digest)
      end
    end

  end
end