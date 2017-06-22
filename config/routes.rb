Rails.application.routes.draw do


root 'welcome#index'

get 'welcome/index'

get 'items/upvote'

#A resource route maps a number of related requests to actions in a single controller.
resources :items do
    member do
        post 'upvote'
    end
end

resources :welcome

  
end