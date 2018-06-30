//
//  FavDetailViewController.swift
//  baseexamenfinal
//
//  Created by DAMII on 13/06/18.
//  Copyright © 2018 cibertec. All rights reserved.
//

import UIKit
import SDWebImage
class FavDetailViewController: UIViewController {
    
    static var data: Cancion!

    @IBOutlet weak var urlImage: UIImageView!
    @IBOutlet weak var nombreCancion: UILabel!
    @IBOutlet weak var explicidad: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var moneda: UILabel!
    @IBOutlet weak var pais: UILabel!
    @IBOutlet weak var nombreArtista: UILabel!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var numeroCancion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        urlImage.sd_setImage(with: URL(string: FavDetailViewController.data.artworkUrl100 as String!), completed: nil)
        nombreCancion.text = FavDetailViewController.data.trackName as String!
        explicidad.text = FavDetailViewController.data.trackExplicitness as String!
        fecha.text = FavDetailViewController.data.releaseDate as String!
        genero.text = FavDetailViewController.data.primaryGenreName as String!
        moneda.text = FavDetailViewController.data.currency as String!
        pais.text = FavDetailViewController.data.country as String!
        nombreArtista.text = FavDetailViewController.data.artistName as String!
        precio.text = String(FavDetailViewController.data.trackPrice)
        numeroCancion.text = String(FavDetailViewController.data.trackNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteFav(_ sender: Any) {
        DataBaseManager.sharedInstance.deleteCancion(a: FavDetailViewController.data as Cancion!)
        navigationController?.popToRootViewController(animated: true)
    }
    
    

}
