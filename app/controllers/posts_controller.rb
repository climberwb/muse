class PostsController < ApplicationController
    
    before_action :find_post, only: [:update,:edit,:destroy,:show,:up_vote,:down_vote]
    before_action :authenticate_user!, except: [:index,:show]
     def index
         @posts = Post.all
     end
     
     def new
         @post = current_user.posts.build
     end
     
     def create
         @post = current_user.posts.build(post_params)
         if @post.save
             redirect_to @post
         else
             render 'new'
         end
     end
     
     def update
         if @post.update(post_params)
             redirect_to @post
         else
             render 'edit'
         end
     end
     
     def edit
     end
     
     def destroy
         if @post.destroy
             redirect_to root_path
         else
             render 'edit'
         end
     end
     
     def up_vote
         @post.upvote_by current_user
         redirect_to :back
     end
     
     def down_vote
         @post.downvote_by current_user
         redirect_to :back
     end
     
     def show
         @comments = @post.comments
     end
     
     private
     
     def find_post
         @post=Post.find(params[:id])
     end
     
     def post_params
         params.require(:post).permit(:title,:link,:description,:image)
     end
     
end
