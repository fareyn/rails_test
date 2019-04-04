class EmpresaController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update]
    def list
        @empresas = Empresa.all
    end

    def show
        @empresa = Empresa.find(params[:id])
        @sucursals = @empresa.sucursals.paginate(page: params[:page])
        
    end

    def new
        @empresa = Empresa.new
    end

    def create
        @empresa = Empresa.new(empresa_params)

        if @empresa.save
            log_in @empresa
            #flash[:success] = "Welcome to the App!"
            redirect_to :action => 'show', :id => @empresa
        else
            render :action => 'new'
        end
    end

    def empresa_params
        params.require(:empresas).permit(:correo, :rfc, :nomdueno, :nombre, :password, :password_confirmation)
    end

    def edit
        @empresa = Empresa.find(params[:id])
    end

    def update
        @empresa = Empresa.find(params[:id])

        if @empresa.update_attributes(e_param)
            redirect_to :action => 'show', :id => @empresa
        else
            render :action => 'edit'
        end
    end

    def e_param
        params.require(:empresa).permit(:correo, :nomdueno, :nombre)
    end

    def delete
        log_out
        Empresa.find(params[:id]).destroy
        redirect_to root_url
    end

end
