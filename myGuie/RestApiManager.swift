//
//  RestApiManager.swift
//  myGuie
//
//  Created by internet on 5/26/15.
//  Copyright (c) 2015 acdevel. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
    struct Static {
        static var sharedIntance = RestApiManager()
    }
    
    var apiKey = "e372a5cede47dde4758d868675848a02"
    var base = "https://api.themoviedb.org/3/"
    let baseURL = "https://api.themoviedb.org/3/"
    
    var routePath: String! = "discover/movie?sort_by=popularity.desc"
    
    var sourceImage = "https://image.tmdb.org/t/p/w130"
    
    func getImageSource(img: String) -> String {
        return sourceImage + img
    }
    
    func getRequest(onCompletion: (JSON) -> Void) {
        let route = baseURL + routePath + "&api_key=" + apiKey
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data)
            onCompletion(json, error)
        })
        task.resume()
    }
}