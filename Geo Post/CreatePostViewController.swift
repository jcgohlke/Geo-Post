//
//  CreatePostViewController.swift
//  Geo Post
//
//  Created by Joben Gohlke on 9/9/21.
//

import UIKit

protocol CreatePostViewControllerDelegate {
  func postWasCreated(post: Post)
  func userCanceled()
}

class CreatePostViewController: UIViewController {
  
  @IBOutlet weak var postTextView: UITextView!
  @IBOutlet weak var includeLocationSwitch: UISwitch!
  @IBOutlet weak var createPostButton: UIButton!
  
  var delegate: CreatePostViewControllerDelegate
  
  init?(coder: NSCoder, delegate: CreatePostViewControllerDelegate) {
    self.delegate = delegate
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func switchFlipped(_ sender: Any) {
    if includeLocationSwitch.isOn {
      LocationService.shared.requestLocationAuthorization()
    }
  }
  
  @IBAction func createPost(_ sender: Any) {
    if includeLocationSwitch.isOn {
      LocationService.shared.getCurrentLocation { [weak self] coordinate in
        if let strongSelf = self {
          let post = Post(text: strongSelf.postTextView.text, author: "TBD", location: coordinate, date: Date())
          strongSelf.delegate.postWasCreated(post: post)
        }
      }
    } else {
      let post = Post(text: postTextView.text, author: "TBD", location: nil, date: Date())
      delegate.postWasCreated(post: post)
    }
  }
  
  @IBAction func cancel(_ sender: Any) {
    delegate.userCanceled()
  }
}
