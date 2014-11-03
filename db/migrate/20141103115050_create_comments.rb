class CreateComments < ActiveRecord::Migration
  def change
    create_table   :comments do |t|
      t.string     :user_id, null: false
      t.string     :post_id, null: false
      t.string     :content, null: false

      t.timestamps
    end
  end
end
