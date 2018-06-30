//
//  CeldaTableViewCell.swift
//  BaseRestServices
//
//  Created by Sergio Sixi on 5/23/18.
//  Copyright © 2018 cibertec. All rights reserved.
//

import UIKit
import SDWebImage
class CeldaTableViewCell: UITableViewCell {
    
    var cellData: Dictionary<String, AnyObject>!
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initCell(){
        let imageUrlString = cellData["artworkUrl100"] as! String
        self.photoImage.sd_setImage(with: URL(string: imageUrlString), completed: nil)
        self.titleLabel.text = (cellData["releaseDate"] as! String)
    }

}
