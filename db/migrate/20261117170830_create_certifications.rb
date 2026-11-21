class CreateCertifications < ActiveRecord::Migration[8.1]
  def change
    create_table :certifications do |t|
      t.references :member, null: false, foreign_key: true
      t.string :name
      t.date :issued_at
      t.string :tenant_id

      t.timestamps
    end
  end
end
