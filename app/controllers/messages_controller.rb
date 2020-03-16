class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  def index
    # message.where receiver or sender
    @messages = current_user.messages.order(:updated_at, :asc)
    @message = Message.new
    @users = User.where.not(id: current_user.id)
  end

  # GET /messages/recent.json
  def recent
    last = Message.find(recent_params['max_id'])
    @messages = current_user.messages.where('updated_at > ?', last.updated_at)
    respond_to do |format|
      format.json { render :recent}
    end

  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:message, :receiver_id, :sender_id)
  end

  def recent_params
    params.require(:recent).permit(:max_id)
  end
end
