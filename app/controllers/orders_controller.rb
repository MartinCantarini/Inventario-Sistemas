class OrdersController < ApplicationController
  def show
    @orden = Order.find(params[:id])
    @nombre_oficina = Office.getNombreOficina(@orden.office_id)
  end

  def index
    @departamentos=Department.all
    @ordenes=Order.all
    if params[:q].present?
      @ordenes = Order.search(params[:q]).order("created_at DESC")
      oficina_direccion_id=Office.find(params[:q]).direction_id
      oficina_department_id=Office.find(params[:q]).department_id
      @oficina=Direction.find(oficina_direccion_id).nombre + Department.find(oficina_department_id).nombre 
    else
      @ordenes = Order.all.order('created_at DESC')
    end
  end

  def new
    @orden=Order.new
  end

  def create
    @orden=Order.new(order_params)
    if(@orden.save)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to order_path(@orden.id)
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to orders_path
    end  
  end

  def edit
    @orden=Order.find(params[:id])
  end

  def update
    @orden=Order.find(params[:id])
    if @orden.update(order_params)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to order_path(@orden.id)
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to orders_path
    end 
  end

  def destroy
    @orden=Order.find(params[:id])
    orden_id=@orden.id
    if(@orden.destroy)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to orders_path
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to order_path(orden_id)
    end  
  end

  private 
  def order_params
    params.require(:order).permit(:fecha,:file,:finalizado,:office_id)
  end
end
