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

    JZ:   ([](stack) -> ((array.back(stack) == 0) ? array.begin(code) + array.iterator.data(next) : next = array.iterator.next(next), array.pop_back(stack))),
    JNZ:  ([](stack) -> ((array.back(stack) == 0) ? array.begin(code) + array.iterator.data(next) : next = array.iterator.next(next), array.pop_back(stack))),

    ADD:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg += array.back(stack), array.pop_back(stack), array.push_back(stack, reg))),
    SUB:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = array.back(stack) - reg, array.pop_back(stack), array.push_back(stack, reg))),
    NEG:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), array.push_back(stack, -reg))),
    MUL:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg *= array.back(stack), array.pop_back(stack), array.push_back(stack, reg))),
    DIV:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = array.back(stack) / reg, array.pop_back(stack), array.push_back(stack, reg))),
    IDIV: ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = to_integer(to_integer(array.back(stack)) / to_integer(reg)), array.pop_back(stack), array.push_back(stack, reg))),
    MOD:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = array.back(stack) % reg, array.pop_back(stack), array.push_back(stack, reg))),

    OR:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) or reg), array.pop_back(stack), array.push_back(stack, reg))),
    AND:  ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) and reg), array.pop_back(stack), array.push_back(stack, reg))),

    EQ:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) == reg), array.pop_back(stack), array.push_back(stack, reg))),
    NE:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) != reg), array.pop_back(stack), array.push_back(stack, reg))),

    LT:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) < reg), array.pop_back(stack), array.push_back(stack, reg))),
    LE:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) <= reg), array.pop_back(stack), array.push_back(stack, reg))),
    GT:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) > reg), array.pop_back(stack), array.push_back(stack, reg))),
    GE:   ([](stack) -> (reg = array.back(stack), array.pop_back(stack), reg = (array.back(stack) >= reg), array.pop_back(stack), array.push_back(stack, reg))),

    DUP:  ([](stack) -> (reg = array.back(stack), array.push_back(stack, reg))),
    SWAP: ([](stack) -> (swap(stack[size(stack) - 1], stack[size(stack) - 2])))
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