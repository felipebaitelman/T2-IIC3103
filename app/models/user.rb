class User < ApplicationRecord

  # Validamos presencia de usuario y nombre
  validates :usuario, presence: true, allow_nil: false, allow_blanck: false
  validates :nombre, presence: true, allow_nil: false, allow_blanck: false

  # Definimos que atributos entregar en el json
  # Idea de: https://quickleft.com/blog/keeping-your-json-response-lean-in-rails/
  def as_json(options={})
    super(:only => [:id, :nombre,:apellido,:usuario,:twitter])
  end


end
