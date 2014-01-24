class PostsController < ApplicationController

  http_basic_authenticate_with name: "dideler", password: "123",
                               except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new  # @post defined here so it exists in 'new' view.
  end

  def create
    @post = Post.new(post_params)

    # redirect_to issues a new request on form submission,
    # while render uses the same request.
    if @post.save
      redirect_to @post
    else
      render 'new'  # Passes @post object to the 'new' template on render.
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    # Note that we don't have a destroy view because we redirect to index.
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def show_params
    render text: params[:post].inspect  # Displays params hash
  end

end
