local Random = {}

function Random.get_random_int()
    return math.randomseed(os.time())
end

return Random
