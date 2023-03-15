import UIKit
// https://api.spoonacular.com/recipes/716429/information?apiKey=29b6b28f28904fc3a4946eed49a5833b& 1 recept
// my api key 29b6b28f28904fc3a4946eed49a5833b
// https://api.spoonacular.com/recipes/random?number=20&apiKey=29b6b28f28904fc3a4946eed49a5833b& mnogo recept

//https://api.spoonacular.com/recipes/complexSearch?type=soup&apiKey=29b6b28f28904fc3a4946eed49a5833b& салаты


protocol NetworkManagerProtocol: AnyObject {
    func getFood(completion: @escaping (Result<Food, Error>) -> Void)
    func getSalad(completion: @escaping (Result<Salad, Error>) -> Void)
    func getSoup(completion: @escaping (Result<Salad, Error>) -> Void)
}

fileprivate enum APIType {
    case getAllRecipe
    case getSalad
    case getSoup
    case getSnack
    case getBread
    case getSous
    case getDrinks
    case getDesserts
    
    
    var path: String {
        switch self {
        case .getAllRecipe: return "random?number=20&apiKey=29b6b28f28904fc3a4946eed49a5833b&"
        case .getSalad: return "complexSearch?type=salad&apiKey=29b6b28f28904fc3a4946eed49a5833b&"
        case .getSoup: return "complexSearch?type=soup&apiKey=29b6b28f28904fc3a4946eed49a5833b&"
        case .getSnack: return "complexSearch?type=snack&apiKey=29b6b28f28904fc3a4946eed49a5833b&"
        case .getBread: return "complexSearch?type=bread&apiKey=29b6b28f28904fc3a4946eed49a5833b&"
        case .getSous: return "complexSearch?type=sauce&apiKey=29b6b28f28904fc3a4946eed49a5833b&"
        case .getDrinks: return "complexSearch?type=drink&apiKey=29b6b28f28904fc3a4946eed49a5833b&"
        case .getDesserts: return "complexSearch?type=dessert&apiKey=29b6b28f28904fc3a4946eed49a5833b&"
        }
    }
    //https://api.spoonacular.com/recipes/715415/information?apiKey=29b6b28f28904fc3a4946eed49a5833b&
    
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

}
