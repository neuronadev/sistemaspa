class ProductosController < ApplicationController
  def index
    @idactiv = 0
     @productos = Producto.where("estado = 'A'").order(:descripcion)
  end

  def cambio
    @idactiv = params[:idactiv]
    id = params[:id].to_i
     if id == 0
       ids = [8,9,10,11,12,13,14,15,16,17,18,19] 
       if current_usuario.rol == 'T' 
         @categorias = Prodcategoria.where("estado = 'A'").order(:nomcategoria)
       end  
       if current_usuario.rol == 'I'  || current_usuario.rol == 'C'
         @categorias = Prodcategoria.where("estado = 'A' and id not in (?)",ids).order(:nomcategoria)
      end  
         
         @tot_act = Sustantiva.where("academico_id=? and estado != 'X'",current_usuario.persona.academico.id).count()
         @prom = 0.0
         evaltec = 0.0
         Sustantiva.where("academico_id=? and estado = 'C'",current_usuario.persona.academico.id).each do |s|
             evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
         end
         
         @prom = evaltec.round(2)
         
     else
      puts "no hay valor"  
     end  
  end

  def new
    @producto = Producto.new
    @producto.build_prodcategoria
    @producto.build_prodgrupo
  end

  def create
    @producto = Producto.new(producto_params)
     respond_to do |format|
         if @producto.valid?
             if @producto.save
                 flash[:notice] = 'Registro ok...'
                 format.html {redirect_to productos_path}
             end
         else
            flash[:error] = "Error, la información esta incompleta."
            format.html {render :action=>'new'}
         end
      end  
  end

  def show
    @idactiv = 0 
    id = params[:id].to_i
     if id == 0
       ids = [8,9,10,11,12,13,14,15,16,17,18,19] 
       if current_usuario.rol == 'T' 
         @categorias = Prodcategoria.where("estado = 'A'").order(:nomcategoria)
       end  
       if current_usuario.rol == 'I'  || current_usuario.rol == 'C'
         @categorias = Prodcategoria.where("estado = 'A' and id not in (?)",ids).order(:nomcategoria)
      end  
         
         @tot_act = Sustantiva.where("academico_id=? and estado != 'X'",current_usuario.persona.academico.id).count()
         @prom = 0.0
         evaltec = 0.0
         Sustantiva.where("academico_id=? and estado = 'C'",current_usuario.persona.academico.id).each do |s|
             evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
         end
         
         @prom = evaltec.round(2)
         
     else
      puts "no hay valor"  
     end  

  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  private def producto_params
    params.require(:producto).permit(:descripcion,:descripcioncorta,:puntaje,:prodcategoria_id,:prodgrupo_id)
  end

end
