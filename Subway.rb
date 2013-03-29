# ***HELPER FUNCTIONS***
# what are my options for not having this at the top?  just creating a module?

def get_entry(array)
	confirmed = false
	while confirmed == false do
		for i in 0...array.length
			puts "#{i+1}) #{array[i]}"
		end
		entry = gets.chomp.to_i
		if (1..array.length).include?(entry)
			confirmed = true
			return entry-1
		else
			puts "\nInvalid input.  Please enter valid selection"
		end
	end	
end

# ***END HELPER FUNCTIONS***


stations = {
	"N" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
	"L" => ["8th", "6th", "Union Square", "3rd", "1st"],
	"S" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}
	
# Recieve input for...

# ...entry line
puts "What line are you getting in on?"
entry_line = stations.keys[get_entry(stations.keys)]
puts "Entry Line = #{entry_line}\n\n"

# ...entry station
puts "What station are you getting in at?"
entry_station_index = get_entry(stations[entry_line])
puts "Entry Station = #{stations[entry_line][entry_station_index]}\n\n"

# ...exit line
puts "What line are you getting off on?"
exit_line = stations.keys[get_entry(stations.keys)]
puts "Exit Line = #{exit_line}\n\n"

# ...exit station
puts "What station are you getting off at?"
exit_station_index = get_entry(stations[exit_line])
puts "Exit Station = #{stations[exit_line][exit_station_index]}\n\n"

# Calculate stops
stops = 
	if entry_line == exit_line
		(exit_station_index - entry_station_index).abs
	else
		leg1 = (entry_station_index - stations[entry_line].index("Union Square")).abs
		leg2 = (exit_station_index - stations[exit_line].index("Union Square")).abs
		leg1 + leg2
	end

puts "Total stops: #{stops}"