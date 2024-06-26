class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]


    def index
        @posts = Post.all.order("created_at DESC").paginate(page: params[:page])
    end

    def show
        @post = Post.find(params[:id])
        @comment = @post.comments.build
        @comments = @post.comments.where.not(id: nil)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user

        if @post.save
            redirect_to @post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to @post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path, status: :see_other
    end

    private
        def post_params
            params.require(:post).permit(:title, :body, :thumbnail, :banner)
        end

end
