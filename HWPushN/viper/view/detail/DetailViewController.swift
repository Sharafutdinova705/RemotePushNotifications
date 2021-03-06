//
//  DetailViewController.swift
//  HWPushN
//
//  Created by Гузель on 23/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var currentModel: NotificationModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initItems()
    }
    
    func initItems() {
        
        guard let model = currentModel else { return }
            
        titleLabel.text = model.title
        descriptionLabel.text = model.descriptionInfo
        
        if let url = URL(string: model.imageUrlString) {
            
            self.photoImageView.sd_setImage(with: url, completed: nil)
        }
    }
}

