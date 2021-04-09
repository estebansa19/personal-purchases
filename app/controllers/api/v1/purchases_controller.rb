module Api
  module V1
    class PurchasesController < ApplicationController
      def index
        render json: Purchase.all, status: :ok
      end
    
      def create
        purchase = Purchase.new(purchase_params)
    
        if purchase.save
          render json: purchase, status: :ok
        else
          render json: purchase.errors.to_sentence, status: :unprocessable_entity
        end
      end
    
      private
    
      def purchase_params
        params.require(:purchase).permit(:title, :value)
      end
    end
  end
end
