class Empresa < ApplicationRecord
    has_many :sucursals, dependent: :destroy
    before_save { self.correo = correo.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :correo, presence: true, length: {maximum: 30},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    validates :rfc, presence: true, length: {maximum: 13}
    validates :nomdueno, presence: true, length: {maximum: 30}
    validates :nombre, presence:true,  length: {maximum: 50}
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    accepts_nested_attributes_for :sucursals,
    :allow_destroy => true
end
