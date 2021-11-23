module ApplicationHelper
  # Checks whether or not a user has had a contact request sent to them by the current user
  # returning either true or false
  def contact_request_sent?(user)
    current_user.contact_sent.exists?(doctor_id: user.id, status: false)
  end

  # Checks whether or not a user has sent a contact request to the current user
  # returning either true or false
  # Probably it is not necessary, we don`t need requests from the doctor to patient
  def contact_request_recieved?(user)
    current_user.contact_request.exists?(patient_id: user.id, status: false)
  end

  # Checks whether or not a user has had a contact request sent to them by the current user
  # or if the current user has been sent a contact request by the user 
  # and the reciever has accepted the contact
  # returning either true or false
  def contact_request_status?(user)
    request_sent = current_user.contact_sent.exists?(doctor_id: user.id, status: true)
    request_recieved = current_user.contact_request.exists?(patient_id: user.id, status: true)

    return true if request_sent != request_recieved 
    return true if request_sent == request_recieved && request_sent == true
    return false if request_sent == request_recieved && request_sent == false
  end
end
