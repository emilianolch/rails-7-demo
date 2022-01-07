class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        CommentsMailer.submitted(@comment).deliver_later

        format.html { redirect_to post_url(@post), notice: "Comment was successfully created." }
        format.turbo_stream {
          render turbo_stream: turbo_stream.append('comments', @comment)
        }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = Post.find params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
