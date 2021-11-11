class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role, optional: true
  has_many :vizits, dependent: :destroy
  validates :fullname, presence: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Patient' if role.nil?
  end
end
