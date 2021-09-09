//
//  PostsTableViewController.swift
//  Geo Post
//
//  Created by Joben Gohlke on 9/7/21.
//

import UIKit
import CoreLocation

class PostsTableViewController: UITableViewController {
  
  var posts: [Post] = [
    Post(
      text: "This is an example post.",
      author: "Ben",
      location: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0),
      date: Date()
    ),
    Post(
      text: "This is an example post. This is an example post. This is an example post.",
      author: "Sergio",
      location: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0),
      date: Date()
    ),
    Post(
      text: "This is an example post. This is an example post.",
      author: "Rick",
      location: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0),
      date: Date()
    )
  ]
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
    
    cell.configure(with: posts[indexPath.row])
    
    return cell
  }
  
  // MARK: - Navigation
  
  @IBSegueAction
  func makeCreatePostController(coder: NSCoder) -> UIViewController? {
    CreatePostViewController(coder: coder, delegate: self)
  }
}

extension PostsTableViewController: CreatePostViewControllerDelegate {
  func postWasCreated(post: Post) {
    self.dismiss(animated: true, completion: nil)
    posts.insert(post, at: 0)
    tableView.reloadData()
  }
  
  func userCanceled() {
    self.dismiss(animated: true, completion: nil)
  }
}
