//
//  ShhowDetailViewController.swift
//  Demo
//
//  Created by melisa öztürk on 22.11.2020.
//
import UIKit
import Kingfisher

class ShowDetailViewController: UIViewController {
    
    enum PageSource {
        case movie
        case tv
    }
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    private let movieViewModel = MovieDetailViewModel()
    private let tvViewModel = TVDetailViewModel()
    var id: Int!
    var pageSource: PageSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch pageSource {
        case .movie:
            UIManager.shared().showLoading(view: self.view)
            self.movieViewModel.getMovieDetailData(id: self.id, completion: { [weak self] response in
                UIManager.shared().removeLoading(view: self!.view)
                if let _ = self {
                    self!.lblTitle.text = self!.movieViewModel.movieDetailModel.title
                    let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self!.movieViewModel.movieDetailModel.posterPath!)")
                    self!.imgMovie.kf.setImage(with: url)
                }
            }, completionHandler: { [weak self] error in
                if let _ = self {
                    UIManager.shared().errorHandle(viewController: self!, message: "Bir hata oluştu.")
                }
            })
            
            UIManager.shared().showLoading(view: self.view)
            self.movieViewModel.getMovieCreditsData(id: self.id, completion: { [weak self] response in
                UIManager.shared().removeLoading(view: self!.view)
                if let _ = self {
                }
            }, completionHandler: { [weak self] error in
                if let _ = self {
                    UIManager.shared().errorHandle(viewController: self!, message: "Bir hata oluştu.")
                }
            })
        case .tv:
            UIManager.shared().showLoading(view: self.view)
            self.tvViewModel.getTVDetailData(id: self.id, completion: { [weak self] response in
                UIManager.shared().removeLoading(view: self!.view)
                if let _ = self {
                    self!.lblTitle.text = self!.tvViewModel.tvDetailModel.name
                    let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self!.tvViewModel.tvDetailModel.posterPath!)")
                    self!.imgMovie.kf.setImage(with: url)
                }
            }, completionHandler: { [weak self] error in
                if let _ = self {
                    UIManager.shared().errorHandle(viewController: self!, message: "Bir hata oluştu.")
                }
            })
            
//            UIManager.shared().showLoading(view: self.view)
//            self.tvViewModel.getTVCreditsData(id: self.id, completion: { [weak self] response in
//                UIManager.shared().removeLoading(view: self!.view)
//                if let _ = self {
//                }
//            }, completionHandler: { [weak self] error in
//                if let _ = self {
//                    UIManager.shared().errorHandle(viewController: self!, message: "Bir hata oluştu.")
//                }
//            })
        default:
            break
        }
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
