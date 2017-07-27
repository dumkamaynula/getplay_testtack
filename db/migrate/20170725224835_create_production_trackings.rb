class CreateProductionTrackings < ActiveRecord::Migration[5.0]
  def change
    create_table :production_trackings do |t|
      t.integer :game_id
      t.integer :designer_id
      t.integer :illustrator_id
      t.integer :writer_id
      t.integer :composer_id
      t.integer :developer_id
      t.boolean :live

      t.timestamps
    end
  end
end
