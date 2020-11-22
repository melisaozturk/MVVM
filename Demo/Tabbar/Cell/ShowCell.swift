//
//  ShowCell.swift
//  Demo
//
//  Created by melisa öztürk on 21.11.2020.
//

import Foundation
import UIKit

class ShowCell: UITableViewCell {
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var imgShow: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblVoteAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func setupCell() {
        self.viewContent.layer.borderWidth = 1.0
        self.viewContent.layer.borderColor = UIColor.black.cgColor
        self.viewContent.layer.cornerRadius = 4.0
    }
}
