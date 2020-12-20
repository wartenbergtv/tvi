class AddNodeToEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_column :episodes, :node, :text
    add_column :episodes, :active, :boolean, default: true
  end
end
