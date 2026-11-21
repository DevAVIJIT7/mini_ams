class CreateCertificationActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :certification_activities do |t|
      t.references :certification, null: false, foreign_key: true
      t.references :credit_type, null: false, foreign_key: true
      t.decimal :amount
      t.string :description
      t.date :occurred_on

      t.timestamps
    end
  end
end
