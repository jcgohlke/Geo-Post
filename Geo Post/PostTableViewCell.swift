//
//  PostTableViewCell.swift
//  Geo Post
//
//  Created by Joben Gohlke on 9/7/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  static var dateFormatter: DateFormatter {
    let df = DateFormatter()
    df.dateStyle = .short
    df.timeStyle = .short
    return df
  }
  
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  
  func configure(with post: Post) {
    label.text = post.text
    dateLabel.text = PostTableViewCell.dateFormatter.string(from: post.date)
    locationLabel.text = post.locationDescription
  }
}
