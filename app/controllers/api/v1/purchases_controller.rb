module Api
  module V1
    class PurchasesController < ApplicationController
      # SELECT array_agg(value::text || COALESCE(' - ' || title::text, '')) as purchases, 
      # date_trunc('month', created_at) as month FROM purchases GROUP BY month, created_at, title, value

      def index
        @purchases = Purchase.
          select(:title, :value, :created_at).
          group_by { |purchase| purchase.created_at.strftime('%B - %Y') }
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
