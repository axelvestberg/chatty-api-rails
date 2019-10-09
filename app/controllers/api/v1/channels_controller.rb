class Api::V1::ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :create]
  
  def index
    @channels = Channel.all
    render json: @channels
  end

  def create
    @channel = Channel.new(channel_params)
  end

  def show
    render json: @channels
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:name)
  end
end
