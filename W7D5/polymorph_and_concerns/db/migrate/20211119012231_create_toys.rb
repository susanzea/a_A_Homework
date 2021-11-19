class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.references :toyable, polymorphic: true, index: true
      t.string :name, null: false, unique: true
      t.integer :toyable_id
      t.integer :toyable_type
    end

    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true
  end
end
