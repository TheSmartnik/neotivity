require 'rails_helper'

RSpec.describe Subscriber::StoryController, type: :controller do
  describe '#index' do
    let(:story) { create :story }

    specify do
      get :index, subscriber_id: story.subscriber.subscriber_id

      expect(response).to be_success
    end
  end
end
