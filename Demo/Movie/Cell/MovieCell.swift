//
//  MovieCell.swift
//  Demo
//
//  Created by melisa öztürk on 21.11.2020.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    enum PageSource {
        case topRated
        case nowPlaying
        case popular
    }
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pageSource: PageSource!
    var topRatedModel: MovieTopRatedModel!
    var nowPlayingModel: MovieNowPlayingModel!
    var popularModel: MoviePopularModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionRegister()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }    
    
    private func collectionRegister() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "InternalMovieCell", bundle: nil), forCellWithReuseIdentifier: "InternalMovieCell")
    }
}

extension MovieCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            if self.topRatedModel != nil {
                return self.topRatedModel.results.count
            }
        case 1:
            if self.nowPlayingModel != nil {
                return self.nowPlayingModel.results.count
            }
        case 2:
            if self.popularModel != nil {
                return self.popularModel.results.count
            }
        default:
            return 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InternalMovieCell", for: indexPath) as! InternalMovieCell
     
        switch indexPath.section {
        case 1: //TODO
            cell.lblTitleShow.text = self.topRatedModel.results[indexPath.row].title
            let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self.topRatedModel.results[indexPath.row].posterPath)")
            cell.imgShow.kf.setImage(with: url)
            break
        case 2:
            cell.lblTitleShow.text = self.nowPlayingModel.results[indexPath.row].title
            let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self.nowPlayingModel.results[indexPath.row].posterPath)")
            cell.imgShow.kf.setImage(with: url)
            break
        case 3:
            cell.lblTitleShow.text = self.popularModel.results[indexPath.row].title
            let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self.popularModel.results[indexPath.row].posterPath)")
            cell.imgShow.kf.setImage(with: url)
            break
        default:
            break
        }
        return cell
    }
    //        TODO : GOTO Detail
    //        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //            NotificationCenter.default.post(name: Notification.Name(rawValue: "CellSelect"), object: nil, userInfo: ["SelectedCell": indexPath.row])
    //        }
}

extension MovieCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width / 3, height: self.collectionView.frame.height)
    }
}
