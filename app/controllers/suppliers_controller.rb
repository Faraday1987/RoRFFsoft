class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:edit, :update, :destroy]


    def index
        @proveedores = Supplier.order(created_at: :desc).all
    end

    def new
        @proveedor =  Supplier.new
    end

    def create
        @proveedor = Supplier.new(supplier_params)
  
        if @proveedor.save

          flash.notice = '!proveedor creado!.'
          redirect_to suppliers_path
      
        else
          # Error message
          flash.now.alert = '¡Error al crear!'
          render :new
  
        end
    end

    def edit
    end

    def update
        if @proveedor.update(supplier_params)
            redirect_to suppliers_path, notice: "¡Actualizado!"
        else
          render :edit, status: :unprocessable_entity, alert: '¡Error al editar!'
        end
    end

    def destroy
        if @proveedor.destroy
         redirect_to suppliers_path, notice: "¡Eliminado!"
        else
         redirect_to suppliers_path, alert: "¡Error al eliminar!"
        end
     end

     private
     def set_supplier
       @proveedor = Supplier.find(params[:id])
     end
   
     def supplier_params
        params.require(:supplier).permit(
            :company_name, 
            :imageurl, 
            :address, 
            :cp,
            :city, 
            :contact_name,
            :email,
            :phone
        )
     end




end




