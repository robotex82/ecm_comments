Ecm::Comments.configure do |config|
  # Set the base controller for the controllers
  #
  # Default: config.base_controller = '<%= base_controller_class_name %>'
  #
  config.base_controller = '<%= base_controller_class_name %>'
  
  config.creator_class_name = 'User'
end
