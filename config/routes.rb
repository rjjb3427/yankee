Yankee::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'  
  
  devise_for :users,:controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do  
    get 'login', :to => 'users::Sessions#new'
  end

  resources :goodbyes  
  resources :faq_categories  
  resources :faqs
  resources :improve
  resources :usarmy  
  
  namespace :admins do
    resources :intro, :menus, :notices, :gallery_categories, :galleries, :faq_categories,:faqs, :guest_books
    resources :questions do
      resources :question_answers
    end
    
    resources :recipes do
      resources :recipe_comments
    end      
  end  
  
  root :to => 'home#index'
end
