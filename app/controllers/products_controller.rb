class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy, :show]
  before_action :set_categories, only: [:new, :edit, :create, :update]
  before_action :set_suppliers, only: [:new, :edit, :create]

  def index
    @productos = Product.includes(:suppliers, :categories).order(created_at: :desc).all

    # if params[:query_text].present?
    #   puts "😍😍😍😍😍😍😍😍😍😍😍😍😍😍😍😍😍😍"
    #   @resultados = Product.search_full_text(params[:query_text])
    #   respond_to do |format|
    #     format.html # Render the default view if necessary
    #     format.turbo_stream # Render the Turbo Stream response
    #   end
    # else
    #   render :edit # Render the desired view or template within the SalesController
    # end

  end

  def new
    @producto = Product.new
  end

  def edit
    @producto = Product.find(params[:id])
  end



  def show
    @producto
  end

  def create
    @producto = Product.new(product_params)

    if @producto.save
      redirect_to products_path, notice: '!Creado!.'
    else
      flash.now.alert = '¡Error al crear!'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @producto = Product.find(params[:id])
    if @producto.update(product_params)
      redirect_to products_path, notice: "¡Actualizado!"
    else
      render :edit, status: :unprocessable_entity, alert: '¡Error al editar!'
    end
  end 

  def destroy
    @producto = Product.find(params[:id])
    if @producto.destroy
      redirect_to products_path, notice: "¡Eliminado!"
    else
      redirect_to products_path, alert: "¡Error al eliminar!"
    end
  end

  private

  def product_params
    params.require(:product).permit(:nombre, :description, :categories_id, :suppliers_id, :imagen, :sku, :oldprice, :realprice, :weight, :existencekg, :existence, :commission_for_sale, :commission_amount)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categorias = Category.all
  end

  def set_suppliers
    @proveedores = Supplier.all
  end
end
