//
//  ExchangeVC.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 08.06.2022.
//

import UIKit

class ExchangeVC: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var values = [Value]()
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var rubLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner.stopAnimating()
    }
    
    @IBAction func calcBtn(_ sender: Any) {
        spinner.startAnimating()
        NetworkManager.getValueCourse { result in
//            self.title = "Всё ок"
            self.spinner.stopAnimating()
            for curr in result {
                if curr.id == 431 || curr.id == 451 || curr.id == 456 || curr.id == 463 {
                    self.values.append(curr)
                }
            }
        } failure: {
            self.spinner.stopAnimating()
            self.title = "Ошибка запроса"
        }
        
        
        guard let bynStr = inputField.text,
              let byn = Double(bynStr) else { return }
        for curr in values {
            if curr.id == 431 {
                self.usdLabel.text = "\(byn / curr.rate! * Double(curr.scale!)) Долларов США"
            } else if curr.id == 451 {
                self.eurLabel.text = "\(byn / curr.rate! * Double(curr.scale!)) Евро"
            } else if  curr.id == 456 {
                self.rubLabel.text = "\(byn / curr.rate! * Double(curr.scale!)) Российских рублей"
            }
            
        }
        self.view.endEditing(true)
    }
}

