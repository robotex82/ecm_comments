module Ecm
  module Comments
    module ApplicationHelper
      def commentable(resource)
        @comment = Ecm::Comments::Comment.new(commentable_type: resource.class, commentable_id: resource.id)
        render partial: 'ecm/comments/commentable', locals: { resource: resource }
      end
    end
  end
end
