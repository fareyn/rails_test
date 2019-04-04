module SessionsHelper
    # Logs in the given user.
  def log_in(empresa)
    session[:empresa_id] = empresa.id
  end
  #retorna al usuario actual
    def current_user
        if session[:empresa_id]
          @current_user ||= Empresa.find_by(id: session[:empresa_id])
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:empresa_id)
        @current_user = nil
    end

    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
  
    # Stores the URL trying to be accessed.
    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end
end
