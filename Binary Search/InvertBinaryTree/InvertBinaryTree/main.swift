//
//  main.swift
//  InvertBinaryTree
//
//  Created by River McCaine on 8/15/22.
//

import Foundation

print("Hello, World!")

/*
 // https://leetcode.com/problems/invert-binary-tree/
 
 Given the root of a binary tree, invert the tree, and return its root.
 
 Examples:
 
 Input: root = [4,2,7,1,3,6,9]
 Output: [4,7,2,9,6,3,1]
 
 Input: root = [2,1,3]
 Output: [2,3,1]
 
 Input: root = []
 Output: []
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    (root.left, root.right) = (invertTree(root.right), invertTree(root.left))
    
    return root
}

//print(TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7, TreeNode(6), TreeNode(9))))

print(invertTree(TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7, TreeNode(6), TreeNode(9)))))
