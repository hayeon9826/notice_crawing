class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|

      t.timestamps
      t.string :title
      t.string :author
      t.text :content
    end
  end
end
