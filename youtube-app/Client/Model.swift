//
//  Model.swift
//  youtube-app
//
//  Created by Fernando Marins on 07/12/21.
//

import Foundation

class Model {
    
    func getVideos(completion: @escaping(Response?, Error?) -> Void) {
        
        // Create a URL object
        let url = URL(string: Constants.url)
        
        guard url != nil else { return }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            // Parsing data into video object
            let decoder = JSONDecoder()
            
            do {
                let responseObject = try decoder.decode(Response.self, from: data)
                completion(responseObject, nil)
            } catch {
                debugPrint(error)
                completion(nil, error)
            }

        }
        
        // Kick off the task
        
        dataTask.resume()
    }
    
}
