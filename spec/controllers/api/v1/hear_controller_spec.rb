require 'rails_helper'

describe Api::V1::HearController, type: :controller do
  describe 'POST #bot' do
    let(:params) do
      {
        events: [
          {
            type: 'message',
            replyToken: 'abcdefg12345678',
            source: {
              userId: '1111',
              type: 'user'
            },
            timestamp: 1500987751230,
            message: {
              type: 'text',
              id: 1234567890,
              text: 'message!'
            }
          }
        ]
      }
    end

    subject { post :bot, params: params }

    # it do
    #   expect(Lines::Request).to receive(:new)
    #   subject
    # end

    context '@line_request' do
      it do
        subject
        expect(assigns(:line_request)).to be_truthy
      end
    end
  end
end
