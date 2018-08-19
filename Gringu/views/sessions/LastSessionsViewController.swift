//
//  LastSessionsViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class LastSessionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var viewModel = LastSessionsViewModel()
  
  @IBAction func actionDismiss(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.sessions.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(100.0)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MySessionCell.identifier) as! MySessionCell
    cell.configure(viewModel.sessions[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    performSegue(withIdentifier: "toPhotos", sender: viewModel.sessions[indexPath.row].photos)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toPhotos",
      let vc = segue.destination as? PhotosFromSessionViewController {
      vc.photos = sender as! [GringuPhoto]
    }
  }
}
