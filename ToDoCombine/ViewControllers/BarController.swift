//
//  BarController.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 08.06.2022.
//

import UIKit

class BarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    private func setupControllers() {
        let toDoVC = UINavigationController(rootViewController: ToDoVC(nibName: String(describing: ToDoVC.self), bundle: nil))
        let exchangeVC = UINavigationController(rootViewController: ExchangeVC(nibName: String(describing: ExchangeVC.self), bundle: nil))
     
        let newsVC = NewsVC(nibName: String(describing: NewsVC.self), bundle: nil)
        
        
        toDoVC.tabBarItem = UITabBarItem(title: "Задачи", image: UIImage(systemName: "calendar.badge.clock")?.withBaselineOffset(fromBottom: 16), tag: 0)
        toDoVC.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        
//        exchangeVC.tabBarItem = UITabBarItem(title: "Курсы валют", image: UIImage(systemName: "tablecells.badge.ellipsis")?.withAlignmentRectInsets(UIEdgeInsets(top: -100, left: 0, bottom: 0, right: 0)), tag: 1)
        
        exchangeVC.tabBarItem = UITabBarItem(title: "Курсы валют", image: UIImage(systemName: "tablecells.badge.ellipsis")?.withBaselineOffset(fromBottom: 16), tag: 1)
        exchangeVC.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
//        exchangeVC.tabBarItem = UITabBarItem(title: "Курсы валют", image: UIImage(systemName: "tablecells.badge.ellipsis")?.withBaselineOffset(fromBottom: 16), tag: 1)
//        exchangeVC.tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: 0, right: 0)
        //MARK: Doesn't work withAlignmentRectInsets
//        exchangeVC.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        newsVC.tabBarItem = UITabBarItem(title: "Новости", image: UIImage(systemName: "newspaper")?.withBaselineOffset(fromBottom: 16), tag: 2)
        //MARK: Doesn't work imageInsets
        newsVC.tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: 0, right: 0)
        

        newsVC.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        self.viewControllers = [toDoVC,exchangeVC,newsVC]
        

    }

}
