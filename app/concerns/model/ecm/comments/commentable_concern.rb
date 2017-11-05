module Model
  module Ecm
    module Comments
      module CommentableConcern
        extend ActiveSupport::Concern

        included do
          has_many :comments, as: :commentable, class_name: 'Ecm::Comments::Comment'
        end
      end
    end
  end
end