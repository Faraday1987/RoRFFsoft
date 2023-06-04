class ClientsController < ApplicationController
    before_action :set_client, only: [:edit, :update, :destroy]


    def index
        @clientes = Client.all
    end

    def new
        @cliente =  Client.new
    end

    def create
        @cliente = Client.new(client_params)
  
        if @cliente.save

          flash.notice = '!Cliente creado!.'
          redirect_to clients_path
      
        else
          # Error message
          flash.now.alert = '¡Error al crear!'
          render :new
  
        end
    end

    def edit
    end

    def update
        if @cliente.update(client_params)
            redirect_to clients_path, notice: "¡Actualizado!"
        else
          render :edit, status: :unprocessable_entity, alert: '¡Error al editar!'
        end
    end

    def destroy
        if @cliente.destroy
         redirect_to clients_path, notice: "¡Eliminado!"
        else
         redirect_to clients_path, alert: "¡Error al eliminar!"
        end
     end

     private
     def set_client
       @cliente = Client.find(params[:id])
     end
   
     def client_params
        params.require(:client).permit(
            :nombre, 
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