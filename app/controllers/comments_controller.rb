class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render layout: false
  end

  def create
    client = Client.find_by(id: params[:client_id])
    @comment = client.comments.new(comment_params)

    if @comment.save
      redirect_to "/users/#{client.user_id}/clients/#{client.id}"
      # render "/users/#{client.user_id}/clients/#{client.id}/comments/#{@comment.id}", layout: false
    else
      flash[:error] = @comment.errors.full_messages.first
      render 'new'
    end
  end

  def show
    render layout: false
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :client)
  end
end
