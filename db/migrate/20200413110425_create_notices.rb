class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer  :admin_id, null: false
      t.string   :title, null: false
      t.text     :text, null: false

      t.timestamps
    end
  end
end
