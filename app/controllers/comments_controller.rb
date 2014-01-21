class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dideler", password: "123", only: :destroy

  def create
    # Because comments are a nested resource of posts,
    # we have to keep track of the post the comment is attached to.
    @post = get_post
    @comment = @post.comments.create(comment_params)  # Create & save comment.

    redirect_to post_path(@post)
  end

  def destroy
    @post = get_post
    @comment = get_comment
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def get_post
    Post.find(params[:post_id])
  end

  private
  def get_comment
    @post.comments.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
