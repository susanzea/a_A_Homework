

require "byebug"

def bsearch(arr, target)
    return nil if arr.length <= 1

    probe_index = arr.length / 2

    if target == arr[probe_index]
        return probe_index
    elsif target < arr[probe_index]
        probe_index = 0
        bsearch(arr[probe_index], target)
    else
        probe_index = probe_index + 1
        bsearch(arr[probe_index + 1..-1], target)
    end

end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# bsearch([2, 4, 6, 8, 10], 6) # => 2
# bsearch([1, 3, 4, 5, 9], 5) # => 3
# bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# bsearch([1, 2, 3, 4, 5, 7], 6) # => nil





debugger
def merge_sort(arr)
    debugger
    return arr if arr.length == 1

    mid_i = arr.length / 2
    left = arr[0...mid_i]
    right = arr[mid_i..-1]

debugger
    merge_sort(left) if left.length < 1
    merge_sort(right) if right.length < 1
debugger
    sorted_arr = []
    sorted_arr << merge(left, right) if left.length == 1 && right.length == 1 
    debugger
    merge_sort(left) if left.length > 1
    merge_sort(right) if right.length > 1

debugger
    sorted_arr
end

def merge(left, right)
    debugger
    left_ele = left[0]
    right_ele = right[0]

    if left_ele > right_ele
        right + left
    else
        left + right
    end
    debugger
end


p merge_sort([3,7,4,9,1,6,5])