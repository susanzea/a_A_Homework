class Stack 

    def initialize
        @stack  = []
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack.slice!(-1)
    end

    def peek
        @stack[-1]
    end
end