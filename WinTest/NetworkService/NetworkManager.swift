//
//  NetworkManager.swift
//  TestMaket
//
//  Created by Mac on 17.07.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    private let baseURL = "http://84.38.181.162/ios/"
    
    func getData(weekday: String, completion: @escaping ([WeekdayModel]) -> () ) {
        
        let url = "\(baseURL)\(weekday).json"
        DispatchQueue.global(qos: .utility).async {
            AF.request(url, method: .get).responseData { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let array = try decoder.decode([WeekdayModel].self, from: data)
                    let arr = array
                    DispatchQueue.main.async {
                        completion(arr)
                    }
                } catch {
                    print("Error")
                }
            }
        }
        
    }
    
    func sendQuestion(question: String, id: String, completion: @escaping (Data) -> ()) {
        let url = "http://84.38.181.162/ios/ask.php"
        
        let param: Parameters = ["ask": question,
                                 "id": id]
        
        AF.request(url, method: .post, parameters: param).responseData { response in
            guard let data = response.data else { return }
            
            do{
                let decoder = JSONDecoder()
                let array = try decoder.decode(Data.self, from: data)
                let arr = array
                DispatchQueue.main.async {
                    completion(arr)
                }
            } catch {
                print("Error sent question")
            }
        }
    }
    
    func getResponse(id: String, completion: @escaping (Question) -> ()) {
        let url = "http://84.38.181.162/ios/response.php?id=\(id)"
        
        AF.request(url, method: .get).responseData { response in
            guard let data = response.data else { return }
            
            do{
                let decoder = JSONDecoder()
                let array = try decoder.decode(Question.self, from: data)
                let arr = array
                print("\(arr)")
                DispatchQueue.main.async {
                    completion(arr)
                }
            } catch {
                print("Error get question")
            }
        }
    }
    
    func generateID() -> String  {
        return UUID().uuidString
    }
    
    
}
