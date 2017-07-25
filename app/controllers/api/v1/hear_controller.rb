module Api
  module V1
    class HearController < ApplicationController
      def index
        render json: { test: true }
      end

      def show

      end

      def bot
        p params
        p params[:events]
        request = ::Lines::Request.new(params[:events].to_unsafe_h)
        logger.info request.to_json
        p request
        render json: { test: true }, status: 200
      end
    end
  end
end
