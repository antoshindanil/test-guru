# frozen_string_literal: true

Rails.application.routes.draw do
  root "tests#index"

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  get "feedback/message"
  post "feedback/send_message"

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :badges, only: :index do
    get :my, on: :collection
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :badges
    resources :gists, only: :index
  end
end
