class MessagesController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :set_channel
  before_action :set_channel_message, only: %i[show update destroy]

  after_action :send_message, only: %i[create], if: -> { @message }

  def index
    json_response(@channel.messages)
  end

  def new; end

  def create
    @message = @channel.messages.create!(message_params)
    json_response(@message, :created)
  end

  def show
    json_response(@message)
  end

  def edit; end

  def update
    @message.update(message_params)
    head :no_content
  end

  def destroy
    @message.destroy
    head :no_content
  end

  private

  def message_params
    params.permit(:message, :user_id, :channel_id)
  end

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def set_channel_message
    return nil unless @channel

    @message = @channel.messages.find_by!(id: params[:id])
  end

  def send_message
    $redis.publish 'messages', @message.to_json
  end
end
