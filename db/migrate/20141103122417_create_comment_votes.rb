class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table   :commentvotes do |t|
      t.string     :user_id, null: false
      t.string     :post_id, null: false

      t.timestamps
    end
  end
end
