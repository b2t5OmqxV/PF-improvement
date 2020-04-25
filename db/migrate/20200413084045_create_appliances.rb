class CreateAppliances < ActiveRecord::Migration[5.2]
  def change
    create_table :appliances do |t|
      t.integer  :user_id,null: false
      t.integer  :category_id,null: false
      t.string   :maker,null: false
      t.string   :image_id, default: ""
      t.string   :product,null: false
      t.string   :model,null: false
      t.integer  :purchase_amount,null: false, default: "0"
      t.date     :purchase_day,null: false
      t.date     :warranty_period,null: false
      t.date     :start_operation,null: false
      t.date     :useful_life,null: false
      t.string   :place,null: false, default: "屋内:"
      t.string   :frequency,null: false, default: "ほぼ毎日(年中)"
      t.text     :detail

      t.timestamps
    end
  end
end
