class HoboMigration3 < ActiveRecord::Migration
  def self.up
    create_table :proyectousuarios do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :proyecto_id
      t.integer  :usuario_id
    end
    add_index :proyectousuarios, [:proyecto_id]
    add_index :proyectousuarios, [:usuario_id]

    remove_column :proyectos, :owner_id

    remove_index :proyectos, :name => :index_proyectos_on_owner_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    add_column :proyectos, :owner_id, :integer

    drop_table :proyectousuarios

    add_index :proyectos, [:owner_id]
  end
end
