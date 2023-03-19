class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :user_id,    null: false, default: ""
      t.string :work_start ,null: false, default: ""
      t.timestamps
    end
  end
end
