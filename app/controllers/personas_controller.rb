class PersonasController < ApplicationController
  before_action :authenticate_usuario!

  def search
    @query = params[:txt]
    @data = Persona.search_personas(@query).where(estado:'A').order(:paterno)
    render partial: "search"
  end
 
  def index
    @personas = Persona.where("estado='A'").order(:paterno)
    
  end

  def new
    @persona = Persona.new
    @persona.build_academico
  end

  def create
    @persona = Persona.new(persona_acad_params)
     respond_to do |format|
         if @persona.valid?
             
             if @persona.save
                 flash[:notice] = 'Registro ok...'
                 format.html {redirect_to personas_path, notice:'Registro ok..'}
             end

         else
            flash[:error] = "Error, la información esta incompleta."
            format.html {render :action=>'new'}
         end
      end   
  end

  def show
    persona_id = params[:id]
    @persona = Persona.find(persona_id)
  end

  def update
    personaid = params[:id]
    persona = Persona.find(personaid)
    persona.usuario.imagen.attach(params[:persona][:usuario_attributes][:imagen])
    #persona.update(persona_perfil_params)

  end

  def academico
    idred = params[:redid]
    academicos = Academico.where("red_id=?",idred)
    listap = Array.new
    academicos.each do |t|
      listap.push(t.persona_id) 
    end
    
    personas = Persona.where(:id=>listap).order(:paterno)

    str = "<option value='0' selected>-- Todos los investigadores -- </option>"
    personas.each do |a|
      str = str + '<option value='+a.id.to_s+'>'+(a.paterno||'')+' '+(a.materno||'')+' '+(a.nombre||'')+'</option>' 
    end
    render plain: str
  end

  private def persona_acad_params
     params.require(:persona).permit(:nombre,:paterno,:materno,:email,:genero,:tipopersona_id,academico_attributes:[:id,:noempleado,:fingreso,:red_id,:categoria_id,:nivel_id])
  end

  private def persona_perfil_params
    params.require(:persona).permit(usuario_attributes:[:id,:imagen])
 end



end
