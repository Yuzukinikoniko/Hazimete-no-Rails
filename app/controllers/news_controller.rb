class NewsController < ApplicationController
    layout'home'
    before_action :user
    def index
        obj = Article.find(params['id'])
        @title = obj.title
        @body = obj.body
    end
    def admin
        if current_user.id!=1
            redirect_to("/home") 
        end
        #@articles=Article.all
        @articles=Article.order(created_at: :desc).page(params[:page]).per(5)
    end
    def page
        obj = Article.order(created_at: :desc).find(params['id'])
        @title = obj.title
        @body = obj.body
    end
    def post
        if current_user.id!=1
            redirect_to("/home") 
        end
        @turbo=0
    end
    def confirm
        if current_user.id!=1
            redirect_to("/home") 
        end
        if request.post? then 
            if params[:title] then
                @title=params[:title]
            else
                @title="入力されていない"
            end
            if params[:body] then
                @body=params[:body]
            else
                @body="入力されていない"
            end
        end
    end
    def save
        Article.create(
            title:params['title'],
            body:params['body'],
        )
        redirect_to '/news_admin'
    end
    def repost
        @article = Article.find(params[:id])
        @title = @article.title
        @body = @article.body
        @id = params[:id]
    end
    def update
        article = Article.find(params[:id])
        article.update(
            title:params[:title],
            body:params[:body],
        )
        redirect_to '/news_admin'
    end
    def del_conf
        obj = Article.find(params['id'])
        @title = obj.title
        @body = obj.body
        @id = obj.id
    end
    def delete
        obj = Article.find(params['id'])
        obj.destroy
        redirect_to '/news_admin'
    end
    def user
        if !user_signed_in?
            redirect_to("/")
        end
        @name=current_user.name
        @time=DateTime.now
        @turbo=1
    end
end
