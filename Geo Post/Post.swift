//
//  Post.swift
//  Geo Post
//
//  Created by Joben Gohlke on 9/9/21.
//

import Foundation
import CoreLocation

struct Post {
  let text: String
  let author: String
  let location: CLLocationCoordinate2D?
  let date: Date
  
  var locationDescription: String {
    if let location = location {
      return "\(location.latitude), \(location.longitude)"
    } else {
      return ""
    }
  }
}
