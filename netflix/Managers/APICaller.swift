//
//  APICaller.swift
//  netflix
//
//  Created by halil yılmaz on 3.05.2022.
//

import Foundation

struct Constants{
    static let apikey = "52a47b8ce5caacbec8d06c733f32e446"
    static let baseUrl = "https://api.themoviedb.org"
    static let youtube_apiKey = "AIzaSyAxt_LQhTcKB_Qszoxnk8oF_UUQn_ea3Vc"
    static let youtube_baseUrl = "https://youtube.googleapis.com/youtube/v3/search?"
}
enum APIError: Error{
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.apikey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getTV(completion: @escaping (Swift.Result<[Title],Error>)->Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.apikey)") else {return}
                let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                    guard let data = data, error == nil else {
                        return
                    }

                    do {
                        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                        completion(.success(results.results))
                    }
                    catch {
                        completion(.failure(APIError.failedToGetData))
                    }
                }
                
        task.resume()
    }
    
    
    
    func getUpcoming(completion: @escaping (Swift.Result<[Title],Error>)->Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.apikey)&language=en-US&page=1") else {return}
                let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                    guard let data = data, error == nil else {
                        return
                    }
                    
                    do {
                        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                        completion(.success(results.results))
                    } catch {
                        print(error.localizedDescription)
                    }

                }
                task.resume()
    }
    
    
    
    
    
    func getPopular(completion: @escaping (Swift.Result<[Title],Error>)->Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.apikey)&language=en-US&page=1") else {return}
                let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                    guard let data = data, error == nil else {
                        return
                    }
                    
                    do {
                        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                        completion(.success(results.results))
                    } catch {
                        completion(.failure(APIError.failedToGetData))
                    }
                }
                
                task.resume()
    }

    
    func getTopRated(completion: @escaping (Swift.Result<[Title],Error>)->Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.apikey)&language=en-US&page=1") else {return }
                let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                    guard let data = data, error == nil else {
                        return
                    }
                    
                    do {
                        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                        completion(.success(results.results))

                    } catch {
                        completion(.failure(APIError.failedToGetData))
                    }

                }
                task.resume()
    }
    
    func getDiscover(completion: @escaping (Result<[Title],Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.apikey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate")else {return }
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                    } catch {
                        completion(.failure(APIError.failedToGetData))
                    }
                }
            task.resume()
        
    }
    
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.baseUrl)/3/search/movie?api_key=\(Constants.apikey)&query=\(query)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    
    func getMovie(with query: String,completion: @escaping (Result<VideoElement, Error>) -> Void){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.youtube_baseUrl)q=\(query)&key=\(Constants.youtube_apiKey)") else {
           return
       }
       let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
           guard let data = data, error == nil else {
               return
           }
           do {
            let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
       }
       task.resume()
    }
}
