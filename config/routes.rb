Rails.application.routes.draw do
  
  
  #get 'indicadores/index'
  get 'perfil/index'
  devise_for :usuarios
  get 'inicio/sesion', to: 'inicio#sesion', as: 'usuario'
  get 'administrar/index', to:'administrar#index', as: 'administrador'
  get 'investigador/index', to:'investigador#index', as: 'investigador'
  get 'tecnico/index', to:'tecnico#index', as: 'tecnico'
  get 'auditoria/index', to:'auditoria#index', as: 'auditoria'

  resources :personas
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
  get 'investigador/listado', to: 'investigador#listado', as: 'investlista' 
  get 'investigador/produccion/:id', to: 'investigador#produccion', as: 'listproduccion'   ##VISTA TARJETAS
  get 'investigador/investdetalle', to: 'investigador#investdetalle', as: 'investdetalle' 
  get 'investigador/activar/:id/:tipo', to: 'investigador#activar', as: 'activar'
  get 'investigador/valcompleta/:idpersona/', to: 'investigador#valcompleta', as: 'valcompleta'
  get 'investigador/vistalista/:id/', to: 'investigador#vistalista', as: 'vistalista'
  get 'investigador/verproducto/:idprod/:idacad', to: 'investigador#verproducto', as: 'verproducto'   ##VISTA TARJETA

  
  #aceptar
  get 'validaciones/aceptaval/:id', to: 'validaciones#aceptaval', as: 'aceptaval' 
  get 'productos/cambio/:id/:idactiv', to: 'productos#cambio', as: 'prodcambio'

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

  #Academicos Validacion de tecnicos
  get 'academicos/actividadt/:idacadem/:tipo', to:'academicos#actividadt', as:'actividadt'
  get 'academicos/activar', to:'academicos#activar', as:'activartec'
  get 'academicos/anularactiv/:id', to:'academicos#anularactiv', as:'anularactiv'
  get 'academicos/cerrarmensaje/:id', to:'academicos#cerrarmensaje', as:'cerrarmensaje'
  get 'academicos/detalleactividad/:idacademico/:id', to:'academicos#detalleactividad', as:'detalleactividad'
  get 'consultas/historicop/:idacad/:tipoc', to:'consultas#historicop', as:'historicop'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
