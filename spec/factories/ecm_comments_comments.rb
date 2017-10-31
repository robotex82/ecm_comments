FactoryGirl.define do
  factory :ecm_comments_comment, class: Ecm::Comments::Comment do
    association :creator,     factory: :user
    association :commentable, factory: :post
    name 'John Doe'
    email 'john.doe@example.com'
    body 'This is a comment!'
    created_by_ip_address '127.0.0.1'
  end
end
