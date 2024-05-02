class CommentsController < ApplicationController

    before_action :authenticate_user!, except: [:create]


    def new
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)

        if current_user
            @comment.commenter = current_user.email
        else
            @comment.commenter = "Anônimo"
        end
        if @comment.save
            redirect_to post_path(@post), notice: "Comentário feito com sucesso!"
        else
            render 'posts/show'
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post), status: :see_other
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end
