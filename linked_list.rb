class Node
    
    attr_accessor :value, :next_node
    
    def initialize(value = nil, next_node=nil)
        @value = value
        @next_node = value
    end

    def set_value(value)
        @value = value
    end

    def set_next_node(pointer)
        @next_node = pointer
    end 

end     

class Linked_list
    attr_accessor :start, :end1, :node_counter
   
    def initialize(start = nil, end1=nil)
        @start = start
        @end1 = end1
        @node_counter = 0
    end

    def append(data)
        new_node = Node.new
        new_node.set_value(data)

        if @node_counter == 0
            @start = new_node
            @end1 = new_node
        else
            @end1.set_next_node(new_node)
            @end1 = new_node
        end
        @node_counter += 1
    end 

    def prepend(data)
        new_node = Node.new
        new_node.set_value(data)

        if @node_counter == 0
            @start = new_node
            @end1 = new_node
        else
            new_node.set_next_node(@start)
            @start = new_node
        end
        @node_counter += 1
    end
    
    def size
        puts @node_counter
    end

    def head
        puts @start.value
    end

    def tail
        puts @end1.value
    end

    def at(index)
        current_node = @start
        if index == 1
            return current_node
        end
        (index-1).times {
            current_node = current_node.next_node
        }
        return current_node
    end

    def pop
        @end1 = at(@node_counter-1)
        @node_counter -= 1
    end
   
    def contains?(value)
        i = 0
        current_node = @start
        while i < @node_counter
            if current_node.value == value
                return current_node.value
            else
                i += 1
                current_node = current_node.next_node
            end
        end
        return false
    end

    def find(value)
        i = 0
        current_node = @start
        while i < @node_counter
            if current_node.value == value
                return i
            else
                i += 1
                current_node = current_node.next_node
            end
        end
        return nil
    end

    def to_s
        i = 0
        str = ''
        current_node = @start
        while i < @node_counter
            str << "( #{current_node.value} ) -->"
            current_node = current_node.next_node
            i += 1
        end

        return str
    end
end

list = Linked_list.new
list.append(10)
list.append(5)
list.append(6)
list.prepend(4)

puts list.to_s
