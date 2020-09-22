function Enum(name_array)
   var num = 0
   var exec_array = ""
   foreach name in name_array
    exec_array+="var " + name + " = " + to_string(num++) + "\n"
   end
    system.out.println(exec_array)
end

# ADD            stack: ..., a, b           -> ..., a+b
# SUB            stack: ..., a, b           -> ..., a-b
# NEG            stack: ..., a              -> ..., -a
# MUL            stack: ..., a, b           -> ..., a*b
# DIV            stack: ..., a, b           -> ..., a/b
# IDIV           stack: ..., a: Int, b: Int -> ..., a/b: Int
# MOD            stack: ..., a, b           -> ..., a%b

# PUSH <IMM>     stack: ...                 -> ..., IMM
# POP            stack: ..., p              -> ...
# JMP <OFFSET>   stack: ...                 -> ...
# EXIT           stack: ..., p              -> ...

# AND            stack: ..., a: any, b: any -> ..., (a and b): bool
# OR             stack: ..., a: any, b: any -> ..., (a or b) : bool
# EQ             stack: ..., a: any, b: any -> ..., (a == b) : bool
# NE             stack: ..., a: any, b: any -> ..., (a != b) : bool
# LT             stack: ..., a: any, b: any -> ..., (a < b)  : bool
# GT             stack: ..., a: any, b: any -> ..., (a > b)  : bool
# LE             stack: ..., a: any, b: any -> ..., (a <= b) : bool
# GE             stack: ..., a: any, b: any -> ..., (a >= b) : bool

# JZ <OFFSET>    stack: ..., a              -> ...
# JNZ <OFFSET>   stack: ..., a              -> ...

# DUP            stack: ..., a              -> ..., a, a
# SWAP           stack: ..., a, b           -> ..., b, a

@begin
Enum({
    "ADD", "SUB", "NEG", "MUL", "DIV", "IDIV", "MOD",
    "PUSH", "POP", "JMP", "EXIT",
    "AND", "OR",
    "EQ", "NE",
    "LT", "GT", "LE", "GE",
    "JZ", "JNZ",
    "DUP", "SWAP"
})
@end