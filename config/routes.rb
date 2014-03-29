Parte::Application.routes.draw do
  
  namespace :production do
    resources :entities
    resources :projects
    match 'apgraficos/start' => 'apgraficos#start', via: [:get, :post]
    resources :tareoscolumnas
    resources :tareosfilas
    resources :tareosgruposdetrabajos
    get 'inicios/index' => 'inicios#index'
    get 'inicios' => 'inicios#index'
    resources :vequipodays
    match 'importalistas/import' => 'importalistas#import', via: [:get, :post]
    resources :importalistas
    resources :vpartidas
    resources :dias
    resources :tipodedias
    resources :semanas
    resources :mes
    resources :years
    resources :maquinariaequipodetalles
    resources :maquinariaequiporesumenes
    resources :maquinariaequipos
    match 'reportofmachineries/ver_resumen_equipo' => 'reportofmachineries#ver_resumen_equipo', via: [:get, :post]
    match 'reportofmachineries/ver_resumen_subcontratista' => 'reportofmachineries#ver_resumen_subcontratista', via: [:get, :post]
    match 'reportofmachineries/aprobar', via: [:get, :post]
    match 'reportofmachineries/resumen_equipodesubcontrato', via: [:get, :post]
    match 'reportofmachineries/resumen_subcontratista', via: [:get, :post]
    match 'reportofmachineries/valorizar_consulta', via: [:get, :post]
    match 'reportofmachineries/primero', via: [:get, :post]
    match 'reportofmachineries/valorizar_consulta_guardar' => 'reportofmachineries#valorizar_consulta_guardar', via: [:get, :post]  
    resources :reportofmachineries
    match 'reportofequipments/values_combo2/:id' => 'reportofequipments#values_combo2#:id', via: [:get, :post]
    match 'reportofequipments/primero' => 'reportofequipments#primero', via: [:get, :post] 
    resources :reportofequipments
    resources :fueltypes
    resources :vequipos
    resources :vmanodeobras
    resources :equipmentregisters
    resources :partofequipments
    get 'partofequipments/values_equiposdesubcontrato/:id' => 'partofequipments#values_equiposdesubcontrato#:id'
    get 'partofequipments/values_equiposdesubcontrato' => 'partofequipments#values_equiposdesubcontrato'  
    get 'partofequipments/values_unidades/:id' => 'partofequipments#values_unidades#:id'
    get 'partofequipments/values_unidades' => 'partofequipments#values_unidades'
    resources :inputofequipments
    resources :units
    resources :equipmentincludeds
    post '/equipmentsofsubcontracts/create' => 'equipmentsofsubcontracts#create'
    post '/equipmentsofsubcontracts/update' => 'equipmentsofsubcontracts#update'
    delete '/equipodesubcontratos/destroy' => 'equipodesubcontratos#destroy'
    match '/equipmentsofsubcontracts/new/:id' => 'equipmentsofsubcontracts#new#:id', via: [:get, :post]
    resources :equipmentsofsubcontracts
    match 'subcontractofequipments/ver_equipos/:id' => 'subcontractofequipments#ver_equipos#:id', via: [:get, :post]
    match 'subcontractofequipments/equipoadd/:id' => 'subcontractofequipments#equipoadd#:id', via: [:get, :post]
    match 'subcontractofequipments/equipoedit/:id' => 'subcontractofequipments#equipoedit#:id', via: [:get, :post]
    get 'subcontractofequipments/equipover/:id' => 'subcontractofequipments#equipover#:id'
    resources :subcontractofequipments
    resources :groupsofworks
    resources :teacherofworks
    resources :chiefoffronts
    resources :fronts
    resources :relaciones
    resources :subcategorias
    resources :categorias
    #resources :entities
    resources :workers
    resources :catalogofworks
    resources :catalogcategoryworks
    get 'partdayliofpeople/values_partidasdecontrol/:id' => 'partdayliofpeople#values_partidasdecontrol#:id'
    resources :partdayliofpeople
    resources :subcontracts
    resources :catalogodeinsumos
    resources :inputs
    resources :suppliers
    resources :valesdeconsumos
    get 'itemsofcontrols/mostrar/:id' => 'itemsofcontrols#mostrar#:id'
    get 'itemsofcontrols/valuesubfase/:id' => 'itemsofcontrols#valuesubfase#:id'
    get 'partworks/values_opcion/:id' => 'partworks#values_opcion#:id'
    get 'partdayliofpeople/values_opcion/:id' => 'partdayliofpeople#values_opcion#:id'
    get 'partofequipments/values_opcion/:id' => 'partofequipments#values_opcion#:id'
    get 'partworks/values_partidasdecontrol/:id' => 'partworks#values_partidasdecontrol#:id'
    get 'partworks/values_tipodevale/:id' => 'partworks#values_tipodevale#:id'
    get 'partworks/values_tipodevale' => 'partworks#values_tipodevale'
    get 'partworks/values_partidaunidad/:id' => 'partworks#values_partidaunidad#:id'
    resources :itemsofcontrols
    resources :subsectors
    resources :sectors
    get "subfases/migrar"
    resources :subphases
    resources :phases
    match "listcategories/importar_partidas" => 'listcategories#importar_partidas', via: [:get, :post]
    resources :listcategories
    get "lists/migrar"
    resources :lists do
      collection { 
        match :import, via: [:get, :post] 
      }
    end    
    resources :items
    resources :partworks
    
    match 'valuations/equipo_days' => 'valuations#equipo_days', via: [:get, :post]
    match 'valuations/ver_equipodays' => 'valuations#ver_equipodays', via: [:get, :post]
    match 'valuations/ver_valorizacion_manodeobra' => 'valuations#ver_valorizacion_manodeobra', via: [:get, :post]
    match 'valuations/ver_valorizacion_equipos' => 'valuations#ver_valorizacion_equipos', via: [:get, :post]
    match 'valuations/valorizacion_manodeobras' => 'valuations#valorizacion_manodeobras', via: [:get, :post]
    match 'valuations/valorizacion_equipos' => 'valuations#valorizacion_equipos', via: [:get, :post]
    match 'valuations/ver_valorizacion_partidas' => 'valuations#ver_valorizacion_partidas', via: [:get, :post]
    match 'valuations/valorizacion_partidas' => 'valuations#valorizacion_partidas', via: [:get, :post]
    match 'valuations/valorizacion_uno' => 'valuations#valorizacion_uno', via: [:get, :post]
    match 'valuations/produccion_fecha' => 'valuations#produccion_fecha', via: [:get, :post]
    post 'valuations/produccion_procesar' => 'valuations#produccion_procesar'
    match 'valuations/valorizacion_guardar' => 'valuations#valorizacion_guardar', via: [:get, :post]
    post 'valuations/valorizacion_aprobar' => 'valuations#valorizacion_aprobar'
    resources :valuations
    get 'tareos/desaprobar' => 'tareos#desaprobar'
    get 'tareos/aprobar' => 'tareos#aprobar'
    match 'tareos/tareo_semanal' => 'tareos#tareo_semanal', via: [:get, :post]
    match 'tareos/tareo_subcontratista' => 'tareos#tareo_subcontratista', via: [:get, :post]
    match 'tareos/array_subcontratos' => 'tareos#array_subcontratos', via: [:get, :post]
    match 'tareos/tareo_guardar' => 'tareos#tareo_guardar', via: [:get, :post]
    resources :tareos    
  end
  root :to => "production/inicios#index"
end
