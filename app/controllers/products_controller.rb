class ProductsController < ApplicationController
  
  def show
    @producto=Product.find(params[:id])
  end

  def index
    @productos=Product.all
  end

  def new
    @producto=Product.new
  end

  def create
    @producto=Product.new(params_product)
    if @producto.save
      id_producto=@producto.id
      flash[:notice]="La operación se realizó con éxito!"
      redirect_to product_path(id_producto)
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to new_product_path
    end
  end

  def edit
    @producto=Product.find(params[:id])
  end

  def update
    @producto=Product.find(params[:id]) 
    id_producto=@producto.id
    @producto=Product.edit(params_product) 
    if @producto.save
      flash[:notice]="La operación se realizó con éxito!"
      redirect_to product_path(id_producto)
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to product_path(id_producto)
    end
  end

  def destroy
    @producto=Product.find(params[:id])
    if @producto.destroy
      redirect_to pruducts_path
      flash[:notice] = "La operación se realizó con éxito!"
    else
      redirect_to pruducts_path
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
    end  
  end
end
