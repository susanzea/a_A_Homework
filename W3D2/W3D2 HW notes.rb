# = is an assignment operator that creates a new pointer in memory, it does not mutate
#if an operation mutates, then the item in memory will change as will all pointers that are assigned to that variable
def add_to_array!(array, item)
  array << item
end

my_array = []
add_to_array!(my_array, "an item!")
p my_array
