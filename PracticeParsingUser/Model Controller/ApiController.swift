//
//  ApiController.swift
//  PracticeParsingUser
//
//  Created by Austin Potts on 9/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class APIController {
    
    //A Place for my Array of Users to live
    var user: [User] = []
    var userTeam: [User] = []
    
    let baseURL = URL(string: "https://randomuser.me/api/?format=json&results=20")!
    
    //Easier completion handler to be used
    typealias CompletionHandler = (Error?) -> Void
    
    func getUsers(completion: @escaping CompletionHandler = {_ in}) {
        URLSession.shared.dataTask(with: baseURL) {(data, _, error) in
            if let error = error {
                NSLog("Error getting users \(error)")
            }
            guard let data = data else{
                NSLog("No data returned from data task")
                completion(nil)
                return
            }
            
            do{
               let newUsers = try JSONDecoder().decode(UserResult.self, from: data)
                print(newUsers)
                self.user = newUsers.results
            } catch {
                NSLog("Error Decoding Users: \(error)")
                completion(error)
            }
            completion(nil)
       }.resume()
    }
    
    
    func addUser(user: User){
        
        userTeam.append(user)
        
    }
    
}



