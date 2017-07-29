module Api
  module V1
    class HearController < ApplicationController
      def index

        # p WunderGrounds::Condition.new(JSON.parse(client.condition('Sagamihara')))
        render json: { test: true }, status: 200
      end

      def show

      end

      def bot
        @line_request = ::Lines::Request.new(params.to_unsafe_h)

        request = @line_request.events.first
        logger.info request.to_json
        logger.info request.message.to_json
        if request.text?
          text = 'Hello'
        end

        if request.location?
          message = request.message
          service = WunderGrounds::GeoLookupToCondition.new(message.latitude, message.longitude)
          condition = service.execute
          logger.info condition.to_json
          text = 'Hello'
          # text = condition.current_observation.weather
        end

        body = {
          replyToken: request.replyToken,
          messages: [
            { type: 'text', text: text }
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
