class Cloud::CloudfileController < ApplicationController
  before_action :authenticate_usuario!, except: [:show]
  def index
  end

  def show
      hfile = params[:id]
      file = Cloudfile.where(hashlink:hfile).first
      @error = ''
      if !file.nil?
         send_data file.actadoc.download, filename: file.descripcion.strip+".pdf", type: 'application/pdf', disposition: 'inline'
      else
          @error = "El recurso solicitado o esta disponible." 
      end
  end

  def new
    @cloudfile = Cloudfile.new
    
  end

  def create
    @cloudfile = Cloudfile.new(cloudfile_params)
    
    if @cloudfile.valid?
       @cloudfile.save
       t = Time.now.to_f
       hashfile = t.to_s.gsub('.','')
       @cloudfile.hashlink = hashfile
       @cloudfile.save
      
    end
  end

  private 
  def cloudfile_params
     params.require(:cloudfile).permit(:descripcion, :hashlink, :periodo, :estado, :actadoc)
  end   

end