class ItemsController < ApplicationController
  def show
    @item=Item.find([:id])
  end

  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item = Item.create!(item_params)
    #Actualizo cantidad de items de una compra
    @compra=Purchase.find(@item.purchase_id)
    @compra.cantidad_items=@compra.cantidad_items+@item.cantidad_pedidas
    @compra.save
    ############
    @items=Item.all
    @items=Item.where("purchase_id = ?", @item.purchase_id)
    respond_to do |f|
      f.html { redirect_to purchase_url(@item.purchase_id) }
      f.js
    end
  end

  def edit
  end

  def update
     @item=Item.find([:id])
     id_item=@item.id
     if(@item.update(item_params))
       flash[:notice]="La operación se realizó con éxito!"
       redirect_to item_path(id_item)
     else
       flash[:error]="No se pudo completar la operación, por favor intentelo nuevamente"
       redirect_to edit_item_path(id_item)
     end
  end

  def destroy
    #ID de la compra a la cual pertence el item
    id_purchase=Item.find(params[:id]).purchase_id
    #Cantidad de unidades pedidas del itema a borrar
    cantidad_pedidas_item=Item.find(params[:id]).cantidad_pedidas
    #Actualizo cantidad de items de una compra
    @compra=Purchase.find(id_purchase)
      if(@compra.cantidad_items >= cantidad_pedidas_item)
        @compra.cantidad_items=@compra.cantidad_items-cantidad_pedidas_item
        @compra.save
      end
    ############
    @item=Item.destroy(params[:id])
    @items=Item.where("purchase_id = ?", id_purchase)
    respond_to do |f|
      f.html { redirect_to purchases_url }
      f.js
    end
  end
  
  def increase
    @item=Item.find(params[:id])
    @item.cantidad_servidas=@item.cantidad_servidas+1
    @item.save
    @items=Item.all
    respond_to do |format|
      format.html { redirect_to purchase_url(@item.purchase_id) }
      format.js   
    end
  end
  
  def decrease
    @item=Item.find(params[:id])
    if(@item.cantidad_servidas > 0)
      @item.cantidad_servidas=@item.cantidad_servidas-1
    end
    @item.save
    @items=Item.all
    respond_to do |format|
      format.html { redirect_to purchase_url(@item.purchase_id) }
      format.js   
    end
  end

  private
  def item_params
    params.require(:item).permit(:purchase_id,:model_id,:cantidad_pedidas,:cantidad_servidas)
  end
end
