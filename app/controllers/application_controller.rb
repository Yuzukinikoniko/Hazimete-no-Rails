class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        "/home"
    end
    def after_sign_up_path_for(resource)
        "/home"
    end
    def after_sign_out_path_for(resource)
        "/"
    end
    #protect_from_forgery with: :exception
    #before_action :configure_permitted_parameters, if: :devise_controller?
    #protected
    #def configure_permitted_parameters
     #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #end
    # 例外処理


end
