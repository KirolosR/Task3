//
//  ViewController.swift
//  Task3
//
//  Created by Kirolos on 4/13/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var brandSpinner: UIActivityIndicatorView!
    @IBOutlet weak var bestSpinner: UIActivityIndicatorView!
    @IBOutlet weak var bestSellerCol: UICollectionView!
    @IBOutlet weak var brandsCol: UICollectionView!
    
    
    var bestseller :[BestSeller] = []
    var brands : [Brand] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bestSpinner.isHidden = false
        bestSpinner.startAnimating()
        brandSpinner.isHidden = false
        brandSpinner.startAnimating()
        
        bestSellerCol.delegate = self
        bestSellerCol.dataSource = self
        
        brandsCol.delegate = self
        brandsCol.dataSource = self
        
        
        let width = view.bounds.width / 2
        let bestlayout = bestSellerCol.collectionViewLayout as! UICollectionViewFlowLayout
        bestlayout.itemSize = CGSize(width: width, height: width)
        
        let brandlayout = brandsCol.collectionViewLayout as! UICollectionViewFlowLayout
        
        loadBestSeller()
        loadBrands()
    }

 
    
    func loadBestSeller(){
        // DispatchQueue.main.async{
            GetData.instance.getBestSeller(Url: BEST_SELLER_URL) { (success) in
                if(success)
                {
                    debugPrint("Success!")
                    self.bestseller = GetData.bestSeller!
                    self.bestSellerCol.reloadData()
                    self.bestSpinner.isHidden = true
                    self.bestSpinner.stopAnimating()
                }
            }
       //  DispatchQueue.main.async(execute: self.finishThread)
       // }
        
    }
    
    func finishThread(){
       
      //  self.bestSellerCol.reloadData()
    }
    
    
    func loadBrands(){
       //  DispatchQueue.main.async{
            GetData.instance.getBrands(Url: BRANDS_URL) { (success) in
                if(success)
                {
                    debugPrint("Success!")
                    self.brands = GetData.brands!
                    self.brandsCol.reloadData()
                    self.brandSpinner.isHidden = true
                    self.brandSpinner.stopAnimating()
                }
            }
         //   DispatchQueue.main.async(execute: self.finishThread1)
       // }
       
    }
    
    func finishThread1(){
        
        self.brandsCol.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfSection section: Int) -> Int {
        if collectionView == bestSellerCol
        {
            return 1
        }
        else if collectionView == brandsCol
        {
            return 1
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bestSellerCol
        {
            return bestseller.count
        }
        else if collectionView == brandsCol
        {
            return brands.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == bestSellerCol ,
        
           let cell = bestSellerCol.dequeueReusableCell(withReuseIdentifier: "BestSeller", for: indexPath) as? BestSellerCell {
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 0.3
            let url = URL(string: self.bestseller[indexPath.item].Photo ?? "")
            
            cell.bestSellerImage.kf.setImage(with: url ,  placeholder : UIImage(named: "product_photo"))
            let title = self.bestseller[indexPath.item].TitleEN ?? ""
            let price = self.bestseller[indexPath.item].Price ?? ""
            let symbol = self.bestseller[indexPath.item].SymbolEN ?? ""
            cell.title.text =  title
            cell.price.text = "\(price) \(symbol)"
            return cell
        }
        
        else if collectionView == brandsCol ,
            let cell = brandsCol.dequeueReusableCell(withReuseIdentifier: "Brands", for: indexPath) as? Brands {
            
            let url = URL(string: self.brands[indexPath.item].Photo ?? "")
            
            cell.brandImage.kf.setImage(with: url ,  placeholder : UIImage(named: "brand_photo"))
            
            return cell
        }
        
        
        return UICollectionViewCell()
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bestSellerCol {
      //  let padding: CGFloat =  10
         let collectionViewWidth = (bestSellerCol.bounds.width - 40) / 2
         let collectionViewHeight = (bestSellerCol.bounds.height - 40) / 2

        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
        }
        else
        {
            let collectionViewSize = collectionView.frame.size.width / 3
            return CGSize(width: collectionViewSize , height: 150)
        }
    }

}

