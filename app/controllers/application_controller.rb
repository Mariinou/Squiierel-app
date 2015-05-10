class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


    helper_method :admin?


    protected

    def admin?
        if current_user.kind_of? Administrateur
            true
        else
            false
        end
    end

    def authorize
        unless admin?
            flash[:alert] = "Accès non autorisé"
            redirect_to home_path
            false
        end
    end
end
