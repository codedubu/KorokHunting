//
//  main.swift
//  sortReddit
//
//  Created by River McCaine on 8/15/22.
//

import Foundation

/// A common thing Reddit clients do is merge elements from different sources into a single view.
/// For example, we might want to include `Post` instances that a user has _saved_ and posts that a user has _upvoted_ in the same list
struct Post {
  var upvotes: Int
}

class CombinedListing {
  // provided by the backend; guaranteed to be in descending-upvote-order
  let upvotedPosts: [Post]
  // provided by the backend; guaranteed to be in descending-upvote-order
  let savedPosts: [Post]
  
  init(upvotedPosts: [Post], savedPosts: [Post]) {
    self.upvotedPosts = upvotedPosts
    self.savedPosts = savedPosts
  }
  
  // include both arrays, following the same precondition; this should be in descending-upvote-order
  func orderedPosts() -> [Post] {
    []
  }
}

// build out some mock posts to test this
let upvoted = stride(from: 0, to: 10, by: 3).reversed().map(Post.init) // 9, 6, 3, 0
let saved = stride(from: 4, to: 10, by: 2).reversed().map(Post.init) // 8, 6, 4
let listing = CombinedListing(upvotedPosts: upvoted, savedPosts: saved)

let ordered = listing.orderedPosts()
ordered.count == upvoted.count + saved.count ? print("pass") : print("fail")
ordered.map(\.upvotes) == [9, 8, 6, 6, 4, 3, 0] ?  print("pass") : print("fail")
