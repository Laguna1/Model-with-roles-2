# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, optional: true
  belongs_to :category, optional: true

  has_many :created_visits, class_name: 'Visit', foreign_key: 'pat_id'
  has_many :requested_visits, class_name: 'Visit', foreign_key: 'doc_id'

  validates :fullname, presence: true, uniqueness: true
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

  def doctor?
    role.name == 'Doctor'
  end

  def patient?
    role.name == 'Patient'
  end
end
