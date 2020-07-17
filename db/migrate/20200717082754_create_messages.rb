class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.text :content
      t.string :message_image_id
      t.timestamps
    end
  end
end
