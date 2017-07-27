module Api
  module V1
    class HearController < ApplicationController
      def index
        render json: { test: true }
      end

      def show

      end

      def bot
        @line_request = ::Lines::Request.new(params.to_unsafe_h)

        logger.info @line_request.to_json

        body = {
          replyToken: @line_request.events.first.replyToken,
          messages: [
            { type: 'text', text: 'Hello' }
          ]
        }

        client = Faraday.new(url: Settings.line.api)
        res = client.post do |req|
          req.url 'reply'
          req.headers['Content-Type'] = 'application/json'
          req.headers['Authorization'] = "Bearer #{Settings.line.access_token}"
          req.body = body.to_json
        end

        logger.info res.body

        render json: { test: true }, status: 200
      end
    end
  end
end
