class MessagesController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :set_channel
  before_action :set_channel_message, only: %i[show update destroy]

  after_action :send_message, only: %i[create], if: -> { @message }

  # GET channels/:channel_id/messages
  def index
    json_response(@channel.messages)
  end

  # POST channels/:channel_id/messages
  def create
    @message = @channel.messages.create!(message_params)
    json_response(@message, :created)
  end

  # GET channels/:channel_id/messages/:id
  def show
    json_response(@message)
  end

  # PATCH/PUT channels/:channel_id/messages/:id
  def update
    @message.update(message_params)
    head :no_content
  end

  # DELETE channels/:channel_id/messages/:id
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
