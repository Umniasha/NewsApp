//
//  ViewController.swift
//  NewsApp
//
//  Created by Oleg Arnaut  on 09.11.2023.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var article : Article!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var btnToBrowser: UIButton!
    var urlBrowser = URL(string: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = article.title
        descriptionLabel.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imgView.image = UIImage(data: data)
                }
                
            } else {
                self.imgView.isHidden = true
                self.activity.isHidden = true
            }
          
        }
        if let url = URL(string: self.article.url){
            urlBrowser = url
            self.btnToBrowser.isEnabled = true
        }
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
            
        let svc = SFSafariViewController(url: urlBrowser!)
            present(svc, animated: true, completion: nil)
        
        
        
    }
    
  

}
