class SessionsController < ApplicationController
  
  def new
  end

  def create
    empresa = Empresa.find_by(correo: params[:session][:correo])
    if empresa && empresa.authenticate(params[:session][:password])
    log_in empresa
    redirect_to empresa_show_path(:id => empresa)
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
    render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
