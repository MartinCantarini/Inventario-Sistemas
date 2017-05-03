class RechargesController < ApplicationController
  def show
    @recarga=Recharge.find(params[:id])
  end

  def new
    @recarga=Recharge.new
  end

  def create
    @recarga=Recharge.new(recharge_params)
    id_cartucho=@recarga.cartridge_id
    if(@recarga.save)
        flash[:notice] = "La operación se realizó con éxito!"
        redirect_to cartridge_path(id_cartucho)
    else
        flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
        redirect_to cartridge_path(id_cartucho)
    end
  end

  def edit
    @recarga=Recharge.find(params[:id])
  end

  def update
    @recarga=Recharge.find(params[:id])
    id_cartucho=@recarga.cartridge_id
    if(@recarga.update(recharge_params))
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to cartridge_path(id_cartucho)
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to cartridge_path(id_cartucho)
    end 
  end

  def destroy
    @recarga=Recharge.find(params[:id])
    id_cartucho=@recarga.cartridge_id
    if(@recarga.destroy)
        flash[:notice] = "La operación se realizó con éxito!"
        redirect_to cartridge_path(id_cartucho)
    else
        flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
        redirect_to cartridges_path
    end
  end
  private
  def recharge_params
    params.require(:recharge).permit(:detalles, :lugar_recarga, :calle,:telefono,:fecha_recarga_inicio, :fecha_recarga_fin,:cartridge_id)
  end   
end
