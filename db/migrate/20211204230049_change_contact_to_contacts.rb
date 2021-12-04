# frozen_string_literal: true

class ChangeContactToContacts < ActiveRecord::Migration[6.1]
  def change
    rename_table :contact, :contacts
  end
end
