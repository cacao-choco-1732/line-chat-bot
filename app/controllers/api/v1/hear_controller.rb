module Api
  module V1
    class HearController < ApplicationController
      def index
        render json: { test: true }
      end

      def show

      end

      def bot
        render json: { test: true }, status: 200
      end
    end
  end
end
