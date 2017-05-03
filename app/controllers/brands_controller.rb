class BrandsController < ApplicationController
  def show
    @marca=Brand.find(params[:id])
  end

  def index
    @marcas=Brand.all
  end

  def new
    @marca=Brand.new
  end

  def create
    @marca=Brand.new(brand_params)
    if(@marca.save)
      flash[:notice] = "La operación se realizó con éxito!"  
      redirect_to printers_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to new_brand_path
    end  
  end

  def edit
    @marca=Brand.find(params[:id])
  end

  def update
    @marca=Brand.find(params[:id]) 
    if(@marca.update(brand_params))
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to printers_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to edit_brand_path(@marca.id)
    end  
  end

  def destroy
    @marca=Brand.find(params[:id])
    if(@marca.destroy)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to printers_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to brands_path
    end
  end

  def brand_params
    params.require(:brand).permit(:nombre)
  end   
end
