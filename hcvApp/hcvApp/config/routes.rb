Rails.application.routes.draw do
  get 'cliente/agendacitas'

  get 'administrador' => "administrador#index"
  get 'administrador/cliente' => "administrador#clientes"
  get 'administrador/cliente/:id' => "administrador#detalle_cliente"
  get 'administrador/medico' => "administrador#admin_medico"

  get 'administrador/medico/:id' => "administrador#medico"
  get "administrador/perfiles" => "administrador#perfiles"

  get 'autorizador/consulta' => "autorizador#consulta"
  get 'autorizador/informacioninicial' => "autorizador#informacion_inicial"
  get 'autorizador/historialocupacional' => "autorizador#historial_ocupacional"
  get 'autorizador/agenda' => "autorizador#agenda"
  
  get 'medico/antecedentes' => "medico#antecedentes"
  get 'medico/antecedentes1' => "medico#antecedentes1"
  get 'medico/antecedentes2' => "medico#antecedentes2"
  get 'medico/antecedentes3' => "medico#antecedentes3"
  get 'medico/antecedentes4' => "medico#antecedentes4"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index', as: "index"
  get "quienes_somos" => "home#quienes_somos" , as: 'quienes_somos' 
  get "pyp" => "home#pyp" , as: 'pyp' 
  get "ocupacional" => "home#ocupacional" , as: 'ocupacional' 
  get "laboral" => "home#laboral" , as: 'laboral' 
  get "red" => "home#red" , as: 'red' 




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
