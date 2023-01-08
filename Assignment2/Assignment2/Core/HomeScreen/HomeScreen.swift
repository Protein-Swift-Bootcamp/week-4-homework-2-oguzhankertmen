//
//  HomeScreen.swift
//  Assignment2
//
//  Created by Oğuzhan KERTMEN on 2.01.2023.
//

import UIKit

protocol HomeScreenInterface: AnyObject {
  func configureVC()
  func configureTableView()
  func reloadCollectionView()
  func navigateToDetailScreen(movie: Movie)
}

final class HomeScreen: UIViewController {

  private let viewModel = HomeViewModel()
  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      viewModel.view = self
      viewModel.viewDidLoad()
    }
}

extension HomeScreen: HomeScreenInterface {
  func configureVC() {
    view.backgroundColor = .systemBackground
    title = "Popular Movies"
  }
  
  func configureTableView() {
    view.addSubview(tableView)
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
  }
  
  func reloadCollectionView(){
    tableView.reloadOnMainThread()
  }
  
  func navigateToDetailScreen(movie: Movie) {
    DispatchQueue.main.async {
      let detailScreen = DetailScreen(movie: movie)
      self.navigationController?.pushViewController(detailScreen, animated: true)
    }
  }
}

extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.movies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
    cell.setCell(movie: viewModel.movies[indexPath.item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.movies.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.getMovieDetail(id: viewModel.movies[indexPath.item]._id)
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    let height = scrollView.frame.size.height
    
    if offsetY >= contentHeight - (2 * height) {
      viewModel.getMovies()
    }
  }
  
 
}


