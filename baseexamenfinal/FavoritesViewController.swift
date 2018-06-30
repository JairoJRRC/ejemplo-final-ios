 //
//  FavoritesViewController.swift
//  baseexamenfinal
//
//  Created by DAMII on 13/06/18.
//  Copyright © 2018 cibertec. All rights reserved.
//

import UIKit
import SDWebImage

class FavoritesViewController: UIViewController {
    
    var songsData: NSMutableArray = []

    @IBOutlet weak var favCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let songs: NSArray = DataBaseManager.sharedInstance.getCancionArray()
        
        self.songsData = NSMutableArray(array: songs)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func deleteAllNews(_ sender: UIButton) {
        DataBaseManager.sharedInstance.deleteCancionTable()
        navigationController?.popViewController(animated: true)
    }
    
}

extension FavoritesViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favCollectionView.dequeueReusableCell(withReuseIdentifier: "FavCollectionViewCell", for: indexPath) as! FavCollectionViewCell
        
        let songSelected = self.songsData[indexPath.row] as! Cancion
        cell.favImageImageView.sd_setImage(with: URL(string: songSelected.artworkUrl100 as String!), completed: nil)
        cell.favTitleLabel.text = songSelected.trackName as String!
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = self.songsData[indexPath.row] as! Cancion
        FavDetailViewController.data = data
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FavDetailViewController") as! FavDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
