//
//  MovieCell.swift
//  Demo
//
//  Created by melisa öztürk on 21.11.2020.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
//    enum PageSource {
//        case topRated
//        case nowPlaying
//        case popular
//    }
//
    @IBOutlet weak var lblTitle: UILabel!
    
//    var pageSource: PageSource!
//    var topRatedModel: MovieTopRatedModel!
//    var nowPlayingModel: MovieNowPlayingModel!
//    var popularModel: MoviePopularModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
//    cell.lblTitleShow.text = self.topRatedModel.results[indexPath.row].title
//    let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self.topRatedModel.results[indexPath.row].posterPath)")
//    cell.imgShow.kf.setImage(with: url)
}
