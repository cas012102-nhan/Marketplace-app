
    class PostsController < ApplicationController   
        before_action :authenticate_user!, except: [:show, :index]
        # before_action :set_post, only: %i[ show edit update destroy ]
      def index
        @posts = Post.all
      end
    
      def new 
        @post = Post.new
     
      
      end
    
      def create
          @post = Post.new(post_params)
          @post.user = current_user
        if @post.save
          redirect_to @post, notice: "Blog was successfully created."
        else
          render :new
        end 
      end
    
      def show
          @post = Post.find(params[:id])
      end
    
      def edit
        @post = Post.find(params[:id])
        @post.user = current_user
      end

      def update
        @post = Post.find(params[:id])
        @post.user = current_user
        if @post.update(post_params)
          redirect_to @post, notice: "Blog was sucessfully updated."
        
        else
          render :edit
        end
      end

      def destroy
        @post = Post.find(params[:id])
        @post.user = current_user
        @post.destroy
        redirect_to posts_path, notice: "Blog was successfully deleted."

      end
    
      private
      # def set_title
      #   @post = Post.find(params[:id])
      # end
     
    
      def post_params
        params.require(:post).permit(:title, :content, :published_at, :image)
      end
    
end
   