class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception


    helper_method :admin?

    after_filter :store_location

    def store_location
        # store last url - this is needed for post-login redirect to whatever the user last visited.
        return unless request.get?
        if (request.path != "/users/sign_in" &&
            request.path != "/users/sign_up" &&
            request.path != "/users/password/new" &&
            request.path != "/users/password/edit" &&
            request.path != "/users/confirmation" &&
            request.path != "/users/sign_out" &&
            !request.xhr?) # don't store ajax calls
            session[:previous_url] = request.fullpath
        end
    end

    def after_sign_up_path_for(resource)
        redirect_to users_index_path
    end


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
