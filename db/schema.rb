# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_206_233_304) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'speciality'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'contacts', force: :cascade do |t|
    t.integer 'patient_id', null: false
    t.integer 'doctor_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['doctor_id'], name: 'index_contacts_on_doctor_id'
    t.index %w[patient_id doctor_id], name: 'index_contacts_on_patient_id_and_doctor_id', unique: true
    t.index ['patient_id'], name: 'index_contacts_on_patient_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'fullname'
    t.bigint 'role_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'mobile_no'
    t.string 'address'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.bigint 'category_id'
    t.index ['category_id'], name: 'index_users_on_category_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['role_id'], name: 'index_users_on_role_id'
  end

  create_table 'visits', force: :cascade do |t|
    t.datetime 'date'
    t.string 'note'
    t.bigint 'pat_id', null: false
    t.bigint 'doc_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['doc_id'], name: 'index_visits_on_doc_id'
    t.index ['pat_id'], name: 'index_visits_on_pat_id'
  end

  create_table 'vizits', force: :cascade do |t|
    t.datetime 'date'
    t.string 'notes'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_vizits_on_user_id'
  end

  add_foreign_key 'users', 'categories'
  add_foreign_key 'users', 'roles'
  add_foreign_key 'visits', 'users', column: 'doc_id'
  add_foreign_key 'visits', 'users', column: 'pat_id'
  add_foreign_key 'vizits', 'users'
end
