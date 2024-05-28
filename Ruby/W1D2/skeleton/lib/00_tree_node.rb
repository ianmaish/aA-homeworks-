module Searchable

    def dfs(target = nil, &prc)
        raise "Need a target or a proc" if [target, prc].none?
        prc ||= Proc.new {|node| node.value == target}

        return self if prc.call(self)

        children.each do |child|
            prod = child.dfs(&prc)
            return prod unless prod.nil?
        end 
        nil 

    end 


    def bfs(target = nil, &prc)
        raise "Need a target or a proc" if [target, prc].none?
        prc ||= Proc.new {|node| node.value == target}

        nodes = [self]

        until nodes.empty?
            node = nodes.shift
            return node if prc.call(node)

            nodes.concat(node.children)
        end 
        nil

    end 











end 


class PolyTreeNode

    include Searchable

    attr_accessor :value
    attr_reader :parent


    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end    


    def children
        @children.dup
    end 


    def parent=(parent)    
        return if self.parent == parent

        if self.parent
            self.parent._children.delete(self)
        end 
        
        @parent = parent
        self.parent._children << self unless self.parent.nil?

        self
    end 

    def add_child(child)
        child.parent = self
    end 

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "Tried to remove node that is not a child"
        end 
        child.parent = nil 
    end 










    protected

    def _children
        @children
    end 
end