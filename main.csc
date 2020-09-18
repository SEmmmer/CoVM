var stack = {}
var text = null
var code = null
var next = null
var reg = 0

@begin
var opcode = {
    PUSH: ([](stack) -> (array.push_back(stack, array.iterator.data(next)), next = array.iterator.next(next))),
    POP:  ([](stack) -> (array.pop_back(stack))),
    JMP:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), next = stack.at(reg))),
    EXIT: ([](stack) -> (system.out.println("exit(" + array.back(stack) + ")"), array.pop_back(stack))),

    JZ:   ([](stack) -> ((reg = array.back(stack) ? array.iterator.next(next) : stack.at(reg)))),
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
    LE:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) >= reg), array.pop_back(stack), array.push_back(stack, reg))),

    CALL: ([](stack) -> (reg = array.back(stack), array.pop_back(stack), array.push_back(array.size - 1), next = array.at(reg))),
    RET:  ([](stack) -> (next = array.back(stack), array.pop_back(stack)))
}.to_hash_map()
@end

function eval(code)
    next = array.begin(code)
    while next != array.end(code)
        var op = array.iterator.data(next)
        next = array.iterator.next(next)
        opcode[op](stack)
    end
end


function main()
eval({PUSH, 10, PUSH, 20, ADD, EXIT})
eval({PUSH, , CALL, EXIT})

end



main()