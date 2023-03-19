# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
     if user_signed_in?
      Work.create(user_id: current_user.id,work_start: 1)
     end
   end

  # DELETE /resource/sign_out
   def destroy
    if user_signed_in?
      Work.create(user_id: current_user.id,work_start: 0)
    end
     super
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   #def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:age,:gender])
   #end
end
