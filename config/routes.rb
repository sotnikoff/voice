Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
  get 'convert', as: 'convert_voice', controller: 'voice',
                        action: 'convert'
  get 'show', as: 'show_voice', controller: 'voice', action: 'show'
end
