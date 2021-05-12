//
//  WeekEventViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/26.
//

import UIKit
import Kingfisher

class WeekEventViewController: UIViewController {
    
    let imageUrl = [
    "https://img-cf.kurly.com/shop/data/m/event/0381000f4edfd23c34d7d7d9cfb0de68.jpg",
    "https://img-cf.kurly.com/shop/data/m/event/0f1fa0ad14df780171dbcf590d8e80fa.jpg",
        "https://img-cf.kurly.com/shop/data/m/event/74f920f98ab7b4fe7432c3eb8ec0276c.jpg",
        "https://img-cf.kurly.com/shop/data/m/event/ae05a62457c26bedc0eb58ac093dbf4e.jpg",
        "https://img-cf.kurly.com/shop/data/m/event/29dd1a869a3c5393bcec9d9867c10cbf.jpg",
        "https://img-cf.kurly.com/shop/data/m/event/cdb2f231a6c518f70bc9d2b7f33e179a.jpg",
        "https://img-cf.kurly.com/shop/data/m/event/ae45e2a6c805925e43bc2a6651949781.jpg",
        "https://img-cf.kurly.com/shop/data/m/event/3e2abf92a4b9d5de791eda0c10d69f5f.jpg"
    ]
    
    @IBOutlet var events: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<events.count {
            let url = URL(string: imageUrl[i])
            events[i].contentMode = .scaleAspectFill
            events[i].kf.setImage(with: url)
        }
    }
    

    
    
}
