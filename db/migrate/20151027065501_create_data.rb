class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :title
      t.integer :category_id

      t.timestamps
    end
  end
end
