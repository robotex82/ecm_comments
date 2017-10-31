module Ecm::Comments
  class Comment < ActiveRecord::Base
    belongs_to :commentable, polymorphic: true

    validates :name, presence: true
    validates :email, presence: true
    validates :body, presence: true

    module Userstamps
      extend ActiveSupport::Concern

      included do
        belongs_to :creator, foreign_key: 'created_by_id', class_name: Ecm::Comments.creator_class_name, optional: true
        belongs_to :updater, foreign_key: 'updated_by_id', class_name: Ecm::Comments.creator_class_name, optional: true

        after_initialize :set_creator, if: :new_record?
        after_initialize :set_updater, if: :persisted?
      end

      private

      def set_creator
        self.creator = Ecm::UserArea.current_user
      end

      def set_updater
        self.updater = Ecm::UserArea.current_user
      end
    end

    include Userstamps

    module IpTracking
      extend ActiveSupport::Concern

      included do
        validates :created_by_ip_address, presence: true, if: :new_record?
        validates :updated_by_ip_address, presence: true, if: :persisted?

        after_initialize :set_created_by_ip_address, if: :new_record?
        after_initialize :set_updated_by_ip_address, if: :persisted?
      end

      private

      def set_created_by_ip_address
        self.created_by_ip_address = Ecm::Core.remote_ip
      end

      def set_updated_by_ip_address
        self.updated_by_ip_address = Ecm::Core.remote_ip
      end
    end

    include IpTracking

    module SpamProtection
      attr_accessor :nickname

      def save
        if nickname.present?
          valid?
          return true
        else
          super
        end
      end
    end

    prepend SpamProtection
  end
end
