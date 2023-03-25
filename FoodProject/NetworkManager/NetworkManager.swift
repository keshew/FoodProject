import UIKit
// https://api.spoonacular.com/recipes/716429/information?apiKey=29b6b28f28904fc3a4946eed49a5833b& 1 recept
// my api key 29b6b28f28904fc3a4946eed49a5833b
// https://api.spoonacular.com/recipes/random?number=20&apiKey=29b6b28f28904fc3a4946eed49a5833b& mnogo recept

//https://api.spoonacular.com/recipes/complexSearch?type=soup&apiKey=29b6b28f28904fc3a4946eed49a5833b& салаты


protocol NetworkManagerProtocol: AnyObject {
    func getFood(completion: @escaping (Result<Food, Error>) -> Void)
    func getSalad(completion: @escaping (Result<Salad, Error>) -> Void)
    func getSoup(completion: @escaping (Result<Salad, Error>) -> Void)
    func getCurrentRecept(id: Int, completion: @escaping (Result<Recipe, Error>) -> Void)
    func getGeneric(path: URLRequest, completion: @escaping (Result<Salad, Error>) -> Void)
}

enum APIType {
    case getAllRecipe
    case getSalad
    case getSecond
    case getSoup
    case getSnack
    case getBread
    case getSous
    case getDrinks
    case getDesserts
    
    var apiKey: String {
        return "e5ddc77dc83842aba66108fb0ca9d2d2"
    }
    //29b6b28f28904fc3a4946eed49a5833b
    //e5ddc77dc83842aba66108fb0ca9d2d2
    //a1540512d48a4a6e805060358ee8ee2e
    
    var path: String {
        switch self {
        case .getAllRecipe: return "random?number=20&apiKey=\(apiKey)&"
        case .getSalad: return "complexSearch?type=salad&apiKey=\(apiKey)&"
        case .getSoup: return "complexSearch?type=soup&apiKey=\(apiKey)&"
        case .getSecond: return "complexSearch?type=sidedish&apiKey=\(apiKey)&"
        case .getSnack: return "complexSearch?type=snack&apiKey=\(apiKey)&"
        case .getBread: return "complexSearch?type=bread&apiKey=\(apiKey)&"
        case .getSous: return "complexSearch?type=sauce&apiKey=\(apiKey)&"
        case .getDrinks: return "complexSearch?type=drink&apiKey=\(apiKey)&"
        case .getDesserts: return "complexSearch?type=dessert&apiKey=\(apiKey)&"
        }
    }
    //https://api.spoonacular.com/recipes/716406/information?apiKey=a1540512d48a4a6e805060358ee8ee2e&
    
    var baseURL: String {
        return "https://api.spoonacular.com/recipes/"
    }
    
    var url: URL {
        let url = URL(string: path, relativeTo: URL(string: baseURL))!
        return url
    }
    
    var request: URLRequest {
        let request = URLRequest(url: url)
        return request
    }
}

final class NetworkManager: NetworkManagerProtocol {
    static var shared = NetworkManager()
    
    func getFood(completion: @escaping (Result<Food, Error>) -> Void) {
        let request = APIType.getAllRecipe.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data else { return }
                let obj = try JSONDecoder().decode(Food.self, from: data)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getSalad(completion: @escaping (Result<Salad, Error>) -> Void) {
        let request = APIType.getSalad.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data else { return }
                let obj = try JSONDecoder().decode(Salad.self, from: data)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getSoup(completion: @escaping (Result<Salad, Error>) -> Void) {
        let request = APIType.getSoup.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data else { return }
                let obj = try JSONDecoder().decode(Salad.self, from: data)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getGeneric(path: URLRequest, completion: @escaping (Result<Salad, Error>) -> Void) {
        let request = path
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data else { return }
                let obj = try JSONDecoder().decode(Salad.self, from: data)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getCurrentRecept(id: Int, completion: @escaping (Result<Recipe, Error>) -> Void) {
        let request = URLRequest(url: URL(string: "https://api.spoonacular.com/recipes/\(id)/information?apiKey=e5ddc77dc83842aba66108fb0ca9d2d2&")!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data else { return }
                let obj = try JSONDecoder().decode(Recipe.self, from: data)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }


}
