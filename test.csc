var ADD = 0
var SUB = 1
var MUL = 2
var DIV = 3
var MOD = 4
var PUSH = 5
var POP = 6
var JMP = 7
var EXIT = 8
var AND = 9
var OR = 10
var EQ = 11
var NE = 12
var LT = 13
var GT = 14
var LE = 15
var GE = 16
var JZ = 17
var JNZ = 18

var stack = {}
var text = null
var code = null
var next = null
var reg = 0

@begin
var opcode = {
    PUSH: ([](stack) -> (array.push_back(stack, array.iterator.data(next)), next = array.iterator.next(next))),
    POP:  ([](stack) -> (array.pop_back(stack))),
    JMP:  ([](stack) -> (next = array.begin(code) + array.iterator.data(next), array.pop_back(stack))),
    EXIT: ([](stack) -> (system.out.println("exit(" + array.back(stack) + ")"), array.pop_back(stack))),

    JZ:   ([](stack) -> (next = array.iterator.next(next) ? : )),
    JNZ:  ([](stack) -> ((reg = array.back(stack) ? stack.at(reg) : array.iterator.next(next)))),

    ADD:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg += array.back(stack), array.pop_back(stack), array.push_back(stack, reg))),
    SUB:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = array.back(stack) - reg, array.pop_back(stack), array.push_back(stack, reg))),
    MUL:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg *= array.back(stack), array.pop_back(stack), array.push_back(stack, reg))),
    DIV:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = array.back(stack) / reg, array.pop_back(stack), array.push_back(stack, reg))),
    MOD:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = array.back(stack) % reg, array.pop_back(stack), array.push_back(stack, reg))),

    OR:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) or reg), array.pop_back(stack), array.push_back(stack, reg))),
    AND:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) and reg), array.pop_back(stack), array.push_back(stack, reg))),

    EQ:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) == reg), array.pop_back(stack), array.push_back(stack, reg))),
    NE:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) != reg), array.pop_back(stack), array.push_back(stack, reg))),

    LT:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) < reg), array.pop_back(stack), array.push_back(stack, reg))),
    LE:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) <= reg), array.pop_back(stack), array.push_back(stack, reg))),
    GT:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) > reg), array.pop_back(stack), array.push_back(stack, reg))),
    LE:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) >= reg), array.pop_back(stack), array.push_back(stack, reg)))
}.to_hash_map()
@end

function eval(c)
    code = c
    next = array.begin(c)
    while next != array.end(c)
        var op = array.iterator.data(next)
        next = array.iterator.next(next)
        opcode[op](stack)
    end
end



function main()
# eval({PUSH, 10, PUSH, 20, ADD, EXIT})
# eval({PUSH, 10 , CALL, 0, RET, 10, EXIT})

end



main()