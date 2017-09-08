x = joypad.get(1)
print (x)

-- frequencies per key
kf = {left = 100, right = 100, up = 100, down = 100,
              A = 100, B = 100, X = 100, Y = 100,
              L = 100, R = 100}

key_counts = {left = {}, right = {}, up = {}, down = {},
              A = {}, B = {}, X = {}, Y = {},
              L = {}, R = {}}

function init_key(k)
    key_counts[k] = {0, math.random(0, kf[k])}
end

function init_counts()
    for key, value in pairs(key_counts) do
        init_key(key)
    end
end

init_counts()
 
function random_input()
        for key, value in pairs(key_counts) do
            key_counts[key][1] = key_counts[key][1] + 1
            if (key_counts[key][1] >= key_counts[key][2]) then
                init_key(key)
                x[key] = not x[key]
            end
        end

        if x["left"] and x["right"] then
                x["left"] = false
        end
        x["select"] = false
        x["start"] = false
        joypad.set(1, x)
end
 
emu.registerbefore(random_input)
