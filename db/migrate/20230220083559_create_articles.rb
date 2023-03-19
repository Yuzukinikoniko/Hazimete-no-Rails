class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title,    null: false, default: ""
      t.text :body ,null: false, default: ""
      t.timestamps
    end
  end
end
