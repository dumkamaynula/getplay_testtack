class AddPhotoColumnToGames < ActiveRecord::Migration[5.0]
  def up
    add_attachment :games, :photo
  end

  def down
    remove_attachment :games, :photo
  end
end
