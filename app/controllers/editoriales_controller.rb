class EditorialesController < ApplicationController
  before_action :authenticate_usuario!
  #before_action :ambitos_select

  def index
    @editoriales = Editorial.where("estado='A'").order(:nomeditorial)
    
  end

  def new
    @editorial = Editorial.new
    
  end

  def create
    
    @editorial = Editorial.new(editorial_params)
     respond_to do |format|
         if @editorial.valid?
             if @editorial.save
                 flash[:notice] = 'Registro ok...'
                 format.html {redirect_to editoriales_path}
                 format.js
             end
         else
            flash[:error] = "Error, la información esta incompleta."
            format.html {render :action=>'new'}
            format.js
         end
      end   
  end

  def show
  end

  def edit
    id = params[:id]
    @editorial = Editorial.find(id)
  end

  def update
    id = params[:id]
    @editorial = Editorial.find(id)
    respond_to do |format|
       if @editorial.update(editorial_params)
          flash[:notice] = 'Actualización ok...'
          format.html {redirect_to editoriales_path}
       else
          flash[:error] = "Error, la información esta incompleta."
          format.html {render :action=>'edit'}
       end   
    end   
  end

  def destroy
    id = params[:id]
    editorial = Editorial.find(id)
    editorial.update(estado:'X')
    redirect_to editoriales_path
  end

  private def editorial_params
    params.require(:editorial).permit(:nomeditorial,:especializada,:ciudad,:pais_id,:ambito_id)
  end

  #private def ambitos_select
  #  @especializada = {"SI":"S", "NO":"N"}
  #end

end
