class HomeController < ApplicationController
    layout 'home'
    before_action :user
    def index
        if current_user.id==1
            redirect_to("/home_admin") 
        end
        #@articles=Article.all
        @articles=Article.order(created_at: :desc).page(params[:page]).per(6)
    end
    def admin
        if current_user.id!=1
            redirect_to("/home") 
        end
        #@works=Work.all
        @works=Work.order(created_at: :desc).page(params[:page]).per(7)
        
    end
    def admin_detail
        if current_user.id!=1
            redirect_to("/home") 
        end
        @user=User.find_by(id:params[:id])
        @works=Work.where(user_id:params[:id]).page(params[:page]).per(7)
    end
    def detail
        if current_user.id==1
            redirect_to("/home_admin") 
        end
        @works=Work.where(user_id:current_user.id)
    end
    def user_admin
        @user=current_user
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
