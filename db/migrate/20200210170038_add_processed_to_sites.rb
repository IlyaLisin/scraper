# frozen_string_literal: true

class AddProcessedToSites < ActiveRecord::Migration[6.0]
  def change
    add_column :sites,
               :processed,
               :boolean,
               null: false,
               default: false,
               comment: 'ссылка обработана'
  end
end
