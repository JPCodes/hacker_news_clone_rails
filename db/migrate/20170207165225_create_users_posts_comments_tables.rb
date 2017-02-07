class CreateUsersPostsCommentsTables < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column :name, :string
    end
    create_table :posts do |t|
      t.column :content, :text
      t.column :vote, :integer
      t.column :user_id, :integer
      t.timestamps
    end
    create_table :comments do |t|
      t.column :content, :text
      t.column :user_id, :integer
      t.column :post_id, :integer
    end
  end
end
