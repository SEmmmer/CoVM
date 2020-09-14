class long
    var long = {}

    function initialize()
        while long.size < 64
            long.push_back(0)
        end
    end

    function set(int_dec)
        var mut_int_dec = math.abs(int_dec)
        var pos = 63
        while pos != 0
            long[pos--] = mut_int_dec % 2
            mut_int_dec = to_integer(mut_int_dec /= 2)
        end
        if mut_int_dec != 0
            system.out.println("输入数字溢出！")
        end
        if int_dec < 0
            long[pos] = 1 
        end
    end

    function get()
        var pos = 63
        var sum = 0
        while pos != 0
            sum += long[pos] * 2 ^ (63 - pos)
            pos--
        end
        if long[pos] == 1
            sum  = (-sum)
        end
        return sum
    end

    function to_bin()
        var pos = 63
        var bin = 0

        while pos !=0
            sum += long[pos] * 10 ^ (63 - pos)
            pos--
        end
    end

    function add()
        
    end

    function to_string()
        return global.to_string(get())
    end
end