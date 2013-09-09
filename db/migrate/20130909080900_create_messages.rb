class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.references :topic, null: false
      t.foreign_key :topics, dependent: :delete
      t.timestamps
    end
  end
end
