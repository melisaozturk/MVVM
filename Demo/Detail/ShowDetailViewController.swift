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
    
    @IBOutlet weak private var imgMovie: UIImageView!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblRatingText: UILabel!
    @IBOutlet weak private var lblRating: UILabel!
    @IBOutlet weak private var lblPopularity: UILabel!
    @IBOutlet weak private var lblPopularityText: UILabel!
    @IBOutlet weak private var lblRuntime: UILabel!
    @IBOutlet weak private var lblRuntimeText: UILabel!
    @IBOutlet weak private var textViewOverview: UITextView!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    private let movieViewModel = MovieDetailViewModel()
    private let tvViewModel = TVDetailViewModel()
    var id: Int!
    var pageSource: PageSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCollection()
        self.setup()
        self.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func registerCollection() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CreditsCell", bundle: nil), forCellWithReuseIdentifier: "CreditsCell")
    }
    
    private func setup() {
        self.lblRatingText.text = "Rating"
        self.lblPopularityText.text = "Popularity"
        self.lblRuntimeText.text = "Runtime"
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
                        self!.imgMovie.contentMode = .scaleAspectFill
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
                    self!.collectionView.reloadData()
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
                    self!.imgMovie.contentMode = .scaleAspectFill
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
                UIManager.shared().removeLoading(view: self!.view)
                if let _ = self {
                    self!.collectionView.reloadData()
                }
            }, completionHandler: { _ in
            })
        default:
            break
        }
    }
}

extension ShowDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch pageSource {
        case .movie:
            if self.movieViewModel.movieCreditsModel != nil {
                return self.movieViewModel.movieCreditsModel.cast?.count ?? 0
            }
        case .tv:
            if self.tvViewModel.tvCreditsModel != nil {
                return self.tvViewModel.tvCreditsModel.cast?.count ?? 0
            }
        default:
            return 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreditsCell", for: indexPath) as! CreditsCell
        
        switch pageSource {
        case .movie:
            if let cast = self.movieViewModel.movieCreditsModel.cast {
                if let path = cast[indexPath.row].profilePath {
                    let url = URL(string: "http://image.tmdb.org/t/p/w500//\(path)")
                    cell.imgCast.kf.setImage(with: url)
                } else {
                    cell.imgCast.image = UIImage(named: "movie")
                }
                cell.lblCastName.text = cast[indexPath.row].character ?? ""
                cell.lblOriginalName.text = cast[indexPath.row].originalName ?? ""
            }
        case .tv:
            if let cast = self.tvViewModel.tvCreditsModel.cast {
                if let path = cast[indexPath.row].profilePath {
                    let url = URL(string: "http://image.tmdb.org/t/p/w500//\(path)")
                    cell.imgCast.kf.setImage(with: url)
                } else {
                    cell.imgCast.image = UIImage(named: "tv")
                }
                cell.lblCastName.text = cast[indexPath.row].character ?? ""
                cell.lblOriginalName.text = cast[indexPath.row].originalName ?? ""
            }
        default: return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width / 3, height: self.collectionView.frame.height)
    }
}
