class CreateCreditTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :credit_types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
