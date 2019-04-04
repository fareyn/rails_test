class SucursalController < ApplicationController
    #before_action :logged_in_user, only: [:create, :destroy]
    def new
        @sucursal = Sucursal.new
        @empresa = current_user
        @sucursal.empresa_id = @empresa[:id]
    end

    def create

        @sucursal = current_user.sucursals.build(s_params)
        
        if @sucursal.save
            redirect_to :controller=> 'empresa', :action=> 'show', :id=> current_user.id
        else
            
            @sucursal.empresa_id = current_user[:id]
            render :action => 'new'
        end
    end

    def s_params
        params.require(:sucursal).permit(:empresa_id, :nsuc, :ncalle, :ncol, :numext, :numint, :cpost,:ciudad,:pais)
    end

    def edit
        @sucursal = Sucursal.find(params[:id])
        @sucursal.empresa_id = current_user[:id]
    end

    def update
        @sucursal = current_user.sucursals.find(params[:id])

        if @sucursal.update_attributes(s_params)
            redirect_to :action => 'show', :id => @sucursal[:id]
        else
            @sucursal.empresa_id = current_user[:id]
            render :action => 'edit'
        end
    end

    def show
        @empresa = current_user
        @sucursal = Sucursal.find(params[:id])
        @empleados = @sucursal.empleados
    end


end
