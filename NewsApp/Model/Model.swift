//
//  Model.swift
//  NewsApp
//
//  Created by Oleg Arnaut  on 07.11.2023.
//

import Foundation

var articles : [Article] = []
var urlData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadNews (completionCenter : (()->Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-11-06&to=2023-11-06&sortBy=popularity&apiKey=5f1825a55e0447f9b65c19d6b6a51dc6")
    guard let url = url else { return }

    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url) { urlFile, response, error in
        if urlFile != nil {
           
            try? FileManager.default.copyItem(at: urlFile!, to: urlData)
            
           // print(urlPath)
            parseNews()
            completionCenter?()
        }
    }
    
    downloadTask.resume()
}

func parseNews () {
   
    
    let data = try? Data(contentsOf: urlData)
    guard let data = data else { return }
    let rootDictinary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any>
    guard let rootDictinary = rootDictinary else { return }
    if let array = rootDictinary["articles"] as? [Dictionary<String, Any>] {
    
        var returnArray : [Article] = []
            for dict in array {
                let newArticle = Article(dictinary: dict)
                returnArray.append(newArticle)
            }
        articles = returnArray
    }
}
