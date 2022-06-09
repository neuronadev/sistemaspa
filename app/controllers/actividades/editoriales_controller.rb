class Actividades::EditorialesController < ApplicationController
  def index
  end

  def new
    idprod = params[:prod]
    @producto = Producto.find(idprod.to_i)
    @editorial = Editorial.new
    @editorial.build_libro
    @editorial.build_revista
    
    if @producto.pathf == 'ART-C-JCR'
         @tipo = 'J'
         render partial: 'form_art' 
    end
    if @producto.pathf == 'ART-C-CONACYT'
         @tipo = 'Y'
         render partial: 'form_art' 
    end  
    if @producto.pathf == 'ART-C-OTROS'
         @tipo = 'O'
         render partial: 'form_art' 
    end
    if @producto.pathf == 'CAPITULO'
          render partial: 'form_libro' 
     end
        
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
     @pathf = params[:pathf]
     @editorial = Editorial.new(editorial_params)
     respond_to do |format|
        if @editorial.save
              #render partial: 'show', notice:'El libro se ha registrado correctamente'
              format.json do 
                  if @pathf == 'CAPITULO' 
                         render json: {status:'OK', id:@editorial.libro.id, txt:@editorial.libro.nomlibro}
                  end
                  if  @pathf == 'ART-C-JCR' || @pathf == 'ART-C-CONACYT' || @pathf == 'ART-C-OTROS'
                         render json: {status:'OK', id:@editorial.revista.id, txt:@editorial.revista.nomrevista}
                  end   
              end    
        else
                  if @pathf == 'CAPITULO' 
                          format.html { render partial: 'form_libro', status: :unprocessable_entity }
                  end    
                  if  @pthf == 'ART-C-JCR' || @pthf == 'ART-C-CONACYT' || @pthf == 'ART-C-OTROS'
                         format.html { render partial: 'form_art', status: :unprocessable_entity }    
                  end
        end     
     end   
  end

  private 
  def editorial_params
    params.require(:editorial).permit(:nomeditorial,:especializada,:ciudad,:pais_id,:ambito_id,
                                      libro_attributes:[:id, :editorial_id, :nomlibro, :editores, :isbn, :anio, :nopaginas, :tipolibro_id ],
                                      revista_attributes:[:id, :editorial_id, :tiporevista, :nomrevista, :issn ]
                                    )
  end

end
