class Node
    attr_accessor :value, :next_node
    def initialize(value = nil)
        @value = value
        @next_node = nil
    end
end

class LinkedList
    attr_accessor :head, :tail, :size
    def initialize
        @head = nil
        @tail = nil
        @size = 0         
    end

    def append(value)
        node = Node.new value
        if @head.nil?
            @head = node
        elsif @tail.nil? == false
            @tail.next_node = node
            @tail = node
        else
            @tail = node
            @head.next_node = @tail
        end
        @size += 1
    end

    def prepend(value)
        node = Node.new value
        node.next_node = @head

        if @tail.nil?
            @tail = node.next_node
        end

        @head = node
        @size += 1
    end

    def head
        if @head.nil?
            return nil
        else
            return @head
        end
    end

    def tail
        if @size == 0
            return nil
        elsif @size == 1
            return @head
        else
            return @tail
        end
    end

    def at(index)
        start_node = @head
        
        if index == 0
            return start_node
        else
            i = 0
            while i < index
                start_node = start_node.next_node
                i = i + 1
            end
            return start_node
        end
    end

    def pop
        if tail.nil? && head.nil?
            return nil
        elsif tail.nil?
            @head = nil
            @size -= 1
        else
            new_tail = at(@size - 2)
            new_tail.next_node = nil
            @tail = new_tail
            @size -= 1
        end
    end

    def contains?(value)
        start_node = @head
        until start_node.nil?
            if start_node.value == value
                return true
            end
            start_node = start_node.next_node
        end
    end

    def find(value)
        start_node = @head
        count = 0
        until start_node.nil?
            if start_node.value == value
                return count
            end
            start_node = start_node.next_node
            count += 1
        end
    end

    def to_s
        string = ""
        start_node = @head
        until start_node.nil?
            string << "(#{start_node.value}) --> "
            start_node = start_node.next_node
        end
        return string << "nil"
    end

    def insert_at(value, index)
        if index == 0
            prepend(value)
        else
            pre_node = at(index - 1)
            after_node = at(index)
            node = Node.new(value)
            pre_node.next_node = node
            node.next_node = after_node
            @size += 1
        end
    end

    def remove_at(index)
        if index == 0
            @head = @head.next_node
        else
            pre_node = at(index - 1)
            after_node = at(index + 1)
            pre_node.next_node = after_node
        end
        @size -= 1
    end
end


