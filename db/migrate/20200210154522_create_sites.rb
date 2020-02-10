# frozen_string_literal: true

class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites, id: :uuid do |t|
      t.string :url, null: false, index: { unique: true }, comment: 'Ссылка на сайт'
      t.string :title, comment: 'Название сайта'
      t.integer :status, comment: 'Статус ответа'

      t.timestamps null: false
    end
  end
end
