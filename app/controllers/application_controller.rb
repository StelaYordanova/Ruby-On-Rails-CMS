class ApplicationController < ActionController::Base

    private
  
    def authenticate_user!
      unless user_signed_in?
        redirect_to new_user_session_path, alert: 'Please sign in to your account.'
      end
    end
  
    def check_admin_role
      unless current_user && current_user.admin?
        redirect_to root_path, alert: 'Access is denied.'
      end
    end
  end
  