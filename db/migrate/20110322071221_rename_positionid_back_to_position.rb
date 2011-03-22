class RenamePositionidBackToPosition < ActiveRecord::Migration
  def self.up
    rename_column :articles, :position_id, :position
  end

  def self.down
    rename_column :articles, :position, :position_id
  end
end
