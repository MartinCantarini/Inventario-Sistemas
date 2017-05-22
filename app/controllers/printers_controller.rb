class PrintersController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  def show
    @impresora=Printer.find(params[:id])
    if !@impresora.office_id.blank?
      @departamento=Office.getNombreOficina(@impresora.office_id)
    else
      @departamento=""
    end  
    @cartucho_ids=Cartridge.getIdCartuchos(@impresora.id)
  end

  def index
    @impresoras=Printer.where("id != ?",1)
    if params[:codigo_impresora].present?
      @impresoras = Printer.where("id != ? AND codigo = ?",1,params[:codigo_impresora])
    else
      @impresoras=Printer.where("id != ?",1)
    end
  end

  def new
    @impresora= Printer.new
  end

  def create
    @impresora=Printer.new(printer_new_params)
    #Asigno un modelo de cartucho a la impresora, segun el cartucho que se seleccion
    #end

    if(@impresora.save)
        #Genero el codigo para la nueva impresora
        id_impresora=@impresora.id
        @impresora.codigo="imp"+id_impresora.to_s
        @impresora.save
        #end

        #Generar código QR
        url="http://geri.sistemas.cic.gba.gob.ar/printers/#{id_impresora}"    
        @qr = RQRCode::QRCode.new( url, :size => 6, :level => :h )
        @nombre_imagen='imp#{id_impresora}'
        @png = @qr.to_img                                             # returns an instance of ChunkyPNG
        @png.resize(150, 150).save("public/images/impresoras/imp#{id_impresora}.png")
        img = Magick::Image.read("public/images/impresoras/imp#{id_impresora}.png").first
        titulo_img=Magick::Image.new(150, 20)
        qr=Magick::Image.new(150, 170)
        txt = Magick::Draw.new
        titulo_img.annotate(txt, 0,0,0,0, @impresora.codigo){
          txt.gravity = Magick::SouthGravity
          txt.pointsize = 20
          txt.font_weight = Magick::BoldWeight
          txt.fill = '#000000'
        }
        qr.composite!(img, Magick::NorthWestGravity, 0, 0, Magick::OverCompositeOp)
        qr.composite!(titulo_img, Magick::NorthWestGravity, 0, 150, Magick::OverCompositeOp)
        qr.format = 'jpeg'
        qr.write("public/images/impresoras/imp#{id_impresora}.png")
        #end
        flash[:notice] = "La operación se realizó con éxito!"
        redirect_to printers_url
    else
        flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
        redirect_to new_printer_url
    end   
  end

  def edit
    @impresora= Printer.find(params[:id])
  end

  def update
    @impresora= Printer.find(params[:id])
    id_impresora=@impresora.id
    if(@impresora.update(printer_edit_params))    
        flash[:notice] = "La operación se realizó con éxito!"
        redirect_to printer_path(id_impresora)
    else
        flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
        redirect_to printer_path(id_impresora)
    end  
  end

  def destroy
    @impresora= Printer.find(params[:id])
    @cartucho_ids=Cartridge.getIdCartuchos(@impresora.id)
    @cartucho_ids.each do |id_cartucho|
      cartucho=Cartridge.find(id_cartucho)
      cartucho.estado='libre'
      cartucho.printer_id=nil
      cartucho.save
    end 
    if (@impresora.destroy)
      flash[:notice] = "La operación se realizó con éxito!"    
      redirect_to printers_url
    else
      flash[:alert] = "No se pudo completar la operación, por favor intentelo nuevamente"
      redirect_to printers_url
    end    
  end

  private
  def printer_new_params
    params.require(:printer).permit(:codigo,:modelo,:detalles,:office_id,:red_disponible,:numero_inventario, :brand_id,function_ids: [])
  end 
  def printer_edit_params 
    params.require(:printer).permit(:modelo,:detalles,:office_id,:red_disponible,:numero_inventario,:brand_id, function_ids: [])
  end  
end
