class MakeNumberUniqa < ActiveRecord::Migration[6.1]
  def change
    add_index :episodes, :number, unique: true
  end
end
