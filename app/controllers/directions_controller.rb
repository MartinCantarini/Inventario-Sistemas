class DirectionsController < ApplicationController
  def show
    @direccion=Direction.find(params[:id])
  end

  def index
    @direcciones=Direction.all
  end

  def new
    @direccion=Direction.new
  end

  def create
    @direccion=Direction.new(params_direction)
    if @direccion.save
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to directions_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to directions_path
    end  
  end

  def edit
    @direccion=Direction.find(params[:id])
  end

  def update
    @direccion=Direction.find(params[:id])
    if(@direccion.update(params_direction))
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to directions_path
    else
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to directions_path
    end  
  end

  def destroy
  end

  def params_direction
    params.require(:direction).permit(:nombre)
  end 
end
