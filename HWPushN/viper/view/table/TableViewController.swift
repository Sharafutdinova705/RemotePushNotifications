//
//  TableViewController.swift
//  HWPushN
//
//  Created by Гузель on 24/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewController: UITableViewController {

    var dataManager = DataManager()
    var notifications: [NotificationModel] = []
    let toDetail = "toDetail"
    let cellid = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let array = dataManager.obtainNotifications() ?? []
        
        array.forEach { notifications.insert($0, at: 0) }
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == toDetail, let notification = sender as? NotificationModel {
            
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.currentModel = notification
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! TableViewCell
        
        if let url = URL(string: notifications[indexPath.row].imageUrlString) {
            cell.photoImageView.sd_setImage(with: url, completed: nil)
        }
        
        cell.titleLabel.text = notifications[indexPath.row].title
        cell.descriptionLabel.text = notifications[indexPath.row].descriptionInfo
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: toDetail, sender: notifications[indexPath.row])
    }
}
