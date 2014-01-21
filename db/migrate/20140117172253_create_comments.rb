class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post, index: true
      # ^ Sets up foreign key column for association between two models.

      t.timestamps
    end
  end
end
