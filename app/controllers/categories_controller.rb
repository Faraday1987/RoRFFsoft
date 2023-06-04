class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
  
    def index
      @categorias = Category.order(created_at: :desc).all
    end
  
    def new
      @categoria = Category.new
    end
  
    def edit
    end
  
    def show
      @categoria = Category.find(params[:id])
    end
  
    def create
      @categoria = Category.new(category_params)
  
        if @categoria.save
  
          # Success message
          flash.notice = '!Creado!.'
          redirect_to categories_path
      
        else
          # Error message
          flash.now.alert = '¡Error al crear!'
          render :new
  
        end
    end
  
    def edit
      @categoria = Category.find(params[:id])
    end
  
    def update
        # @categoria = Category.find(params[:id])
        if @categoria.update(category_params)
          redirect_to categories_path, notice: "¡Actualizado!"
        else
          render :edit, status: :unprocessable_entity, alert: '¡Error al editar!'
        end
    end 
  
    def destroy
       if @categoria.destroy
        redirect_to categories_path, notice: "¡Eliminado!"
       else
        redirect_to categories_path, alert: "¡Error al eliminar!"
       end
    end
  
    private
    def set_category
      @categoria = Category.find(params[:id])
    end
  
    def category_params
      permitted_params = params.require(:category).permit(:nombre, :descripcion, :imageurl)
      permitted_params[:imageurl] = "no-image.png" if permitted_params[:imageurl].blank?
      permitted_params
    end
  end