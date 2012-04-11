Railsconf::Application.routes.draw do

  root :to => "pages#index"
  get "/bohconf", :to => "pages#bohconf"
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
      get 'write_tweet'
      post 'send_tweet'
    end
  end

  resources :twitter_accounts, :only => [:new, :edit, :update] do
    collection do
      get 'callback'
    end
  end
end
