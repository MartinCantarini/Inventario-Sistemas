class FunctionsController < ApplicationController
  def show
    @funcion=Function.find(params[:id])
  end

  def index
    @funciones=Function.all
    @impresoras=Printer.where("id != ?",1)
  end

  def new
    @funcion=Function.new
  end

  def create
  @funcion=Function.new(function_params)
  if(@funcion.save)
    flash[:notice] = "La operación se realizó con éxito!"
    redirect_to functions_path
  else
    flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
    redirect_to new_function_path
  end
  end

  def edit
    @funcion=Function.find(params[:id])
  end

  def update
    @funcion=Function.edit(function_params)
    if(@funcion.save)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to functions_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to functions_path
    end
  end

  def destroy
  end

  private
  def function_params
    params.require(:function).permit(:funcion)
  end 
end
