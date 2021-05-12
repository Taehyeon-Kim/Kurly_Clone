//
//  RecipeViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var dataManager: RecipeDataManager = RecipeDataManager()
    var recipes: [RecipeResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dismissKeyboard()
        dataManager.getRecipe(delegate: self)
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}

// MARK: - Custom Function
extension RecipeViewController {
    
    // 데이터 담기
    func getRecipe(result: [RecipeResult]) {
        self.recipes = result
        collectionView.reloadData()
    }
    
    // 컬렉션 뷰 셋업
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.backgroundColor = .clear
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: 308, height: 241)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - Collection View Delegate
extension RecipeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)번째 셀 클릭")
        let detailViewController = UIStoryboard(name: "DetailStoryboard", bundle: nil)
            .instantiateViewController(identifier: "DetailViewController")
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - Collection View DataSource
extension RecipeViewController: UICollectionViewDataSource {
    
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    // 가져올 셀
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCVC.identifier,
                                                            for: indexPath) as? RecipeCVC else {
            return UICollectionViewCell()
        }
        
        let recipes = self.recipes?[indexPath.row]
        
        let url = URL(string: recipes?.image ?? "")
        cell.image.kf.setImage(with: url)
        
        // 상품 이름
        if let recipeTitle = recipes?.recipeTitle {
            cell.recipeName.text = recipeTitle
        }
        cell.backgroundColor = .clear
        return cell
    }
}


