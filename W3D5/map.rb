


class Map

    def initialize
        @map = Array.new
    end

    def set(key, value)
        key_contained = false

        @map.each_with_index do |pair, pair_i|
            key_contained = true if pair[0] == key
            if key_contained
                @map[pair_i][1] = value
                return "#{key}'s value was changed to #{value}!"
            end
        end

        @map << [key, value] unless key_contained
        puts "#{key} and #{value} were added as a pair!"
    end

    def get(key)
        @map.each do |pair|
            return pair[1] if pair[0] == key
        end

        puts "map does not contain #{key} as a key"
    end 

    def delete(key)
        @map.each_with_index do |pair, pair_i|
            if pair[0] == key
                @map.slice!(pair_i)
                return "#{key}'s key-value pair has been deleted"
            end
        end

        puts "map does not contain #{key} as a key"
    end

    def show
        @map
    end
end