class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.integer :community_id
      t.integer :user_id
      t.string :title
      t.string :description

      t.timestamps
    end

    add_index :issues, :community_id
    add_index :issues, :user_id
  end
end
