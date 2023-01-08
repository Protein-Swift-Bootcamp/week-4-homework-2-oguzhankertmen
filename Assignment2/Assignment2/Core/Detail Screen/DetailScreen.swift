//
//  DetailScreen.swift
//  Assignment2
//
//  Created by Oğuzhan KERTMEN on 8.01.2023.
//

import UIKit

protocol DetailScreenInterface: AnyObject {
  func configureVC()
  func configurePosterImageView()
}

final class DetailScreen: UIViewController {
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var movieNameLabel: UILabel!
  private let movie: Movie
  private let viewModel = DetailViewModel()
  private let padding: CGFloat = 16
  
  init(movie: Movie) {
    self.movie = movie
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    override func viewDidLoad() {
      super.viewDidLoad()
      viewModel.view = self
      viewModel.viewDidLoad()
      viewModel.getPosterImage(movie: movie)
    }

}

extension DetailScreen: DetailScreenInterface {
  
  func configureVC() {
    view.backgroundColor = .systemBackground
  }
  
  func configurePosterImageView() {
    <#code#>
  }
}
