class CreateWbInfo < ActiveRecord::Migration[5.0]
  def change
    create_table :wb_infos do |t|
      t.string :region
      t.string :project_abstract
      t.string :project_name
      t.date :year
      t.decimal :loan_ammount

      t.timestamps
    end
  end
end
