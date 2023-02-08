Rails.application.routes.draw do

  get 'proyectos/index'
  get 'proyectos/new'
  get 'proyectos/edit'
  get 'proyectos/update'
  get 'proyectos/create'
  get 'revisiones/index'
  namespace :evaluaciones do
    resources :calificaciones
  end

  resources :busquedas do
    collection do
       post 'producto'
    end
  end

  namespace :evaluaciones do
    resources :itemsustantivas do
         collection do
            get 'cuestionario'
            post 'savecuestionario'
         end
    end
  end
  namespace :evaluaciones do
    resources :evaltecnicos
  end

  namespace :actividades do
    resources :editoriales
  end
  namespace :actividades do
    resources :libros
  end
  namespace :actividades do
    resources :capitulos
  end

  namespace :validaciones do
       resources :productos do
          collection do
             post 'vobousuario'
          end
       end

       resources :academicos do
            collection do
               post 'adicionales'
               post 'producto'
               post 'validar'
               post 'validarsa'
               post 'aplicartipo'
               post 'aplicartiposa'
               post 'mensaje'

            end
       end
  end

  


  get 'valactividades/validaciones/infoproducto/:trval/:tritem', to:'valactividades/validaciones#infoproducto', as: 'savalproducto'
  get 'valactividades/validaciones/index', to: 'valactividades/validaciones#index', as: 'validaindex'
  get 'valactividades/validaciones/aceptarproducto/:target/:item', to:'valactividades/validaciones#aceptarproducto', as: 'saaceptarproducto'
  get 'valactividades/validaciones/corregirproducto/:target/:item', to:'valactividades/validaciones#corregirproducto', as: 'sacorregirproducto'
  get 'valactividades/validaciones/rechazarproducto/:target/:item', to:'valactividades/validaciones#rechazarproducto', as: 'sarechazarproducto'
  post 'valactividades/validaciones/comentario', to:'valactividades/validaciones#comentario', as: 'sacomentarioproducto'
  get 'valactividades/validaciones/evaluacion/', to:'valactividades/validaciones#evaluacion', as: 'tevaluacion'
  get 'valactividades/validaciones/sustantivas/:personaid', to:'valactividades/validaciones#sustantivas', as: 'tsustantivas'
  get 'valactividades/validaciones/listaproductos/:idacad', to:'valactividades/validaciones#listaproductos', as: 'listaproductos'
  get 'valactividades/validaciones/listahistorico/:idacad', to:'valactividades/validaciones#listahistorico', as: 'listahistorico'
  get 'valactividades/validaciones/vbvalidacion/:target/:item', to:'valactividades/validaciones#vbvalidacion', as: 'vbvalidacion'
  get 'valactividades/validaciones/academicook/:persona', to:'valactividades/validaciones#academicook', as: 'academicook'
  get 'valactividades/validaciones/quitarval/:trval/:tritem', to:'valactividades/validaciones#quitarval', as: 'quitarval'
  get 'valactividades/validaciones/quitarvaltec/:trval/:tritem', to:'valactividades/validaciones#quitarvaltec', as: 'quitarvaltec'
  get 'valactividades/validaciones/vbproduccion/:idpersona', to:'valactividades/validaciones#vbproduccion', as: 'vbproduccion'

  get 'actividades/redacademicas/index', to: 'actividades/redacademicas#index', as: 'redesindex'
  get 'actividades/redacademicas/items/:id/:sec', to: 'actividades/redacademicas#items', as: 'items'
  get 'actividades/redacademicas/itemaceptar/:id/:sec', to: 'actividades/redacademicas#itemaceptar', as: 'itemaceptar'
  get 'actividades/redacademicas/itemcorregir/:id/:sec', to: 'actividades/redacademicas#itemcorregir', as: 'itemcorregir'
  get 'actividades/redacademicas/itemrechazar/:id/:sec', to: 'actividades/redacademicas#itemrechazar', as: 'itemrechazar'
  post 'actividades/redacademicas/comentario', to: 'actividades/redacademicas#comentario', as: 'itemcomentario'

  namespace :actividades do
    get 'redacademica/index'
  end
  namespace :cloud do
    resources :cloudfile
    get 'cloudfile/index'
    get 'cloudfile/show'
    get 'cloudfile/new'
    post 'cloudfile/create'
    post 'cloudfile/downpdf'
  end

  namespace :actividades do
    resources :actividades do
                 member do
                    get 'updoc'
                    patch 'savedoc'
                 end
    end             
  end
  namespace :actividades do
      resources :catalogos do
         collection do
           post 'listcat'
         end
      end
  end
  namespace :actividades do
        resources :productos
  end

  get 'extras/index'
  get 'extras/show'
  get 'extras/new'
  get 'cargas/index'
  get 'cargas/show'
  get 'cargas/edit'
  get 'cargas/create'
  #get 'indicadores/index'
  get 'perfil/index'
  devise_for :usuarios
  get 'inicio/sesion', to: 'inicio#sesion', as: 'usuario'
  get 'administrar/index', to:'administrar#index', as: 'administrador'
  get 'investigador/index', to:'investigador#index', as: 'investigador'
  get 'tecnico/index', to:'tecnico#index', as: 'tecnico'
  get 'auditoria/index', to:'auditoria#index', as: 'auditoria'

  resources :personas do
    collection do
        post 'search'
    end
  end
  resources :redes
  resources :categorias
  resources :niveles
  resources :prodcategorias
  resources :prodgrupos
  resources :productos
  resources :editoriales
  resources :revistas
  resources :libros
  resources :actividades
  resources :autores
  resources :externos
  resources :perfil
  resources :extras
  resources :divulgaciones do
        collection do
           post 'buscar'
        end
  end
  resources :posgrados
  #resources :academicos
  #resources :indicadores
    
  get "actividad/newact/:producto_id/:idanterior", to: "actividades#newact", as: 'newact'
  post "autores/fieldsform", to: "autores#fieldsform", as: 'formautores'
  delete "actividades/deldoc/:id", to: "actividades#deldoc", as: 'deldoc'
  get "actividad/hitorico/:anio", to: "actividades#historico", as: 'historico'
  get "actividad/validar/:id/:tipo", to: "actividades#validar", as: 'validar'
  get "actividad/filtro/:tipo", to: "actividades#filtro", as: 'filtro'
  get "actividad/evaltecnico", to: "actividades#evaltecnico", as: 'evaltecnico'
  get "actividad/cuestionario/:idacad/:tipo/:idact", to: "actividades#cuestionario", as: 'cuestionario'
  post "actividad/svcuestionario", to: "actividades#svcuestionario", as: 'svcuestionario'
  get "actividad/presupuesto/", to: "actividades#presupuesto", as: 'presupuesto'
  
  ##VALIDACIONES
  get 'validaciones/index', to: "validaciones#index", as: 'validared' 
  get 'validaciones/validar/:id/:tipo', to: "validaciones#validar", as: 'coordinaval' 
  get 'validaciones/corregir/:id/:tipo', to: "validaciones#corregir", as: 'coordinacorregir' 
  post 'validaciones/save', to: "validaciones#save", as: 'coordinasave' 
  get 'validaciones/mostrar/:id', to: "validaciones#mostrar", as: 'coordinamostrar' 
  #####

  ## Act. sustantivas
  get 'tecnico/sustantiva', to: "tecnico#sustantiva", as: 'sustantiva' 
  post 'tecnico/create', to: "tecnico#create", as: 'sustcreate' 
  get 'tecnico/detalle', to: "tecnico#detalle", as: 'sustdetalle' 
  get 'tecnico/mostraractiv/:idacad', to: "tecnico#mostraractiv", as: 'mostraractiv' 
  get 'tecnico/edit/:id', to: "tecnico#edit", as: 'sustedit' 
  get 'tecnico/validar/:id/:tipo', to: "tecnico#validar", as: 'sustvalidar' 
  patch 'tecnico/updateitem', to: "tecnico#updateitem", as: 'sustupdateitem' 
  get 'tecnicos/listaevaltecnico/', to:  "tecnico#listaevaltecnico", as: 'listaevaltecnico'
  get 'tecnicos/mostraradicional/:idacad', to:  "tecnico#mostraradicional", as: 'mostraradicional'
  get 'tecnico/tecnicoadetalle', to: "tecnico#tecnicoadetalle", as: 'tecnicoadetalle' 
  get 'tecnico/listatodo', to: "tecnico#listatodo", as: 'listatodot' 
  get 'tecnico/anularaceptado', to: "tecnico#anularaceptado", as: 'anularaceptadotec' 
  get 'tecnico/mostrarprod', to: "tecnico#mostrarprod", as: 'mostrarprod' 
  get 'tecnico/mostrarcargas', to: "tecnico#mostrarcargas", as: 'mostrarcargas' 

  #######
  #Sec Acad Validaciones
  get 'validaciones/consultasa/:redid/:idactiv', to: "validaciones#consultasa", as: 'consultasa'  
  post 'personas/academico', to: "personas#academico", as: 'listapred'
  post 'validaciones/dataprod', to: "validaciones#dataprod", as: 'dataprod'  
  get 'validaciones/datadetalle/:id', to: "validaciones#datadetalle", as: 'datadetalle'  
  get 'validaciones/datamsg/:id', to: "validaciones#datamsg", as: 'datamsg'  
  get 'validaciones/aplicavalsa/:id', to: "validaciones#aplicavalsa", as: 'validasa'  
  get 'validaciones/aplicavalsamsg/', to: "validaciones#aplicavalsamsg", as: 'validasamsg'
  get 'validaciones/rechazar', to: "validaciones#rechazar", as: 'rechazasa'  
  #post 'validaciones/rechazar', to: "validaciones#rechazar", as: 'rechazasa'  
  post 'validaciones/validacriterio', to: "validaciones#validacriterio", as: 'validacriterio'
  post 'validaciones/cambiarprod', to: "validaciones#cambiarprod", as: 'cambiarprod'  
  get 'validaciones/editdata/:id/:red', to: "validaciones#editdata", as: 'valideditdata'  
  patch 'validaciones/updatedata/:id', to: "validaciones#updatedata", as: 'validupdatedata'  
  post  'validaciones/validamarcar', to:'validaciones#validamarcar', as: 'validamarcar'
  get 'validaciones/anularsa/:id', to: "validaciones#anularsa", as: 'anularsa'  
  get 'validaciones/anularcoor/:id', to: "validaciones#anularcoor", as: 'anularcoor'
  # Historico
  get 'historico/datahistory/:periodo', to: 'historico#datahistory', as: 'datahistory'
  get 'historico/consultar', to: 'historico#consultar', as: 'histoconsultar'  
  get 'historico/comprobante/:key', to: 'historico#comprobante', as: 'comprobante'  
  get 'historico/datahistorico', to: 'historico#datahistorico', as: 'datahistorico'
  get 'historico/histgeneral', to: 'historico#histgeneral', as: 'histgeneral'
  post 'historico/datah', to: "historico#datah", as: 'datah'
  get 'historico/hacademico/:periodo/:idacademico', to: 'historico#hacademico', as: 'hacademico'

  # Validacion tecnicos
  get 'reviciones/listado', to: 'reviciones#listado', as: 'revisarlistado'
  post 'reviciones/registros', to: 'reviciones#registros', as: 'revisarregistros'
  get 'reviciones/datadetalle/:id', to: "validaciones#datadetalle", as: 'valdatadetalle'  


  # Investigadores
  get 'investigador/listado/:idred', to: 'investigador#listado', as: 'investlista' 
  get 'investigador/listarredes', to: 'investigador#listarredes', as: 'listarredes' 
  get 'investigador/produccion/:id', to: 'investigador#produccion', as: 'listproduccion'   ##VISTA TARJETAS
  get 'investigador/investdetalle', to: 'investigador#investdetalle', as: 'investdetalle' 
  get 'investigador/activar/:id/:tipo', to: 'investigador#activar', as: 'activar'
  get 'investigador/valcompleta/:idpersona/', to: 'investigador#valcompleta', as: 'valcompleta'
  get 'investigador/vistalista/:id', to: 'investigador#vistalista', as: 'vistalista'
  get 'investigador/verproducto/:idprod/:idacad', to: 'investigador#verproducto', as: 'verproducto'   ##VISTA TARJETA
  get 'investigador/listatodo/', to: 'investigador#listatodo', as: 'listatodo'
  get 'investigador/listatodofal/', to: 'investigador#listatodofal', as: 'listatodofal'
  get 'investigador/verproductofl/:idprod/:idpersona', to: 'investigador#verproductofl', as: 'verproductofl'   ##VISTA TARJETA
  
  #aceptar
  get 'validaciones/aceptaval/:id', to: 'validaciones#aceptaval', as: 'aceptaval' 
  get 'productos/cambio/:id/:idactiv', to: 'productos#cambio', as: 'prodcambio'
  get 'validaciones/aceptavalsa/', to: 'validaciones#aceptavalsa', as: 'aceptavalsa' 


  #Edicione
  get 'ediciones/index/:red/:persona', to: 'ediciones#index', as: 'editarindex'
  post 'ediciones/productos', to: "ediciones#productos", as: 'ediproductos'   
  get 'ediciones/editdata/:id/:red', to: "ediciones#editdata", as: 'edicionesdata'  
  root 'inicio#sesion'

  #Indicadores
  get 'indicadores/listaword', to: 'indicadores#listaword', as: 'listaword'
  get 'indicadores/index', to: 'indicadores#index', as: 'indicador'


  #Auditoria
  get 'auditoria/evaluacion', to:'auditoria#evaluacion', as:'auditevaluacion'
  get 'auditoria/sustantivas/:id', to:'auditoria#sustantivas', as:'auditsustantivas'
  get 'auditoria/adicionales/', to:'auditoria#adicionales', as:'auditadicionales'
  get 'auditoria/detalle/:id', to:'auditoria#detalle', as:'auditdetalle'
  get 'auditoria/adicionalesinv/', to:'auditoria#adicionalesinv', as:'auditadicionalesinv'
  get 'auditoria/listaadicinv/:id', to:'auditoria#listaadicinv', as:'listaadicinv'
  get 'auditoria/downother/:id/:tipo', to:'auditoria#downother', as:'downother'
  get 'auditoria/cancelados/', to:'auditoria#cancelados', as:'cancelados'

  #Academicos Validacion de tecnicos
  get 'academicos/actividadt/:idacadem/:tipo', to:'academicos#actividadt', as:'actividadt'
  get 'academicos/activar', to:'academicos#activar', as:'activartec'
  get 'academicos/anularactiv/:id', to:'academicos#anularactiv', as:'anularactiv'
  get 'academicos/anularaceptado/:id', to:'academicos#anularaceptado', as:'anularaceptado'
  get 'academicos/cerrarmensaje/:id', to:'academicos#cerrarmensaje', as:'cerrarmensaje'
  get 'academicos/detalleactividad/:idacademico/:id', to:'academicos#detalleactividad', as:'detalleactividad'
  get 'consultas/historicop/:idacad/:tipoc', to:'consultas#historicop', as:'historicop'
  get 'academicos/detalleactfl/:idactiv/:idpersona', to: 'academicos#detalleactfl', as: 'detalleactfl'   ##VISTA TARJETA

  #posgrado
   get 'cargas/comprobante/:id/:comprobante', to: 'cargas#comprobante', as: 'pstcomprobante'  
   get 'cargas/comtesis/:id', to: 'cargas#comtesis', as: 'pstcomtesis'

  #extras
  get 'extras/procesado/:id', to: 'extras#procesado', as: 'procesado'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
