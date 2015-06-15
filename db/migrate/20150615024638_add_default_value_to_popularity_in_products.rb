class AddDefaultValueToPopularityInProducts < ActiveRecord::Migration
	def self.up
	  change_column :products, :popularity, :int, :default => 0
	end

	def self.down
	  # change_column :products, :popularity, :int, default: true
	end
end
