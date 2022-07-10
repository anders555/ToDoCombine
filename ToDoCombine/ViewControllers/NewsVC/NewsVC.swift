//
//  NewsVC.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 08.06.2022.
//

import UIKit

class NewsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var news = [Article]()
    var category = NewsCategory.allCases
    var selectedCategory: NewsCategory?
    
    //    let dateFormatter = DateFormatter()
//    let newsDateLast = Date()
     var newsDelegate: PassNewsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib.init(nibName: String(describing: NewsCell.self), bundle: nil), forCellReuseIdentifier:  String(describing: NewsCell.self))
        
        collectionView.register(UINib(nibName: String(describing: NewsCategoryCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: NewsCategoryCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOutsideCollectionView(recognizer:)))
        //        self.collectionView.addGestureRecognizer(tap)
        //MARK: Жест нажатия на элемент
        
        
        NetworkManager.getNews { result in
            self.news = result
            self.tableView.reloadData()
            print(self.news.count)
            self.spinner.stopAnimating()
        } failure: {
            self.title = "Провал\(self.news.count)"
        }
        
    }
    let formatter = DateFormatter()
    //    func dateFromString(dateString: String) -> Date? {
    //        let result = DateFormatter()
    //        result.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
    //        result.timeZone = TimeZone(abbreviation: "UTC")
    //        result.locale = Locale(identifier: "en_US_POSIX")
    //        return result.date(from: dateString)
    //    }
    
    //    let serverDateFormatter:DateFormatter = {
    //        let result = DateFormatter()
    //        result.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
    //        result.locale = Locale(identifier: "en_US_POSIX")
    //        result.timeZone = TimeZone(secondsFromGMT: 0)
    //        return result
    //    }()
    
    
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    ////        dateFromString(dateString: dateFromString(dateString: date))
    //        print("_________________________111")
    //        print(newsDateLast)
    //    }
    //
    @objc func didTapOutsideCollectionView(recognizer: UITapGestureRecognizer){
        let tapLocation = recognizer.location(in: self.view)
        if collectionView.indexPathForItem(at: tapLocation) == nil {
            dismiss(animated: true, completion: nil)
        }
        print(selectedCategory as Any)
    }
    
}
extension NewsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsCell.self), for: indexPath) as! NewsCell
        //        newsCell.configureCell(news: news[indexPath.row])
        
        //        func dateFromString(dateString: String) -> Date? {
        //            let result = DateFormatter()
        //            result.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        //            result.timeZone = TimeZone(abbreviation: "UTC")
        //            result.locale = Locale(identifier: "en_US_POSIX")
        //            return result.date(from: dateString)
        //        }
        guard let date = news[indexPath.row].publishedAt else {
            print("Could not retrieve created date")
            return newsCell
        }
        
        //        let dateformat = serverDateFormatter.date(from: date)
        //        newsDateLast = dateFromString(dateString: date)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let test1 = formatter.date(from: date)
        
        
        newsCell.headerLabel.text = news[indexPath.row].title
//        newsCell.headerLabel.text = date
        news[indexPath.row].title
        
        //                print("_________________________")
        //                print(test1)
        
        return newsCell
    }
    
}
extension NewsVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsFS = NewsFullScreenVC(nibName: String(describing: NewsFullScreenVC.self), bundle: nil)
        //        navigationController?.pushViewController(newsFS, animated: true)
        self.present(newsFS, animated: true)
//        guard let title = news [indexPath.row].title else { return }
        let title = "dfergr"
        guard let description = news [indexPath.row].description else { return }
        newsDelegate?.passNews(title: title, description: description)
        

        tableView.reloadData()
    }
}

extension NewsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NewsCategoryCell.self), for: indexPath) as! NewsCategoryCell
        cell.newsCategoryLabel.text = category[indexPath.row].rawValue
        return cell
    }
    
}

extension NewsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(category[indexPath.row].rawValue)
        selectedCategory = category[indexPath.row]
    }
    
}

//extension DateFormatter {
//    func date(fromSwapiString dateString: String) -> Date? {
//        // SWAPI dates look like: "2014-12-10T16:44:31.486000Z"
//        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
//        self.timeZone = TimeZone(abbreviation: "UTC")
//        self.locale = Locale(identifier: "en_US_POSIX")
//        return self.date(from: dateString)
//    }
//}


