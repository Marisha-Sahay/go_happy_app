class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.where(user_id: current_user.id).or(ChatRoom.where(recipient_id: current_user.id))
  end

  def new
    @chat_room = ChatRoom.new
  end

  def new_chat
    if (ChatRoom.where(user_id: current_user.id, recipient_id: params[:id]).or(ChatRoom.where(recipient_id: current_user.id, user_id: params[:id]))).empty?
      @chat_room = ChatRoom.new
      @chat_room.user_id = current_user.id
      @chat_room.recipient_id = params[:id]
      @chat_room.save
      redirect_to "/chat_rooms/#{@chat_room.id}"
    else
      @chat_room = (ChatRoom.where(user_id: current_user.id, recipient_id: params[:id]).or(ChatRoom.where(recipient_id: current_user.id, user_id: params[:id]))).first
        redirect_to "/chat_rooms/#{@chat_room.id}"
    end
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end