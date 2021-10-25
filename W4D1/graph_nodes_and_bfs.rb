

class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end


    def bfs(starting_node, target_value)
        q = [starting_node]
        visited = Set.new()

        until q.empty?

            if q.first.value == target
                return q.first
            elsif visited.includes?(q.first)
                q.shift
            else
                visited << q.first
                q += q.first.neighbors
                q.shift 
            end
        end

        nil
    end
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