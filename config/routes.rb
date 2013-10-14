Yankee::Application.routes.draw do
  devise_for :users,:controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do  
    get 'login', :to => 'users::Sessions#new'
  end

  resources :goodbyes  
  resources :faq_categories  
  resources :faqs
  resources :improve  
  
  root :to => 'home#index'
  
  match 'usamry'=>'userarmy#index'
  match ':controller(/:action(/:id))(.:format)'
end
