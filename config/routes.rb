Rails.application.routes.draw do
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :events, only: [:create, :destroy, :index, :show, :update] do
    resources :tasks, only: [:create, :destroy, :index, :show, :update] do
    end
  end
end

# 3 things happening:
# register
# login
# logout

# 2 resources:
# new
# edit
