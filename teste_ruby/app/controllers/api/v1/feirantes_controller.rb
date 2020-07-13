module Api
  module V1
    class FeirantesController < ApplicationController
      # Mostrar todos os feirantes
      def index
        feirantes = Feirante.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'Feirantes carregados', data: feirantes }, status: :ok
      end

      # Mostrar um feirante específico com o id
      def show
        feirante = Feirante.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Feirante carregado', data: feirante }, status: :ok
      end

      # Criar novo feirante
      def create
        feirante = Feirante.new(feirante_params)
        if feirante.save
          render json: { status: 'SUCCESS', message: 'Feirante salvo', data: feirante }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Feirante não salvo', data: feirante.errors }, status: :unprocessable_entity
        end
      end

      # Excluir feirante
      def destroy
        feirante = Feirante.find(params[:id])
        feirante.destroy
        render json: { status: 'SUCCESS', message: 'Feirante deletado', data: feirante }, status: :ok
      end

      # Atualizar Feirante
      def update
        feirante = Feirante.find(params[:id])
        if feirante.update_attributes(feirante_params)
          render json: { status: 'SUCCESS', message: 'Feirante atualizado', data: feirante }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Feirante não atualizado', data: feirante.errors }, status: :unprocessable_entity
        end
      end

      # Limitação de parâmetros aceitos
      private
      def feirante_params
        params.permit(:nome, :apelido, :cpf, :dataNascimento)
      end

    end
  end
end
