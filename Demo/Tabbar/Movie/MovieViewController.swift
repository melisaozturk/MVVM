//
//  MovieTopRatedViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit
import Kingfisher

class MovieViewController: UIViewController {
    
    @IBOutlet weak private var segmentedControl: UISegmentedControl!
    @IBOutlet weak private var tableView: UITableView!
    
    private let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTable()
        self.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func registerTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.separatorStyle = .none
        
        self.tableView.register(UINib(nibName: "ShowCell", bundle: nil), forCellReuseIdentifier: "ShowCell")
    }
    
//     MARK: Service Call
    private func getData() {
        UIManager.shared().showLoading(view: self.view)
        self.viewModel.getTopRatedData(completion: { [weak self] response in
            UIManager.shared().removeLoading(view: self!.view)
            if let _ = self {
                self!.tableView.reloadData()
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                UIManager.shared().tabbarErrorHandle(viewController: self!, message: "Bir hata oluştu.")
            }
        })
        
        UIManager.shared().showLoading(view: self.view)
        self.viewModel.getNowPlayingData(completion: { [weak self] response in
            UIManager.shared().removeLoading(view: self!.view)
            if let _ = self {
                self!.tableView.reloadData()
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                UIManager.shared().tabbarErrorHandle(viewController: self!, message: "Bir hata oluştu.")
            }
        })
        
        UIManager.shared().showLoading(view: self.view)
        self.viewModel.getPopularData(completion: { [weak self] response in
            UIManager.shared().removeLoading(view: self!.view)
            if let _ = self {
                self!.tableView.reloadData()
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                UIManager.shared().tabbarErrorHandle(viewController: self!, message: "Bir hata oluştu.")
            }
        })
    }
    
    @IBAction func actionSegmentedControl(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.tableView.reloadData()
        case 1:
            self.tableView.reloadData()
        case 2:
            self.tableView.reloadData()
        default: break
        }
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            if self.viewModel.topRatedModel != nil {
                return self.viewModel.topRatedModel.results.count
            }
        case 1:
            if self.viewModel.nowPlayingModel != nil {
                return self.viewModel.nowPlayingModel.results.count
            }
        case 2:
            if self.viewModel.popularModel != nil {
                return self.viewModel.popularModel.results.count
            }
        default:
            return 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowCell
        cell.selectionStyle = .none
        
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self.viewModel.topRatedModel.results[indexPath.row].posterPath)")
            cell.imgShow.kf.setImage(with: url)
            cell.lblTitle.text = self.viewModel.topRatedModel.results[indexPath.row].title ?? ""
            cell.lblReleaseDate.text = self.viewModel.topRatedModel.results[indexPath.row].releaseDate ?? ""
            cell.lblVoteAverage.text = String(self.viewModel.topRatedModel.results[indexPath.row].voteAverage ?? 0.0)
            break
        case 1:
            let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self.viewModel.nowPlayingModel.results[indexPath.row].posterPath)")
            cell.imgShow.kf.setImage(with: url)
            cell.lblTitle.text = self.viewModel.nowPlayingModel.results[indexPath.row].title ?? ""
            cell.lblReleaseDate.text = self.viewModel.nowPlayingModel.results[indexPath.row].releaseDate ?? ""
            cell.lblVoteAverage.text = String(self.viewModel.nowPlayingModel.results[indexPath.row].voteAverage ?? 0.0)
        case 2:
            let url = URL(string: "http://image.tmdb.org/t/p/w500//\(self.viewModel.popularModel.results[indexPath.row].posterPath)")
            cell.imgShow.kf.setImage(with: url)
            cell.lblTitle.text = self.viewModel.popularModel.results[indexPath.row].title ?? ""
            cell.lblReleaseDate.text = self.viewModel.popularModel.results[indexPath.row].releaseDate ?? ""
            cell.lblVoteAverage.text = String(self.viewModel.popularModel.results[indexPath.row].voteAverage ?? 0.0)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var id: Int!
        
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            id = self.viewModel.topRatedModel.results[indexPath.row].id
            break
        case 1:
            id = self.viewModel.nowPlayingModel.results[indexPath.row].id
        case 2:
            id = self.viewModel.popularModel.results[indexPath.row].id
        default:
            break
        }
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowDetailViewController") as? ShowDetailViewController {
            viewController.id = id
            viewController.pageSource = .movie
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200        
    }
}
