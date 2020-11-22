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
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var lblRuntime: UILabel!
    @IBOutlet weak var textViewOverview: UITextView!
    
    private let movieViewModel = MovieDetailViewModel()
    private let tvViewModel = TVDetailViewModel()
    var id: Int!
    var pageSource: PageSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func getData() {
        switch pageSource {
        case .movie:
            self.movieViewModel.getMovieDetailData(id: self.id, completion: { [weak self] response in
                UIManager.shared().removeLoading(view: self!.view)
                if let _ = self {
                    if let movieDetailModel = self!.movieViewModel.movieDetailModel {
                        let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self!.movieViewModel.movieDetailModel.posterPath!)")
                        self!.imgMovie.kf.setImage(with: url)
                        self!.lblTitle.text = movieDetailModel.title
                        self!.lblRating.text = String(movieDetailModel.voteAverage ?? 0)
                        self!.lblPopularity.text = String(movieDetailModel.voteCount ?? 0)
                        self!.lblRuntime.text = String(movieDetailModel.runtime ?? 0) + "min"
                        self!.textViewOverview.text = movieDetailModel.overview ?? ""
                    }
                }
            }, completionHandler: { [weak self] error in
                if let _ = self {
                    UIManager.shared().errorHandle(viewController: self!, message: "Bir hata oluştu.")
                }
            })
            
            UIManager.shared().showLoading(view: self.view)
            self.movieViewModel.getMovieCreditsData(id: self.id, completion: { [weak self] response in
                if let _ = self {
                    UIManager.shared().removeLoading(view: self!.view)
                }
            }, completionHandler: { _ in
            })
        case .tv:
            UIManager.shared().showLoading(view: self.view)
            self.tvViewModel.getTVDetailData(id: self.id, completion: { [weak self] response in
                UIManager.shared().removeLoading(view: self!.view)
                if let _ = self {
                    let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self!.tvViewModel.tvDetailModel.posterPath!)")
                    self!.imgMovie.kf.setImage(with: url)
                    self!.lblTitle.text = self!.tvViewModel.tvDetailModel.name
                    self!.lblRating.text = String(self!.tvViewModel.tvDetailModel.voteAverage ?? 0)
                    self!.lblPopularity.text = String(self!.tvViewModel.tvDetailModel.voteCount ?? 0)
                    self!.lblRuntime.text = String(self!.tvViewModel.tvDetailModel.episodeRunTime?[0] ?? 0) + "min"
                    self!.textViewOverview.text = self!.tvViewModel.tvDetailModel.overview ?? ""
                }
            }, completionHandler: { [weak self] error in
                if let _ = self {
                    UIManager.shared().errorHandle(viewController: self!, message: "Bir hata oluştu.")
                }
            })
            
            UIManager.shared().showLoading(view: self.view)
            self.tvViewModel.getTVCreditsData(id: self.id, completion: { [weak self] response in
                if let _ = self {
                    UIManager.shared().removeLoading(view: self!.view)
                }
            }, completionHandler: { _ in
            })
        default:
            break
        }
    }
}
