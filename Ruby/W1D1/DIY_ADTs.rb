# EXERCISE 1
class Stack
    
    attr_reader :array


    def initialize 
        @array = []
    end 

    def push(ele)
        array.push(ele)
        ele
    end 

    def pop
        array.pop
    end 

    def peek
        array.last
    end 

end 



# EXERCISE 2
class Queue

    attr_reader :array

    def initialize
        @array = []
    end 

    def enqueue(el)
        array.push(el)
        el
    end 

    def dequeue
        array.shift
    end 

    def peek
        array.first
    end 

end 


# EXERCISE 3

class Map 

    attr_reader :array

    def initialize
        @array = []
    end 

    def set(key, value)
        pair_index = array.index {|pair| pair[0] == key}
        if pair_index
            array[pair_index][1] = value
        else 
            array.push(key, value)
        end 
        value
    end 

    def get(key)
        array.each {|pair| return pair[1] if pair[0] == key}
        nil
    end 

    def delete(key)
        value = get(key)
        array.reject! {|pair| pair[0] == key}
        value
    end 

    def show
        duplicate(array)
    end

    private

    def duplicate(arr)
        arr.map {|ele| ele.is_a?(Array) ? duplicate(ele) : ele}
    end 



end 