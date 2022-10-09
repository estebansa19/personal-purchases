module Api
  module V1
    class PurchasesController < ApplicationController
      def index
        @monthly_purchases = MonthlyPurchase.select(:month, :purchases).order(created_at: :desc)
      end

      def create
        purchases_record = MonthlyPurchase.find_or_create_by(month: Date.current.beginning_of_month)
        purchases_record.purchases << {
          date: DateTime.current, title: purchase_params[:title], value: purchase_params[:value]
        }

        if purchase_params_valid? && purchases_record.save
          render json: purchases_record, status: :ok
        else
          render json: purchases_record.errors.full_messages.to_sentence, status: :unprocessable_entity
        end
      end

      private

      def purchase_params
        params.require(:purchase).permit(:title, :value)
      end

      def purchase_params_valid?
        return false if purchase_params[:title].blank? || purchase_params[:value].blank?
        return false if !purchase_params[:value].try(:to_i).is_a?(Numeric)

        true
      end
    end
  end
end
