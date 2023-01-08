//
//  MovieCell.swift
//  Assignment2
//
//  Created by Oğuzhan KERTMEN on 8.01.2023.
//

import UIKit

final class MovieCell: UITableViewCell {
  static let reuseID = "MovieCell"
  var viewModel: DetailViewModel?
  
  
  @IBOutlet weak var posterImageView: UIImageView!
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureCell()
    configurePosterImageView()
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setCell(movie: Movie){
    viewModel?.getPosterImage(movie: movie)
  }
  
  private func configureCell() {
    backgroundColor = .systemGray5
    layer.cornerRadius = 16
    clipsToBounds = true
  }
  
  private func configurePosterImageView() {
    addSubview(posterImageView)
  }
}
