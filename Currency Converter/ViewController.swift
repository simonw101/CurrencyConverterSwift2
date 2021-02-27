//
//  ViewController.swift
//  Currency Converter
//
//  Created by Simon Wilson on 26/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    
    @IBOutlet weak var chfLabel: UILabel!
    
    @IBOutlet weak var gbpLabel: UILabel!
    
    @IBOutlet weak var jpyLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        if let url = URL(string: "http://data.fixer.io/api/latest?access_key=d967bb80ee30c72a4af17c4f7e23e60a") {
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    
                    let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    
                    alert.addAction(okButton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    
                    if data != nil {
                        
                        if let jsonData = data {
                            
                            do {
                                
                                let jsonResponse = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)
                                
                                DispatchQueue.main.async {
                                    
                                    print(jsonResponse)
                                    
                                }
                                
                                
                            } catch {
                                
                                print("unable to parse json")
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
        
    }
    
}

