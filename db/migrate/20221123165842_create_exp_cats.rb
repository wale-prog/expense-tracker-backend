class CreateExpCats < ActiveRecord::Migration[7.0]
  def change
    create_table :exp_cats do |t|

      t.timestamps
    end
  end
end
