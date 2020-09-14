function Enum(name_array)
   var num = 0
   var exec_array = ""
   foreach name in name_array
    exec_array+="var " + name + " = " + to_string(num++) + "\n"
   end
    system.out.println(exec_array)
end

@begin
Enum({
    "ADD", "SUB", "MUL", "DIV", "MOD",
    "PUSH", "POP", "JMP", "EXIT",
    "AND", "OR",
    "EQ", "NE",
    "LT", "GT", "LE", "GE",
    "JZ", "JNZ",
    "RET", "CALL"
    })
@end