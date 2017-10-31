Ecm::Comments::Engine.routes.draw do
  localized do
    scope :ecm_comments_engine do
      resources :comments, only: [:new, :create]
    end
  end
end