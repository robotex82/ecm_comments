FactoryGirl.define do
  factory :ecm_comments_comment, class: Ecm::Comments::Comment do
    association :creator,     factory: :ecm_user_area_user
    association :commentable, factory: :ecm_blog_post
    name 'John Doe'
    email 'john.doe@example.com'
    body 'This is a comment!'
    created_by_ip_address '127.0.0.1'
  end
end
