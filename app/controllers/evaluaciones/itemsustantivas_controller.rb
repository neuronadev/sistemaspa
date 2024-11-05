class Evaluaciones::ItemsustantivasController < ApplicationController
  def index
      @itemsust = Itemsustantiva.where(persona_id:current_usuario.persona_id).includes(:evaltecnico).where('evaltecnicos.anio':2024)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def cuestionario
      @tipo = params[:tipo]
      @iditem = params[:iditem]
      @itemsust = Itemsustantiva.find(@iditem.to_i)
  end

  def savecuestionario
      item_sustantiva = params[:iditem]
      tipo = params[:tipo]
      data = params[:data]

      reactivos = 25
      suma = 0.0
      calificacion = 0.0
      
      hash = JSON(data)
      hash.each do |c,v|
          if v != 'na'
               suma = suma + v.to_i
          else
               reactivos = reactivos-1
          end
      end

      calificacion = (suma/reactivos)*10 
      @calificacion = Calificacion.new
      @calificacion.itemsustantiva_id = item_sustantiva
      @calificacion.calificacion = calificacion
      @calificacion.quiz = data
      @calificacion.tipo = tipo
      @calificacion.estado = 'C'
      @calificacion.save
  end

end
