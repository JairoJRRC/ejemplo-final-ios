//
//  DetailViewController.swift
//  BaseRestServices
//
//  Created by Sergio Sixi on 5/23/18.
//  Copyright © 2018 cibertec. All rights reserved.
//

import UIKit
import SDWebImage
import AVFoundation
import MagicalRecord

class DetailViewController: UIViewController {
    
    static var newsData: Dictionary<String, AnyObject>!

    @IBOutlet weak var nombreCancion: UILabel!
    @IBOutlet weak var explicidad: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var moneda: UILabel!
    @IBOutlet weak var pais: UILabel!
    @IBOutlet weak var nombreArtista: UILabel!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var numeroCancion: UILabel!
    @IBOutlet weak var urlImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nombreCancion = DetailViewController.newsData["trackName"] as! String
        let explicidad = DetailViewController.newsData["trackExplicitness"] as! String
        let fecha = DetailViewController.newsData["releaseDate"] as! String
        let genero = DetailViewController.newsData["primaryGenreName"] as! String
        let moneda = DetailViewController.newsData["currency"] as! String
        let pais = DetailViewController.newsData["country"] as! String
        let url = DetailViewController.newsData["artworkUrl100"] as! String
        let nombreArtista = DetailViewController.newsData["artistName"] as! String
        let precio = DetailViewController.newsData["trackPrice"] as! Double
        let numeroCancion = DetailViewController.newsData["trackNumber"] as! Int16
        
        self.urlImage.sd_setImage(with: URL(string: url as String!), completed: nil)
        self.nombreCancion.text = nombreCancion
        self.explicidad.text = explicidad
        self.fecha.text = fecha
        self.genero.text = genero
        self.moneda.text = moneda
        self.pais.text = pais
        self.nombreArtista.text = nombreArtista
        self.precio.text = String(precio)
        self.numeroCancion.text = String(numeroCancion)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func guardarNoticia(_ sender: Any){
        

        let nombreCancion = DetailViewController.newsData["trackName"] as! String
        let explicidad = DetailViewController.newsData["trackExplicitness"] as! String
        let fecha = DetailViewController.newsData["releaseDate"] as! String
        let genero = DetailViewController.newsData["primaryGenreName"] as! String
        let moneda = DetailViewController.newsData["currency"] as! String
        let pais = DetailViewController.newsData["country"] as! String
        let url = DetailViewController.newsData["artworkUrl100"] as! String
        let nombreArtista = DetailViewController.newsData["artistName"] as! String
        let precio = DetailViewController.newsData["trackPrice"] as! Double
        let numeroCancion = DetailViewController.newsData["trackNumber"] as! Int16
        
        let existenceSongs = DataBaseManager.sharedInstance.getGroupOfCancionesByKey(attribute: "artworkUrl100", value: url as! AnyObject)
        
        if existenceSongs.count > 0 {
            print("Ya compro la cancion")
            return
        }else{
            let new: Cancion = DataBaseManager.sharedInstance.createCancion()
            
            new.trackName = nombreCancion
            new.trackExplicitness = explicidad
            new.releaseDate = fecha
            new.primaryGenreName = genero
            new.currency = moneda
            new.country = pais
            new.artworkUrl100 = url
            new.artistName = nombreArtista
            new.trackPrice = Double(precio)
            new.trackNumber = Int16(numeroCancion)
            
            DataBaseManager.sharedInstance.saveCancionDatBaseChanges()
        }
        
        
    
        navigationController?.popViewController(animated: true)
    }
}
