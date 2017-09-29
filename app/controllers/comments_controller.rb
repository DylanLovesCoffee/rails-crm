class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    client = Client.find_by(id: params[:client_id])
    @comment = client.comments.new(comment_params)

    if @comment.save
      flash[:success] = 'Comment added.'
      redirect_to "/users/#{client.user_id}/clients/#{client.id}"
    else
      flash[:error] = @comment.errors.full_messages.first
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :client)
  end
end
