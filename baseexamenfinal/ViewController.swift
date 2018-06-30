//
//  ViewController.swift
//  baseexamenfinal
//
//  Created by Francisco Jose Sanchez Bao on 6/13/18.
//  Copyright © 2018 cibertec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let API_URL:String = "http://itunes.apple.com/search?term=psy"
    
    @IBOutlet weak var tablaTableView: UITableView!
    var newsData:NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !NetworkManager.isConnectedToNetwork() {
            //Mensaje que no hay internet
            return
        }
        
        //let params : Dictionary<String,AnyObject> = ["pagina":"1" as AnyObject,"publicacionid":"1" as AnyObject]
        
        
        NetworkManager.sharedInstance.postUrlWithCompletion(url: API_URL, params: nil, completion: {
            (finished, response) in
            if finished {
                
                let results = response["results"] as! NSArray
                self.newsData = NSMutableArray(array: results)
                self.tablaTableView.reloadData()
                
            }else{
                //Deberia indicar al usuario que ha habido algun tipo de error en la conexion con el servidor
                
                
            }
            
            
        }, method: .get)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablaTableView.dequeueReusableCell(withIdentifier: "CeldaTableViewCell", for: indexPath) as! CeldaTableViewCell
        cell.cellData = self.newsData[indexPath.row] as! Dictionary<String,AnyObject>
        cell.initCell()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DetailViewController.newsData = self.newsData[indexPath.row] as! Dictionary<String,AnyObject>
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

