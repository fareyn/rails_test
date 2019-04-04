Rails.application.routes.draw do
  root 'sessions#new'
  #root 'sessions#new'

  get 'sessions/new'
#get new login
  post   'sessions/create'
#login
  delete 'sessions/destroy'
#logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'empresa/list'

get 'empresa/new'

get 'empresa/show'

get 'empresa/edit'

get 'empresa/delete'

post 'empresa/create'

patch 'empresa/update'

get 'sucursal/new'

get 'sucursal/edit'

get 'sucursal/show'

post 'sucursal/create'

patch 'sucursal/update'
#empleados
get 'empleado/new'

get 'empleado/edit'

get 'empleado/show'

post 'empleado/create'

patch 'empleado/update'
#resources :empresas
end
