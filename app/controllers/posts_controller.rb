class PostsController < ApplicationController
    
    before_action :find_post, only: [:update,:edit,:destroy,:show]
    
     def index
         @posts = Post.all
     end
     
     def new
         @post = Post.new
     end
     
     def create
         @post = Post.new(post_params)
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
     
     def show
     end
     
     private
     
     def find_post
         @post=Post.find(params[:id])
     end
     
     def post_params
         params.require(:post).permit(:title,:link,:description)
     end
     
end
