Blog::Application.routes.draw do
  resources :user_sessions, :only => [:new, :create, :destroy]
  resources :posts do
    get :create_post, :on => :collection
  end

  resources :users, :only => [] do
    collection do
      get :all_user
      get :new_user
      post :create_new_user
    end
    member do
      get :show_user
      delete :delete_user
      get :edit_user
      put :user_update
    end
  end
  match "/login", :to => "user_sessions#new"
  match "/logout", :to => "user_sessions#destroy"
  match "/signup", :to => "users#new_user"
  root :to => 'posts#index'
  class XHRConstraint
    def matches?(request)
      !request.xhr? && !(request.url =~ /\.json$/ )
    end
  end

  match '(*url)' => 'users#new_user', :constraints => XHRConstraint.new
end
