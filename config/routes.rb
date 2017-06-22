Rails.application.routes.draw do


root 'welcome#index'

get 'welcome/index'

#A resource route maps a number of related requests to actions in a single controller.
resources :items

resources :welcome

  
end