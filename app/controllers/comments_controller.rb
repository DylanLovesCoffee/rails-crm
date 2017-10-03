class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render layout: false
  end

  def create
    client = Client.find_by(id: params[:client_id])
    @comment = client.comments.new(comment_params)

    if @comment.save
      render partial: 'show', locals: {comment: @comment}
    else
      @errors = @comment.errors.full_messages
      render 'new', layout: false
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
