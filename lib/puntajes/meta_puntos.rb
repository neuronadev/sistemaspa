module Puntajes
  module Meta
    def reglas(n, tp)
           if n == 1
                return {p:100, r:100 }
           end
           if n == 2 && tp == 0
                return {p:0, r:50 }
           end
           if n == 2 && tp == 1
                return {p:60, r:40 }
           end
           if n == 2 && tp == 2
                return {p:50, r:0 }
           end
           if n == 3 && tp == 0
               return {p:0, r:100/3.0 }
           end
           if n == 3 && tp == 1
                 return {p:35, r:65/2.0 }
           end
           if n == 3 && tp == 2
                 return {p:35, r:30 }
           end
           if n == 3 && tp == 3
                 return {p:100/35, r:0 }
           end
           if n == 4 && tp == 0
                 return {p:0, r:25 }
           end
           if n == 4 && tp == 1
                 return {p:30, r:70/3.0 }
           end
           if n == 4 && tp == 2
                 return {p:30, r:40/2.0 }
           end
           if n == 4 && tp == 3
                 return {p:30, r:10 }
           end
           if n == 4 && tp == 4
                 return {p:100/4, r:0 }
           end
           if n >= 5 && tp == 0
                 porc_n = 25.0
                 tr = n-tp
                 return {p:0, r:(100-(porc_n*tp))/tr } 
           end
           if n >= 5 && tp > 0
                 porc_n = 25.0
                 tr = n-tp
                 return {p:25, r:(100-(porc_n*tp))/tr } 
           end
     end

     def puntosProdJCR(q)
            p = 0
            if q == 'Q1'
                 p = 30
            end
            if q == 'Q2'
                 p = 20
            end
            if q == 'Q3'
                 p = 10
            end
            if q == 'Q4'
                p = 5
            end
         return p      
      end   

  end   
end