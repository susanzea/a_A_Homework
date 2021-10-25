

class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end



end

def bfs(starting_node, target_value)
        q = [starting_node]
        visited = []

        until q.empty?

            if q.first.value == target_value
                return q.first
            elsif visited.include?(q.first)
                q.shift
            else
                visited << q.first
                q += q.first.neighbors
                q.shift 
            end
        end

        nil
    end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

# p   bfs(a, "b")
#  p bfs(a, "f")