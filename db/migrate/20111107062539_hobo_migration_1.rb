class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :proyectos do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :usuario_id
    end
    add_index :proyectos, [:usuario_id]
  end

  def self.down
    drop_table :proyectos
  end
end
