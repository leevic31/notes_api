class AddContentIndexToNotes < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pg_trgm' unless extension_enabled?('pg_trgm')
    add_index :notes, :content, using: 'gin', opclass: :gin_trgm_ops
  end
end
