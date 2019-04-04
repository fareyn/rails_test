class Empleado < ApplicationRecord
    belongs_to :sucursal
    validates :sucursal_id, presence:true, numericality: {only_integer: true}
    validates :nemp, presence:true, length: {maximum: 50}
    validates :rfc, presence:true, uniqueness: true, length: {maximum: 13}
    validates :npuesto, presence:true, length: {maximum: 30}
end
