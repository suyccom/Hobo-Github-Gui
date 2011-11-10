class Proyecto < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    repositorio_github :string
    usuario_github :string
    pass_github :string
    timestamps
  end
  
  has_many :membresias, :class_name => "Proyectousuario", :dependent => :destroy
  has_many :miembros, :through => :membresias, :source => :usuario, :accessible => true

  # --- Permissions --- #

  def create_permitted?
    return true if acting_user.administrator?
  end

  def update_permitted?
    return true if acting_user.administrator?
  end

  def destroy_permitted?
    return true if acting_user.administrator?
  end

  def view_permitted?(field)
    acting_user.administrator? || acting_user.in?(miembros)
  end
  

end
