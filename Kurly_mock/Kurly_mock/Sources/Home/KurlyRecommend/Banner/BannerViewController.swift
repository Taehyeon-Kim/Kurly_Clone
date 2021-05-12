//
//  BannerViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit

class BannerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    var nowPage: Int = 0
    let bannerImageArray: Array<UIImage> = [
        UIImage(named: "banner01")!,
        UIImage(named: "banner02")!,
        UIImage(named: "banner03")!,
        UIImage(named: "banner04")!,
        UIImage(named: "banner05")!,
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
}

// MARK: - Custom Function
extension BannerViewController {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension BannerViewController: UICollectionViewDelegate {
    
}

extension BannerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCVC.identifier, for: indexPath) as! BannerCVC
        cell.imageView.image = bannerImageArray[indexPath.row]
        return cell
    }
}

extension BannerViewController: UICollectionViewDelegateFlowLayout {
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width  , height:  collectionView.frame.height)
    }
}
