class WarehouseRecordsController < ApplicationController
    before_action :set_warehouse, only: [:edit, :update, :destroy]
    
    def index
        @records = WarehouseRecord.order(created_at: :desc).all
    end
    
    def new
        @record = WarehouseRecord.new
    end
    
    def edit
    end
    
    def show
        @record = WarehouseRecord.find(params[:id])
    end
    
    def create
        @record = WarehouseRecord.new(warehouse_params)
    
        if @record.save
            flash.notice = '!Creado!.'
            redirect_to warehouse_records_path
        
        else
            flash.now.alert = '¡Error al crear!'
            render :new
    
        end
    end
    
    def edit
        @record = Sale.find(params[:id])
    end
    
    def update
        if @record.update(warehouse_params)
            redirect_to warehouse_records_path, notice: "¡Actualizado!"
        else
            render :edit, status: :unprocessable_entity, alert: '¡Error al editar!'
        end
    end 
    
    def destroy
        if @record.destroy
        redirect_to warehouse_records_path, notice: "¡Eliminado!"
        else
        redirect_to warehouse_records_path, alert: "¡Error al eliminar!"
        end
    end
    
    private
    def set_warehouse
        @record = WarehouseRecord.find(params[:id])
    end
    
    def warehouse_params
        params.require(:proveedor).permit(
            :user_id,
            :supplier,
            :product,
            :cantidad,
            :disponible,
            :weight
        )
        end
end



    
    
    
    