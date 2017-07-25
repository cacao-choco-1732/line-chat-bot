module Api
  module V1
    class HearController < ApplicationController
      def index
        render json: { test: true }
      end

      def show

      end

      def bot
        request = ::Lines::Request.create(params[:events])
        logger.info request.to_json
        p request
        render json: { test: true }, status: 200
      end
    end
  end
end
