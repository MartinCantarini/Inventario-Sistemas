class DepartmentsController < ApplicationController
  def show
    @departamento=Department.find(params[:id])
  end

  def index
    @departamentos=Department.all
  end

  def new
    @departamento=Department.new
  end

  def create
    @departamento=Department.new(params_department)
    if(@departamento.save)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to departments_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to departments_path
    end 
  end

  def edit
    @departamento=Department.find(params[:id])
  end

  def update
    @departamento=Department.find(params[:id])
    if(@departamento.update(params_department))
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to departments_path
    else
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to departments_path
    end  
  end

  def destroy
  end

  def params_department
    params.require(:department).permit(:nombre)
  end  
end
