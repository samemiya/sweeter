class CreateSweets < ActiveRecord::Migration
  def change
    create_table :sweets do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
