function to_bin(dec)

    var bin = 0
    var times = 0
    var mod = 0
    if dec > 0
        var dec_number = (dec)
        while (dec_number!=0)
            mod = (dec_number % 2)
            bin += (mod * 10 ^ times++)
            dec_number = to_integer(dec_number /= 2)
        end
    else
        var dec_number = (-dec)
        while (dec_number!=0)
            mod = ((dec_number % 2) == 1 ? 0 : 1)
            bin += (mod * 10 ^ times++)
            dec_number = to_integer(dec_number /= 2)
        end
        bin += 1
    end
    return bin    
end

function to_dec(bin)
    var bin_number = bin
    var dec = 0
    var times = 0
    while bin_number!=0
        dec += ((bin_number % 10) * 2 ^ times++)
        bin_number = to_integer(bin_number /= 10)
    end
    return dec
end

function logi_and(const_lhs, const_rhs)
    var lhs = to_bin(const_lhs)
    var rhs = to_bin(const_rhs)

    var result_value = 0
    var times = 0

    while (lhs != 0) or (rhs != 0)
        if (lhs % 10 == 1) and (rhs % 10 == 1)
            result_value += 1 * 10 ^ times
        end
        lhs = to_integer(lhs /= 10)
        rhs = to_integer(rhs /= 10)
        times++
    end
    return to_dec(result_value)
end


function logi_or(const_lhs, const_rhs)
    var lhs = to_bin(const_lhs)
    var rhs = to_bin(const_rhs)

    var result_value = 0
    var times = 0

    while (lhs != 0) or (rhs != 0)
        if (lhs % 10 == 1) or (rhs % 10 == 1)
            result_value += 1 * 10 ^ times
        end
        lhs = to_integer(lhs /= 10)
        rhs = to_integer(rhs /= 10)
        times++
    end
    return to_dec(result_value)
end

function logi_xor(const_lhs, const_rhs)
    var lhs = to_bin(const_lhs)
    var rhs = to_bin(const_rhs)

    var result_value = 0
    var times = 0

    while (lhs != 0) or (rhs != 0)
        if (lhs % 10) != (rhs % 10)
            result_value += 1 * 10 ^ times
        end
        lhs = to_integer(lhs /= 10)
        rhs = to_integer(rhs /= 10)
        times++
    end
    return to_dec(result_value)
end

function logi_shl(number, bit)
    return to_dec(to_bin(number) * 10 ^ bit)
end

function logi_shr(number, bit)
    return to_dec(to_bin(number) / 10 ^ bit)
end

