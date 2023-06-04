class SalesController < ApplicationController
        before_action :set_sale, only: [:edit, :edit, :update, :destroy, :add_item, :remove_item]
      
        def index
          @ventas = Sale.order(created_at: :desc).all
        end
      
        def new
          @venta = Sale.create(importe: 0)
          redirect_to edit_sale_path(@venta)
        end
      
        def edit
          @productos_venta = @venta.sale_details
          if params[:query_text].present?
            @resultados = Product.search_full_text(params[:query_text])
            respond_to do |format|
              format.html # Render the default view if necessary
              format.turbo_stream # Render the Turbo Stream response
            end
          else
            render :edit # Render the desired view or template within the SalesController
          end

        end
      
        def show
          redirect_to sales_path
        end
      
        def create
          @venta = Sale.new(sale_params)
      
            if @venta.save
              flash.notice = '!Creado!.'
              redirect_to sales_path
          
            else
              flash.now.alert = '¡Error al crear!'
              render :new
            end
        end
      
        def update
            if @venta.update(sale_params)
              redirect_to sales_path, notice: "¡Actualizado!"
            else
              render :edit, status: :unprocessable_entity, alert: '¡Error al editar!'
            end
        end 

        # def destroy
        #   if @venta.destroy
        #     flash.notice = '!Eliminado correctamente!.'
        #     redirect_to sale_path
        #   else
        #     flash.now.alert = '¡Error al crear!'
        #     render :new
        #   end
        # end
        def destroy
          ActiveRecord::Base.transaction do
            @venta.sale_details.map do |detail|
              prod_vendido = Product.find(detail.product_id)
              prod_vendido.existence+= detail.cantidad
              ActiveRecord::Rollback unless prod_vendido.save
            end
        
            ActiveRecord::Rollback unless @venta.destroy
          end
      
          respond_to do |format|
            flash.notice = "La venta ha sido eliminada"
            redirect_to sales_url
          end
        end

        def add_item
          if params[:product_id].present?
            producto = Product.find(params[:product_id])
            cantidad = params[:cantidad].nil? ? 1 : params[:cantidad].to_i
            importe_producto = producto.realprice * cantidad
        
            @productos_venta = @venta.sale_details.build(product_id: producto.id, cantidad: cantidad)
            importe_antes_de_registro = @venta.importe
            importe_despues_registro = importe_antes_de_registro + importe_producto
            @venta.importe = importe_despues_registro

            if @venta.save
              flash.notice = '!Creado!.'
              redirect_to edit_sale_path(@venta.id)
          
            else
              flash.now.alert = '¡Error al crear!'
              render :new
            end

          end
        end

        def remove_item
          if params[:product_id].present?

            producto = Product.find(params[:product_id])
            @productos_venta = @venta.sale_details.find_by(id: params[:item_detail_id])
            
            if @productos_venta.present?
              importe_producto = producto.realprice * @productos_venta.cantidad
              
              importe_antes_de_registro = @venta.importe
              importe_despues_registro = importe_antes_de_registro - importe_producto
              @venta.importe = importe_despues_registro
              
              existencia_antes_venta = producto.existence
              producto.existence = existencia_antes_venta + @productos_venta.cantidad
              
                if @productos_venta.destroy && @venta.save && producto.save
                  flash.notice = 'Item eliminado con éxito'
                  redirect_to edit_sale_path(@venta.id)
                else
                  flash.now.alert = '¡Error al eliminar!'
                  render :edit
                end
              end
            else
                flash.now.alert = 'Item not found'
                render :edit
            end
        end
        
        
        

        private
        def set_sale
          @venta = Sale.find(params[:id])
        end
      
        def sale_params
            params.require(:proveedor).permit(
                :user_id,
                :importe,
                :amount,
                :date,
                :weight
            )
         end
      end
    
    