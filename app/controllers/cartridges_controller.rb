class CartridgesController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  def show
    @cartucho=Cartridge.find(params[:id])
    @modelo_cartucho=Model.find(@cartucho.model_id).nombre
    @recargas_cartucho=Recharge.where(:cartridge_id=>params[:id])
    @impresora_del_cartucho=Printer.find(@cartucho.printer_id)
  end

  def index
    @cartuchos = Cartridge.all.order('created_at DESC')
    @cantidad_comprados=Cartridge.cantidad_total
    @cantidad_libres_total=Cartridge.cantidad_libres_total
    @cantidad_recargando_total=Cartridge.cantidad_recargando_total
    if params[:codigo_cartucho].present?
      @cartuchos = Cartridge.where(:codigo=>params[:codigo_cartucho])
    elsif params[:fecha_desde].present? and params[:fecha_hasta].present?
      fecha_desde=params[:fecha_desde]
      fecha_hasta=params[:fecha_hasta]
      @cantidad_comprados = Cartridge.cantidad_fecha_entrada(fecha_desde,fecha_hasta)
      @cantidad_libres = Cartridge.cantidad_fecha_estado_libre(fecha_desde,fecha_hasta)
      @cantidad_recargando = Cartridge.cantidad_fecha_estado_recargando(fecha_desde,fecha_hasta)
    else
      @cartuchos = Cartridge.all.order('created_at DESC')
    end
  end

  def new
    @cartucho=Cartridge.new
  end

  def create
    @cartucho=Cartridge.new(cartridge_params_new)
    @cartucho.fecha_estado=Date.today
    if(@cartucho.save)
      id_compra_cartucho=@cartucho.purchase_id
      @cartucho.fecha_entrada=Purchase.find(id_compra_cartucho).fecha
      @cartucho.codigo="car"+@cartucho.id.to_s
      if(@cartucho.printer_id==1)
        @cartucho.estado='libre'
      else
        @cartucho.estado='en uso'
      end
      @cartucho.save
      id_cartucho=@cartucho.id
      #Generar código QR
        url="http://geri.sistemas.cic.gba.gob.ar/cartridges/#{id_cartucho}"
        @qr = RQRCode::QRCode.new( url, :size => 6, :level => :h )
        @png = @qr.to_img                                             # returns an instance of ChunkyPNG
        @png.resize(150, 150).save("public/images/cartuchos/car#{id_cartucho}.png")
        img = Magick::Image.read("public/images/cartuchos/car#{id_cartucho}.png").first
        titulo_img=Magick::Image.new(150, 20)
        qr=Magick::Image.new(150, 170)
        txt = Magick::Draw.new
        titulo_img.annotate(txt, 0,0,0,0, @cartucho.codigo){
         txt.gravity = Magick::SouthGravity
         txt.pointsize = 20
          txt.font_weight = Magick::BoldWeight
          txt.fill = '#000000'
        }
        qr.composite!(img, Magick::NorthWestGravity, 0, 0, Magick::OverCompositeOp)
        qr.composite!(titulo_img, Magick::NorthWestGravity, 0, 150, Magick::OverCompositeOp)
        qr.format = 'jpeg'
        qr.write("public/images/cartuchos/car#{id_cartucho}.png")
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to cartridge_path(@cartucho.id)
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to cartridges_path
    end
  end

  def edit
    @cartucho=Cartridge.find(params[:id])
  end

  def update
    @cartucho=Cartridge.find(params[:id])
    id_impresora=@cartucho.printer_id
    id_compra_cartucho=@cartucho.purchase_id
    @cartucho.fecha_entrada=Purchase.find(id_compra_cartucho).fecha
    if(@cartucho.update(cartridge_params_edit))
      if(@cartucho.printer_id==1)
        if(@cartucho.estado!='cargando' and @cartucho.estado!='baja')
          @cartucho.estado='libre'
        end
      else
        @cartucho.estado='en uso'
      end
      @cartucho.fecha_entrada=Purchase.find(id_compra_cartucho).fecha
      @cartucho.id_ultima_impresora=id_impresora
      @cartucho.save
      id_cartucho=@cartucho.id
      #Generar código QR
        url="http://geri.sistemas.cic.gba.gob.ar/cartridges/#{id_cartucho}"
        @qr = RQRCode::QRCode.new( url, :size => 6, :level => :h )
        @png = @qr.to_img                                             # returns an instance of ChunkyPNG
        @png.resize(150, 150).save("public/images/cartuchos/car#{id_cartucho}.png")
        img = Magick::Image.read("public/images/cartuchos/car#{id_cartucho}.png").first
        titulo_img=Magick::Image.new(150, 20)
        qr=Magick::Image.new(150, 170)
        txt = Magick::Draw.new
        titulo_img.annotate(txt, 0,0,0,0, @cartucho.codigo){
         txt.gravity = Magick::SouthGravity
         txt.pointsize = 20
          txt.font_weight = Magick::BoldWeight
          txt.fill = '#000000'
        }
        qr.composite!(img, Magick::NorthWestGravity, 0, 0, Magick::OverCompositeOp)
        qr.composite!(titulo_img, Magick::NorthWestGravity, 0, 150, Magick::OverCompositeOp)
        qr.format = 'jpeg'
        qr.write("public/images/cartuchos/car#{id_cartucho}.png")
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to cartridge_path(@cartucho.id)
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to cartridge_path(@cartucho.id)
    end
  end

  def destroy
    @cartucho=Cartridge.find(params[:id])

    if(!@cartucho.printer_id.present? and @cartucho.destroy)
      flash[:notice] = "La operación se realizó con éxito!"
      redirect_to cartridges_path
    else
      if(@cartucho.printer_id.present?)
        flash[:alert] = "No se pudo completar la operación, ya que tiene una impresora asociada a este cartcho"
      else
        flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      end
      redirect_to cartridges_path
    end
  end

  private
  def cartridge_params_new
     params.require(:cartridge).permit(:codigo,:estado, :original, :fecha_entrada, :purchase_id,:fecha_estado, :color, :brand_id, :model_id, :printer_id)
  end
  def cartridge_params_edit
     params.require(:cartridge).permit(:estado, :original, :fecha_entrada, :purchase_id, :fecha_estado, :color, :brand_id, :model_id,:printer_id,:id_ultima_impresora)
  end
end
