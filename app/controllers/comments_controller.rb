class CommentsController < ApplicationController

  def create
    @park = Park.find(params[:park_id])
    @comment = @park.comments.new(comment_params)
    if @comment.save
      redirect_to park_path(@park)
    else
      @park = @comment.park
      @comments = @park.comments
      render "parks/show"
    end
  end
    
  # @comment = Comment.new(comment_params)
  # redirect_to park_path(@comment.park), method: :get

# else
#   def create
#     @room = Room.find(params[:room_id])
#     @message = @room.messages.new(message_params)
#     if @message.save
#       redirect_to room_messages_path(@room)
#     else
#       @messages = @room.messages.includes(:user)
#       render :index
#     end
#   end



  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id)
  end



end
