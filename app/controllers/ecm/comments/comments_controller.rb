module Ecm
  module Comments
    class CommentsController < Ecm::Comments::Configuration.base_controller.constantize
      include Controller::ResourceConcern
      include Controller::ResourceUrlsConcern
      include Controller::ResourceInflectionsConcern
      include Controller::RestActionsConcern

      helper Twitter::Bootstrap::Components::Rails::V3::ComponentsHelper

      before_action :store_original_location, only: [:new, :create]

      def self.resource_class
        Ecm::Comments::Comment
      end

      private

      def after_create_location
        if @resource.errors.empty?
          original_location!
        else
          original_location
        end
      end

      def permitted_params
        params.require(:comment).permit(:name, :email, :body, :commentable_type, :commentable_id)
      end

      def store_original_location
        session[:original_location] = request.referer unless request.referer == request.url
      end

      def original_location
        session[:original_location]
      end

      def original_location!
        session.delete(:original_location)
      end
    end
  end
end
