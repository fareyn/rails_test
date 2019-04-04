class EmpleadoController < ApplicationController
    def new
        @empresa = current_user
        @sucursals = current_user.sucursals
        @empleado = Empleado.new
    end

    def show
        @empleado = Empleado.find(params[:rfc])
        @empresa = current_user
        @sucursal = Sucursal.find(@empleado.sucursal_id)  
    end

    def edit
        @sucursals = current_user.sucursals
        @empleado = Empleado.find(params[:rfc])

    end

    def e_params
        params.require(:empleado).permit(:sucursal_id, :nemp, :rfc, :npuesto)
    end

    def create
        @empleado = Empleado.new(e_params)

        if @empleado.save
            redirect_to :controller=> 'empresa', :action=> 'show', :id=> current_user.id
        else
            @sucursals = current_user.sucursals
            render :action => 'new'
        end
    end

    def update
        @empleado = Empleado.find(params[:id])
        if @empleado.update_attributes(e_params)
            redirect_to :action =>'show', :rfc => @empleado.rfc
        else
            @sucursals = current_user.sucursals
            render :action => 'edit'
        end
    end
end
