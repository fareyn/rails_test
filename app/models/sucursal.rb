class Sucursal < ApplicationRecord
    belongs_to :empresa
    has_many :empleados
    validates :empresa_id, numericality: {only_integer: true}
    validates :nsuc, presence: true, length: {maximum: 50}
    validates :ncalle, presence: true, length: {maximum: 30}
    validates :ncol, presence: true, length: {maximum: 30}
    validates :numext, numericality: {only_integer: true}
    validates :numint, numericality: {only_integer: true}
    validates :cpost, numericality: {only_integer: true}
    validates :ciudad, presence: true, length: {maximum: 30}
    validates :pais, presence: true, length: {maximum: 30}
end
