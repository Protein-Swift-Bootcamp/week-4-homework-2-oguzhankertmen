//
//  MovieService.swift
//  Assignment2
//
//  Created by Oğuzhan KERTMEN on 8.01.2023.
//

import Foundation

final class MovieService {
  func downloadMovies(page: Int, completion: @escaping ([Movie]?) -> ()) {
    guard let url = URL(string: APIURLs.movies(page: page )) else { return }
    
    NetworkManager.shared.download(url: url) { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success(let data):
        completion(self.handleWithData(data))
      case .failure(let error):
        self.handleWithError(error)
      }
    }
  }
  
  func downloadMovieDetail(id: Int, completion: @escaping (Movie?) -> ()) {
    guard let url = URL(string: APIURLs.movieDetail(id: id)) else { return }
    
    NetworkManager.shared.download(url: url) { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success(let data):
        completion(self.handleWithData(data))
      case .failure(let error):
        self.handleWithError(error)
        
      }
    }
  }
  
  private func handleWithError(_ error: Error) {
    print(error.localizedDescription)
  }
  
  private func handleWithData(_ data: Data) -> [Movie]? {
    do {
      let movie = try JSONDecoder().decode(MovieResult.self, from: data)
      return movie.results
    }
    catch {
      print(error)
      return nil
    }
  }
  
  private func handleWithData(_ data: Data) -> Movie? {
    do {
      let movieDetail = try JSONDecoder().decode(Movie.self, from: data)
      return movieDetail
    } catch {
      print(error)
      return nil
    }
  }
}
