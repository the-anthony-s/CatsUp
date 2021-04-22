class ChannelsController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :set_channel, only: %i[show update destroy]

  # GET
  # /channels
  def index
    @channels = Channel.all
    json_response(@channels)
  end

  def new; end

  # POST /channels
  def create
    @channel = Channel.create!(channel_params)
    json_response(@channels)
  end

  # GET /channels/:id
  def show
    json_response(@channel)
  end

  def edit; end

  # PATCH/PUT /channels/:id
  def update
    @channel.update(channel_params)
    head :no_content
  end

  # DELETE /channels/:id
  def destroy
    @channel.destroy
    head :no_content
  end

  private

  # Allow only trusted parameters
  def channel_params
    params.permit(:name, :user_id, :recipient_id)
  end

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
