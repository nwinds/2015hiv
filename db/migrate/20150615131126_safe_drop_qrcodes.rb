class SafeDropQrcodes < ActiveRecord::Migration
  def self.up
    drop_table 'qrcodes' if ActiveRecord::Base.connection.table_exists? 'qrcodes'
 
    if ActiveRecord::Base.connection.table_exists? :another_obsolete_table
      drop_table :another_obsolete_table
    end
  end
 
  def self.down
    # We're not going to reverse this migration even if the current deployment fails...
    # Since a previous sprint deployment has made these tables obsolete, we're completely sure they're no longer used.
    # There's no need to recreate them in the event of a rollback just so they can be DROPped again when the current
    # deployment succeeds.
  end
 
end
