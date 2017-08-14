require 'rails_helper'

RSpec.describe Stories::Create do
  describe '#call' do
    let(:subscriber) { create :subscriber }
    let(:attributes) { attributes_for :story }

    subject { described_class.call(subscriber: subscriber, attributes: attributes)}

    specify do
      expect { subject }.to change { subscriber.stories.count }.by(1)
    end

    context 'when can find related stories' do
      before { allow(GlueSettings).to receive(:[]).and_return(1) }

      context 'when origin is missing' do
        let(:story) do
          create :story, subscriber: subscriber, resource_type: attributes[:resource_type]
        end

        specify do
          expect { subject }.to change { story.related_stories.count }.by(1)
        end
      end

      context 'when origin is present' do
        let(:attributes) { attributes_for :story, :with_origin }
        let(:story) do
          create :story,
            subscriber: subscriber,
            resource_type: attributes[:resource_type],
            origin_type: attributes[:origin_type],
            origin_id: attributes[:origin_id]
        end


        specify do
          expect { subject }.to change { story.related_stories.count }.by(1)
        end
      end
    end
  end
end
