//
//  RestManager.swift
//  CadastroUnico
//
//  Created by Felipe Domingos on 22/09/22.
//

import Foundation
import Alamofire

class RestManager {
    func fetchWordData(lang: String, word: String, completion: @escaping (Result<[Word], Error>) -> Void) {
        let url = "https://api.dictionaryapi.dev/api/v2/entries/"
        
        AF.request("\(url)\(lang)/\(word)").responseDecodable(of: [Word].self) { response in
            switch response.result {
            case .success(let words):
                completion(.success(words))
                print(words)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
