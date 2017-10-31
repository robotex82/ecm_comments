class CreateEcmCommentsComments < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_comments_comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.string :name
      t.string :homepage
      t.string :email
      t.text :body
      t.integer :created_by_id
      t.string :created_by_ip_address
      t.integer :updated_by_id
      t.string :updated_by_ip_address

      t.timestamps null: false
    end
  end
end
