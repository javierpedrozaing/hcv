Rails.application.routes.draw do
  
  resources :especialidads
  resources :consultorios
  #resources :personas
  
  resources :tipo_examenes
  resources :perfils
  resources :examenes
  resources :rols

  get 'cliente/agendacitas', as: "agenda_citas"
  get 'cliente/citas_generadas' => 'cliente/citas_generadas', as: "citas_generadas"

  get 'administrador' => "administrador#index", as: 'admin_index'
  get 'administrador/clientes' => "administrador#clientes", as: 'proveedores'
  get 'administrador/cliente/:id' => "administrador#reporte_cliente", as: 'reporte_cliente' #reporte del cliente
  get 'administrador/medico' => "administrador#admin_medico", as: "reportes" # reportes por medico
  post 'administrador/registrar' => "administrador#registrar_medico" 
  get 'administrador/medico/:id' => "administrador#medico" # reporte del medico
  get "administrador/perfiles" => "perfils#index", as: 'admin_perfiles'

  get "administrador/upload_photo_cliente" => "administrador#upload_photo_cliente", as: 'upload_photo_cliente'
  

  post "administrador/crear_cliente" => "administrador#crear_cliente", as: 'crear_cliente'  #post para crear cliente
  get 'administrador/show_cliente/:id' => "administrador#show_cliente", as: "show_cliente"
  get 'administrador/edit_cliente/:id' => "administrador#edit_cliente", as: "edit_cliente"
  get 'administrador/delete_cliente/:id' => "administrador#delete_cliente", as: "delete_cliente"
  delete 'administrador/delete_cliente/:id' => "administrador#delete_cliente"

  patch 'administrador/update_cliente/:id' => "administrador#update_cliente", as: "update_cliente"
  put 'administrador/update_cliente/:id' => "administrador#update_cliente"


  get 'autorizador/consulta' => "autorizador#consulta", as: 'habilitar_consulta'
  get 'autorizador/informacioninicial' => "autorizador#informacion_inicial"
  get 'autorizador/historialocupacional' => "autorizador#historial_ocupacional"
  get 'autorizador/agenda' => "autorizador#agenda", as: 'agenda_consultorios'

  get 'autorizador/consulta' => "autorizador#consulta", as: 'consulta_dia_medico' # cosulta dle día para el perfil medico
  

  get 'medico/:id' => "medico#reporte", as: 'reporte_medico' # reporte del medico
  get 'medico/antecedentes' => "medico#antecedentes"
  get 'medico/antecedentes1' => "medico#antecedentes1"
  get 'medico/antecedentes2' => "medico#antecedentes2"
  get 'medico/antecedentes3' => "medico#antecedentes3"
  get 'medico/antecedentes4' => "medico#antecedentes4"

  post 'perfils/get_examenes' => 'perfils#get_examenes', as: 'get_examenes'

  devise_for :personas

  devise_scope :persona do

    authenticated :persona do
            
      root 'administrador#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index', as: "home"
  get "quienes_somos" => "home#quienes_somos" , as: 'quienes_somos' 
  get "pyp" => "home#pyp" , as: 'pyp' 
  get "ocupacional" => "home#ocupacional" , as: 'ocupacional' 
  get "laboral" => "home#laboral" , as: 'laboral' 
  get "red" => "home#red" , as: 'red'
  get "salud_trabajo" => "home#salud_trabajo" , as: 'salud_trabajo'



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
