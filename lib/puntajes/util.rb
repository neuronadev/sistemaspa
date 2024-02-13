require_relative "./meta_puntos.rb"
module Puntajes
  class Util
      include Puntajes::Meta
      def tablaPorc(autores)
           n = autores.where.not(persona_id:[211,212]).order(:id).count
           princ = autoresPrinc(autores) 
           porc = reglas( n, princ[:p] + princ[:c] )
          return porc 
      end
      def autoresPrinc(autores)
           primer_a = 0
           corres_a = 0
           i = 0
           autores.order(:id).each do |aut|
                    if i == 0 && (aut.persona_id != 211 && aut.persona_id != 212)
                            primer_a += 1
                    end
                    if i > 0  && (aut.persona_id != 211 && aut.persona_id != 212) && (aut.corresponsal == '1' || aut.corresponsal == true || aut.corresponsal == 'S' )
                            corres_a += 1
                    end
                i+=1
           end
          return { 'p':primer_a, 'c':corres_a} 
      end
      def autoresPosPdf(autores, persona_lista)
              i = 1
              pos = 0
              autores.order(:id).each do |aut|
                     if  aut.persona_id == persona_lista
                          pos = i
                     end
                 i+=1
              end
          return pos 
      end
      def autoresCorr(aut)
           c = 'N'
           if  aut.corresponsal == '1' || aut.corresponsal == true || aut.corresponsal == 'S' 
                 c = 'S'
           end
        return c   
      end
      
      def puntosProd(actividad)
          p = 0.0
          if actividad.producto.id == 1  #jcr
                q = actividad.articulo.revista.cuartiles.where(periodo:2023).first
                if !q.nil?
                    p = puntosProdJCR(q.cuartil)
                end 
          end
          if actividad.producto.id == 2  #conacyt
                p = 5.0
          end
          if actividad.producto.id == 5  #otras
                p = 1.0
          end
          if actividad.producto.id == 7  #capitulo
                p = 15.0
          end

          #FALTAN LOS LIBROS AQUI.-----------------------------------------

          #if actividad.producto.id == 8  #art div
          #      p = 8.0
          #end

          #if actividad.producto.id == 10  #dir tesis ext
          #      if actividad.tesista.nivelestudio.id == 1
          #             p = 8.0
          #      end
          #      if actividad.tesista.nivelestudio.id == 2
          #             p = 15.0
          #      end
          #      if actividad.tesista.nivelestudio.id == 3
          #             p = 25.0
          #      end
          #end
          #if actividad.producto.id == 22  #otras act de div
          #      p = 1.0
          #end
          #if actividad.producto.id == 37  #floras
          #        puts "AAAA"
          #       if actividad.fasciculo.tipofasciculo.id == 1
          #            p = 10.0
          #       end
          #       if actividad.fasciculo.tipofasciculo.id == 2
          #            p = 15.0  
          #       end
          #       if actividad.fasciculo.tipofasciculo.id == 3
          #            p = 20.0   
          #       end
          #       if actividad.fasciculo.tipofasciculo.id == 4
          #            p = 25.0  
          #       end
          #       if actividad.fasciculo.tipofasciculo.id == 5
          #            p = 30.0  
          #       end
                 
          #end
          #if actividad.producto.id == 39  #art div periodico
          #      p = 1.0
          #end
          #if actividad.producto.id == 86  #art div sin arb
          #      p = 1.0
          #end

        return p

      end

   end

end