//
//  Article.swift
//  NewsApp
//
//  Created by Oleg Arnaut  on 07.11.2023.
//

import Foundation

struct Article: Codable {
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    
    init(dictinary: Dictionary<String, Any>){
        author = dictinary["author"] as? String
        title = dictinary["title"] as? String ?? ""
        description = dictinary["description"] as? String ?? ""
        url = dictinary["url"] as? String ?? ""
        urlToImage = dictinary["urlToImage"] as? String ?? ""
        publishedAt = dictinary["publishedAt"] as? String ?? ""
        content = dictinary["content"] as? String ?? ""
    }
}
