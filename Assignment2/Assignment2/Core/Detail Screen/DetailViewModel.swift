//
//  DetailViewModel.swift
//  Assignment2
//
//  Created by Oğuzhan KERTMEN on 8.01.2023.
//

import Foundation

protocol DetailViewModelInterface {
  var view: DetailScreenInterface? { get set }
  func viewDidLoad()
  func getPosterImage(movie: Movie)
}

final class DetailViewModel {
  private var dataTask: URLSessionDataTask?
  weak var view: DetailScreenInterface?
  var didPosterImageLoad: ((Data) ->())?
}

extension DetailViewModel: DetailViewModelInterface {
  
  func viewDidLoad() {
    view?.configureVC()
    view?.configurePosterImageView()
  }
  
  func getPosterImage(movie: Movie) {
    guard let url = URL(string: APIURLs.imageURL(posterPath: movie._posterPath)) else { return }
    
    NetworkManager.shared.download(url: url) { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success(let data):
        (self.didPosterImageLoad!)(data)
      case .failure(_):
        break
      }
    }
    dataTask?.resume()
  }
}
