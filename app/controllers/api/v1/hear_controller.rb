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

        logger.info @line_request.to_json

        request = @line_request.events.first
        if request.message?
          message = 'Hello'
        end

        if request.location?
          service = WunderGrounds::GeoLookupToCondition.new(request.latitude, request.longitude)
          condition = service.execute

          message = condition.current_observation.weather
        end

        body = {
          replyToken: request.replyToken,
          messages: [
            { type: 'text', text: message }
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
