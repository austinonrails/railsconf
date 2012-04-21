Railsconf::Application.routes.draw do

  root :to => "pages#index"
  get "/bohconf", :to => "bohconf_sessions#index"
  get "/bohconf_soon", :to => "bohconf_sessions#soon", :as => 'bohconf_sessions_soon'
  get "/boh/:id", :to => "bohconf_sessions#show", :as => "boh_short"
  get "/boh/:id/tweet", :to => "bohconf_sessions#tweet"
  get "/ignite", :to => "pages#ignite"
  get "/talk", :to => "pages#talk"
  get "/stay", :to => "pages#stay"
  get "/5k", :to => "pages#fivek", :as => 'fivek'
  get "/happy", :to => "pages#happy"
  get "/kids", :to => "pages#kids"
  get "/sponsor", :to => "pages#sponsor"
  get "/sponsors", :to => "pages#sponsor"
  get "/usergroups", :to => "pages#usergroups"

  resources :favorites do
    collection do
      get 'thanks'
    end
  end

  resources :guests do
    collection do
      get 'thanks'
    end
  end

  resources :hosts do
    collection do
      get 'thanks'
    end
  end

  resources :speakers do
    collection do
      get 'thanks'
    end
  end

  resources :bohconf_sessions do
    collection do
      get 'thanks'
    end
    member do
      get 'tweet'
      post 'send_tweet'
    end
  end

  resources :twitter_accounts, :only => [:new, :edit, :update] do
    collection do
      get 'callback'
    end
  end
end
