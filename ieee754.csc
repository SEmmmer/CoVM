class float
    var bin = {}
    var hex = {}
    var dec = 0

    function initialize()
        while bin.size() < 32
            bin.push_back(0)
        end

        while hex.size() < 8
            hex.push_back("0")
        end
    end
end

class double
    function initialize()
        
    end
end