//
//  main.swift
//  BinarySearchTree
//
//  Created by River McCaine on 8/17/22.
//

import Foundation


final class Node {
    
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    var parent: Node?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func insert(value: Int) {
        insert(value, parent: self)
    }
    
    
    private func insert(_ value: Int, parent: Node)  {
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.insert(value, parent: self)
            } else {
                leftChild = Node(value)
                leftChild?.parent = self
            }
            
        } else {
            if let rightChild = rightChild {
                rightChild.insert(value, parent: self)
            } else {
                rightChild = Node(value)
                rightChild?.parent = self
            }
        }
    }
    
    func contains(_ value: Int) -> Bool {
        if value == self.value { return true }
        
        if value < self.value {
            if let leftChild = leftChild {
                return leftChild.contains(value)
            }
        } else {
            if let rightChild = rightChild {
                return rightChild.contains(value)
            }
        }
        
        return false
    }
    
    
    func breadthFirstTraversal() -> [Int] {
        
        var breadthSearchResults: [Int]  = []
        var breadthSearchQueue: [Node]   = [self]
        
        while !breadthSearchQueue.isEmpty {
            
            let first = breadthSearchQueue.removeFirst()
            
            breadthSearchResults.append(first.value)
            
            if let leftChild = first.leftChild {
                breadthSearchQueue.append(leftChild)
            }
            
            if let rightChild = first.rightChild {
                breadthSearchQueue.append(rightChild)
            }
        }
        
        return breadthSearchResults
    }
    
    
    func inOrderTraversal(spacing: String = "") -> [Int] {
        var result: [Int] = []
        
        
        if let leftChild = leftChild {
            result += leftChild.inOrderTraversal(spacing: spacing + "  ")
            print("\(spacing)\(result)")
            
        }
        
        result.append(self.value)
        
        if let rightChild = rightChild {
            result += rightChild.inOrderTraversal(spacing: spacing + "  ")
            print("\(spacing)\(result)")
        }
        
        return result
    }
    
    
    func preorderTraversal() -> [Int] {
        var result: [Int] = []
        
        result.append(self.value)
        
        if let leftChild = leftChild {
            result += leftChild.inOrderTraversal()
        }
        
        if let rightChild = rightChild {
            result += rightChild.inOrderTraversal()
        }
        
        return result
    }
    
    
    func postOrderTraversal() -> [Int] {
        var result: [Int] = []
        
        if let leftChild = leftChild {
            result += leftChild.inOrderTraversal()
        }
        
        if let rightChild = rightChild {
            result += rightChild.inOrderTraversal()
        }
        
        result.append(self.value)
        
        return result
        
    }
    
    
    
    func minimum() -> Int {
        var node = self
        
        while let left = node.leftChild {
            node = left
        }
        
        return node.value
    }
    
    
    
    func maximum() -> Int {
        var node = self
        
        while let right = node.rightChild {
            node = right
        }
        
        return node.value
    }
    
}

let tree = Node(7)
tree.insert(value: 20)
tree.insert(value: 5)
tree.insert(value: 15)
tree.insert(value: 10)
tree.insert(value: 4)
tree.insert(value: 33)
tree.insert(value: 2)
tree.insert(value: 25)
tree.insert(value: 6)

/*
         7
    5        20
  4   6   15    33
 2                25
 */


/*
 results: 7
 
 queue: 5, 20
 
 results: 7,5
 queue: 20, 4, 6
 
 results: 7,5,20
 queue: 4, 6, 15, 33
 
 results: 7,5,20, 4
 queue: 6, 15, 33, 2
 
 results: 7,5,20, 4, 6
 queue: 15, 33, 2
 
 results: 7,5, 20 ,4, 6, 15
 queue: 33, 2
 
 results: 7,5,20,4,6,15,33
 queue: 2, 25
 
 results: 7,5,20,4,6,15,33, 2
 queue: 25
 
 results: 7, 5, 20, 4, 6, 15, 33, 2, 25
 */

dump(tree.breadthFirstTraversal())
//dump(breadthSearchResults)
//dump(tree.inOrderTraversal())

//dump(tree.preorderTraversal())
//dump(tree.postOrderTraversal())
// 2 , 3 , 6, 8, 13, 14, 20, 7



//func recursiveFunction(data: Int, spacing: String = "") {
//
//    print("\(spacing)\(data)")
//
//    if data < 5 {
//        return
//    }
//
//    recursiveFunction(data: data - 1, spacing: spacing + " ")
//}
//
//recursiveFunction(data: 10)
