class OfficesController < ApplicationController
  def show
    @oficina=Office.find(params[:id])
    @impresoras=Printer.getImpresoraDeOficina(@oficina.id)
  end

  def index
    @oficinas=Office.all
  end

  def new
    @oficina=Office.new
  end

  def create
    @oficina=Office.new(params_office)
    if(@oficina.save)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to offices_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to offices_path
    end 
  end

  def edit
    @oficina=Office.find(params[:id])
  end

  def update
    @oficina=Office.find(params[:id])
    id_oficina=@oficina.id
    if(@oficina.update(params_office))
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to office_path(id_oficina)
    else
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to office_path(id_oficina)
    end  
  end

  def destroy
  end

  def params_office
    params.require(:office).permit(:department_id,:direction_id,:nombre_encargado)
  end 
end
