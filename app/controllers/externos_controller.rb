require 'rest-client'
require 'json'
require 'base64'
require 'date'

class ExternosController < ApplicationController
  def index
    @items = Array.new 
    persona = Persona.find(current_usuario.persona_id)
    idfnet = persona.idfnet
    c = Fundanet.new
    data = JSON.parse(c.obtenerPublicaciones(idfnet))
    
    total = data['TotalElementos']
    linkSig = data['LinkSiguientes']

       @items.push(data['Elementos'])
       while linkSig != nil
            data = JSON.parse(c.obtenerSiguientes(linkSig))
            @items.push(data['Elementos'])
            linkSig = data['LinkSiguientes']
       end
       #puts @items
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

class Fundanet
  @@host = "https://inecol.fundanetsuite.com/FundanetApi/api"  
  @@host_sig = "https://inecol.fundanetsuite.com"  
  @@ruta_autorizacion = "/autorizacion"
  @@ruta_publicaciones = "/pc/publicaciones"
  @@ruta_investigadores = "/pc/investigadores"
  @@ruta_investigador = "/pc/investigador"
  @@ruta_odatpub = "/pc/publicacion"

  @@usuario = "pfundanet"
  @@contrasena = "semicrol10"
  @@token = '' 
  @@credenciales = ''
  @@anualidad = '2019'
 
    def initialize
      @@credenciales = Base64.encode64(@@usuario+":"+@@contrasena)
      begin
          r = RestClient.post @@host + @@ruta_autorizacion,{:foo => ''}, {:Authorization => 'Bearer ' + @@credenciales}
            rescue RestClient::Unauthorized, RestClient::Forbidden => e
              puts e.message
            else
                data = JSON.parse r
                @@token = data['Token']       
      end 
    end
    
    def obtenerPublicaciones(idInvestigador)
      begin   
        p = RestClient.get @@host + @@ruta_publicaciones+"?IdInvestigador=#{idInvestigador}&AnualidadDesde=" + @@anualidad, {:Authorization => 'Bearer ' + @@token}
        rescue RestClient::Unauthorized, RestClient::Forbidden => e 
          return e.message
        else    
          return p
      end   
     end

     def obtenerSiguientes(link)
        begin   
          p = RestClient.get @@host_sig + link, {:Authorization => 'Bearer ' + @@token}
        rescue RestClient::Unauthorized, RestClient::Forbidden => e 
          return e.message
        else    
          return p
        end   
    end


    def oDatPublicacion(idPublicacion)
      begin   
        p = RestClient.get @@host + @@ruta_odatpub+"?IdPublicacion=#{idPublicacion}", {:Authorization => 'Bearer ' + @@token}
    rescue RestClient::Unauthorized, RestClient::Forbidden => e 
        return e.message
    else    
        return p
    end  
  end  

end
