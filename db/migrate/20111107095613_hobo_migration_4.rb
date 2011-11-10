class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :github, :string
  end

  def self.down
    remove_column :proyectos, :github
  end
end
