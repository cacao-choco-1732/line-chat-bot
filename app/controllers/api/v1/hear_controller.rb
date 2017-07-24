module Api
  module V1
    class HearController < ApplicationController
      def index
        render json: { test: true }
      end

      def show

      end
    end
  end
end
