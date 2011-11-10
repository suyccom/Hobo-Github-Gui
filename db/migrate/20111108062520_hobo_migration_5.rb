class HoboMigration5 < ActiveRecord::Migration
  def self.up
    rename_column :proyectos, :github, :repositorio_github
    add_column :proyectos, :usuario_github, :string
    add_column :proyectos, :pass_github, :string
  end

  def self.down
    rename_column :proyectos, :repositorio_github, :github
    remove_column :proyectos, :usuario_github
    remove_column :proyectos, :pass_github
  end
end
