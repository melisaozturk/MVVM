//
//  MovieDetailViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    private let viewModel = MovieDetailViewModel()
    var id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIManager.shared().showLoading(view: self.view)
        self.viewModel.getMovieDetailData(id: self.id, completion: { [weak self] response in
            UIManager.shared().removeLoading(view: self!.view)
            if let _ = self {
                self!.lblTitle.text = self!.viewModel.movieDetailModel.title
                let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self!.viewModel.movieDetailModel.posterPath!)")
                self!.imgMovie.kf.setImage(with: url)
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                UIManager.shared().errorHandle(viewController: self!, message: "Bir hata oluştu.")
            }
        })
        
        UIManager.shared().showLoading(view: self.view)
        self.viewModel.getMovieCreditsData(id: self.id, completion: { [weak self] response in
            UIManager.shared().removeLoading(view: self!.view)
            if let _ = self {
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                UIManager.shared().errorHandle(viewController: self!, message: "Bir hata oluştu.")
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
