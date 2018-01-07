class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :communities, :name
  end
end
