class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, optional: true
  has_many :vizits, dependent: :destroy
  validates :fullname, presence: true
  validates :email, uniqueness: true
  validates :mobile_no, uniqueness: true
  before_save :assign_role

  # Search user by mobile number(not email)
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    where(mobile_no: conditions[:mobile_no]).first
  end

  # Stop using email as authentication key
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def assign_role
    self.role = Role.find_by name: 'Patient' if role.nil?
  end

  def show_user_profile; end

  def admin?
    role.name == 'Admin'
  end
end
