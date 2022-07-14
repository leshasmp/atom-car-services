# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: 'web' do
    root 'orders#index'

    resources :orders do
      resources :services, shallow: true do
        scope module: 'services' do
        
        end
      end
    end
  end
end
