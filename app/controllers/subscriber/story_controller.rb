class Subscriber::StoryController < ApplicationController

  def index
    render json: subscriber.stories, adapter: :json, root: :stories
  end

  def create
    Stories::Create.call(subscriber: subscriber, attributes: params[:story])

    head :ok
  end

  private

  def subscriber
    @subscriber ||= Subscriber.find_by(subscriber_id: params[:subscriber_id])
  end
end
