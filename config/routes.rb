Naturesoft::Projects::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/projects" do
    resources :projects do
      collection do
        put ':id/enable' => 'projects#enable', :as => 'enable'
        put ':id/disable' => 'projects#disable', :as => 'disable'
      end
    end
    resources :categories do
      collection do
        put ':id/enable' => 'categories#enable', :as => 'enable'
        put ':id/disable' => 'categories#disable', :as => 'disable'
      end
    end
    resources :images do
      collection do
        put ':id/enable' => 'images#enable', :as => 'enable'
        put ':id/disable' => 'images#disable', :as => 'disable'
      end
    end
    
    # Setting page
    get 'settings' => 'options#index', :as => :options
  end
end