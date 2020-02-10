# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_210_170_038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'
  enable_extension 'uuid-ossp'

  create_table 'sites', id: :uuid, default: -> { 'uuid_generate_v4()' }, force: :cascade do |t|
    t.string 'url', null: false, comment: 'Ссылка на сайт'
    t.string 'title', comment: 'Название сайта'
    t.integer 'status', comment: 'Статус ответа'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'processed', default: false, null: false, comment: 'ссылка обработана'
    t.index ['url'], name: 'index_sites_on_url', unique: true
  end
end
