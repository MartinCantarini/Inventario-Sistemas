class ModelsController < ApplicationController

  def show
    @modelo=Model.find(params[:id])
    @departamentos_que_usan_modelos_de_toner=Office.getDepartamentoUsandoToner(@modelo.id)
  end

  def index
    @modelos=Model.all.order('nombre DESC')
    if params[:search].present? #and !params[:fecha_desde].present? and !params[:fecha_hasta].present?
      #BUSCO POR MODELO
      @modelo_id=params[:search]
      @modelos = Model.busqueda_modelo(params[:search]).order("created_at DESC")
    # elsif params[:search].present? and params[:fecha_desde].present? and params[:fecha_hasta].present?
    #   #BUSCO POR MODELO y FECHA
    #   @modelo_id=params[:search]
    #   @modelos = Model.busqueda_modelo(params[:search]).order("created_at DESC")
    #   @fecha_desde=params[:fecha_desde]
    #   @fecha_hasta=params[:fecha_hasta]
    # elsif !params[:search].present? and params[:fecha_desde].present? and params[:fecha_hasta].present?
    #   #BUSCO POR FECHA
    #   @modelos=Model.all.order('created_at DESC')
    #   @fecha_desde=params[:fecha_desde]
    #   @fecha_hasta=params[:fecha_hasta]
    else
      @modelos = Model.all.order('nombre DESC')
    end
  end

  def new
    @modelo=Model.new
  end

  def create
    @modelo=Model.new(model_params)
    if(@modelo.save)
        flash[:notice] = "La operación se realizó con éxito!"
        redirect_to models_path
    else
        flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
        redirect_to new_model_path
    end
  end

  def edit
    @modelo=Model.find(params[:id])
  end

  def update
    @modelo=Model.find(params[:id])

    if(@modelo.update(model_params))
        flash[:notice] = "La operación se realizó con éxito!"
        redirect_to models_path
    else
        flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
        redirect_to models_path
    end
  end

  def destroy
    @modelo=Model.find(params[:id])
    if(@modelo.destroy)
      flash[:notice] = "La operación se realizó con éxito!"
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
    end
    redirect_to models_path
  end

  private
  def model_params
    params.require(:model).permit(:nombre)
  end
end
