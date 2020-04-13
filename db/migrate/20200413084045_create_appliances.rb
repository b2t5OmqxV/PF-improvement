class CreateAppliances < ActiveRecord::Migration[5.2]
  def change
    create_table :appliances do |t|
      t.integer :user_id,null: false
      t.integer :category_id,null: false
      t.string  :maker,null: false
      t.string  :image_id, default: ""
      t.string  :product,null: false
      t.string  :model,null: false
      t.integer :purchase_amount,null: false, default: "0"
      t.date    :purchase_day,null: false
      t.date    :warranty_period,null: false
      t.date    :start_operation,null: false
      t.integer :place,null: false, default: "0"
      t.integer :frequency,null: false, default: "0"
      t.text    :detail,default: ""

      t.timestamps
    end
  end
end
