function quickselect(arr::Vector{Int64}, k::Int64, pivot_fn=rand)
    if length(arr) == 1
        @assert k == 1 "k is not one"
        return arr[1]
    end

    pivot = pivot_fn(arr)
    lows = arr[arr.<pivot]
    pivots = arr[arr.==pivot]

    if k < length(lows) + 1
        return quickselect(lows, k, pivot_fn)
    elseif k < length(lows) + length(pivots) + 1
        return pivots[1]
    else
        return quickselect(arr[arr.>pivot], k - length(lows) - length(pivots), pivot_fn)
    end
end


function quickselect_median(arr::Vector{Int64}, pivot_fn=rand)
    len = length(arr)
    if len % 2 == 1
        return quickselect(arr, Int(ceil(len / 2)), pivot_fn)
    else
        return 0.5 * (quickselect(arr, Int(len / 2), pivot_fn) + quickselect(arr, Int(len / 2 + 1), pivot_fn))
    end

end



arr = [7; 6; 5; 4; 3; 2]

println(quickselect_median(arr))