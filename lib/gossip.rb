
require 'csv'

class Gossip
	attr_accessor :author, :content
		
			def initialize(author,content)
				@author = author
				@content = content 
			end
			
			
			def save
				CSV.open("./db/gossip.csv", "ab") do |csv|
				csv << ["#{@author}", "#{@content}"]
				end
			end
			
			
			def self.all
				all_gossips = []
					CSV.read("./db/gossip.csv").each do |csv_row|
							all_gossips << Gossip.new(csv_row[0], csv_row[1])
					end
				return all_gossips
			end
				
			
			def self.find(id)
				id_find = CSV.read("./db/gossip.csv")
					return id_find[id]
			end
									
			
end


