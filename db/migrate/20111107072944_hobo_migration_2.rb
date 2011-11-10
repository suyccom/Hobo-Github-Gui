class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :owner_id, :integer
    remove_column :proyectos, :usuario_id

    remove_index :proyectos, :name => :index_proyectos_on_usuario_id rescue ActiveRecord::StatementInvalid
    add_index :proyectos, [:owner_id]
  end

  def self.down
    remove_column :proyectos, :owner_id
    add_column :proyectos, :usuario_id, :integer

    remove_index :proyectos, :name => :index_proyectos_on_owner_id rescue ActiveRecord::StatementInvalid
    add_index :proyectos, [:usuario_id]
  end
end
