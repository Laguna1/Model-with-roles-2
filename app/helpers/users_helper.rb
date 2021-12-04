# frozen_string_literal: true

module UsersHelper
  def current_user_is_doctor?(current_user_id, doctor_id)
    relationship = Contact.find_by(patient_id: current_user_id, doctor_id: doctor_id)
    return true if relationship
  end
end
