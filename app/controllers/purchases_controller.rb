class PurchasesController < ApplicationController
  

  def show
    @compra=Purchase.find(params[:id])
    @item=Item.new
    @items=Item.where("purchase_id = ?", @compra.id)
  end

  def index
    @compras=Purchase.all
  end

  def new
    @compra=Purchase.new
  end

  def create
    @compra=Purchase.new(purchase_params)
    if(@compra.save)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to purchases_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to new_purchase_path
    end  
  end

  def edit
    @compra=Purchase.find(params[:id])
  end

  def update
    @compra=Purchase.find(params[:id])
    id_compra=@compra.id
    if(@compra.update(purchase_params))
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to purchase_path(id_compra)
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to purchase_path(id_compra)
    end  
  end

  def destroy
    @compra=Purchase.find(params[:id])
    if(@compra.destroy)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to purchases_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to purchases_path
    end  
  end

  private
  def purchase_params
    params.require(:purchase).permit(:lugar,:fecha,:cantidad_items,:total,:factura)
  end 
end
