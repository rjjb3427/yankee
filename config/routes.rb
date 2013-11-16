Yankee::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'  
  
  devise_for :users,:controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do  
    get 'login', :to => 'users::Sessions#new'
  end

  resources :goodbyes  
  resources :faq_categories  
  resources :faqs
  resources :intro, :improve, :sitemap 
  resources :galleries
  resources :usarmy
  resources :questions
  
  root :to => 'home#index'
end
