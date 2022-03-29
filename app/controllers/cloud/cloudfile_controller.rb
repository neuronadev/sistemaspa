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

  def downpdf
    
      require 'open-uri'
      url = "https://inecol-my.sharepoint.com/:b:/g/personal/antonio_francisco_inecol_mx/Ec7rVnZjEsdJrltTf_GzYqcBv4tuAMe6swZ_pax3EIW8tw?e=Yhybci"
      file_name = params[file_name]
      data = open(url).read
      send_data data, :disposition => 'attachment', :filename=>"#{file_name}.pdf"
  
    
  end

  private 
  def cloudfile_params
     params.require(:cloudfile).permit(:descripcion, :hashlink, :periodo, :estado, :actadoc)
  end   

end
