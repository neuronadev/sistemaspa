module Utils

    class ProdAcademico

          def self.tecnicos comite
              tecnicos = Comvalidacion
                .where(comite_id:comite.id)
                .includes(academico: [:persona]).where('personas.tipopersona_id':4).order('personas.nombre')
             return tecnicos   
          end

          def self.investigadores comite
              invest = Comvalidacion
                .where(comite_id:comite.id)
                .includes(academico: [:persona]).where('personas.tipopersona_id':[2,3]).order('personas.nombre')
              return invest
          end

          def self.adicionales academico
              adicionales_acad = Actividad
                 .where(estado:['U','C','G'], periodo:2024)
                 .includes(:autores).where('autores.persona_id': academico.persona.id)
                 .order(:titulo)
             return adicionales_acad
          end

          def self.productos academico
              prod_acad = Actividad
                    .where(estado:['U','C','G'], periodo:2024)
                    .includes(:autores).where('autores.persona_id': academico.persona.id)
                    .order(:titulo)
             return prod_acad
          end

    end

end    