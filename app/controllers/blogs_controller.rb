class BlogsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json: Blog.all
    end

    def create
        blog = Blog.create!(title: params[:title], content: params[:content])
        render json: blog
    end

    def update
        blog = Blog.find_by!(id: params[:id])
        if blog.update(blog_params)
            render json: blog
        else
            render json: {error: blog.errors.full_messages}, status: 422
        end

    end

    def destroy
        blog = Blog.find_by!(id: params[:id])
        if blog.destroy
            render json: blog
        else
            render json: {error: blog.errors.full_messages}, status: 422
        end
    end



    private 

    def blog_params
        params.permit(:title, :content)
    end

end
