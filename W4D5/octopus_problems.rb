

def sluggish_octopus(fish_arr)
    longest_fishy = fish_arr.first

    (0..fish_arr.length-1).each do |fish_1_i|
        fish_1 = fish_arr[fish_1_i]
        (fish_1_i+1..fish_arr.length-1).each do |fish_2_i|
            fish_2 = fish_arr[fish_2_i]
            longest_fishy = fish_2 if fish_2 > fish_1
        end
    end

    longest_fishy
end

# p sluggish_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
#  'fiiiissshhhhhh'])


def dominant_octopus(fish_arr)
    longest_fishy = fish_arr[0]

    fish_arr[1..-1].each do |fish|
        longest_fishy = fish if fish.length > longest_fishy.length
    end

    longest_fishy
end

# p dominant_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
#  'fiiiissshhhhhh'])


def slow_dance(dir, tiles_arr)
    (0..tiles_arr.length-1).each do |i|
        return i if tiles_arr[i] == dir
    end
end

# p slow_dance("up", ["up", "right-up", "right", "right-down", "down", "left-down", 
# "left",  "left-up" ])
# p slow_dance("right-down", ["up", "right-up", "right", "right-down", "down", "left-down", 
# "left",  "left-up" ])



def fast_dance(dir, tiles_hash)
    tiles_hash[dir]
end

p fast_dance("up", "up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, 
"left"=>6,  "left-up"=>7)

p fast_dance("right-down", "up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, 
"left"=>6,  "left-up"=>7)