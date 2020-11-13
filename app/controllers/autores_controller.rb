class AutoresController < ApplicationController
  def index
  end

  def new
    @autor = Autor.new
  end

  def fieldsform
     @personas = Persona.all

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
