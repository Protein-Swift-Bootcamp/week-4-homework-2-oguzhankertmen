//
//  UITableView+Extension.swift
//  Assignment2
//
//  Created by Oğuzhan KERTMEN on 8.01.2023.
//

import UIKit

extension UITableView {
  func reloadOnMainThread() {
    DispatchQueue.main.async {
      self.reloadData()
    }
  }
}
