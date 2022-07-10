//
//  NewsCell.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 21.06.2022.
//

import UIKit
protocol PassNewsDataDelegate: AnyObject {
    func passData(header: String, description: String)
}

class NewsCell: UITableViewCell {
    //    enum Actions {
    //       case openFullNews(нужные параметры)
    //    }
    weak var delegate: PassNewsDataDelegate?
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageOfNews: UIImageView!
    @IBOutlet weak var dateOfNews: UILabel!
    
    //    var cellTap: ((Actions)-> Void)?
    //
    //     @objc private func cellTapped()
    
    //    cellTap?(.openFullNews)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    
    override func prepareForReuse() {
        imageOfNews.image = nil
    }
    
    
}
