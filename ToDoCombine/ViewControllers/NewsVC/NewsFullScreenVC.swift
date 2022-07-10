//
//  NewsFullScreenVC.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 06.07.2022.
//

import UIKit

class NewsFullScreenVC: UIViewController {

    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        newsVC.newsDelegate = self
//        newsLabel.text = news[IndexPath].title
        let newsVC = NewsVC()
        newsVC.newsDelegate  = self
    }


}

extension NewsFullScreenVC: PassNewsData {
    func passNews(title: String, description: String) {
        print("!!! This button was clicked in the subview!")
        newsLabel.text = title
        descriptionLabel.text = description
    }
}
