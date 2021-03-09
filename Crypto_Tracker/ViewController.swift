//
//  ViewController.swift
//  Crypto_Tracker
//
//  Created by Sheick on 3/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    let url = "https://min-api.cryptocompare.com/data/price?tsyms=USD&fsym=doge"
    
    //Foundation
    func getData(){
        //Step 1://initialize the url
        guard let url = URL(string : url)else {return}
        
        
        //Step 2: //initialize task and url session
        let task = URLSession.shared.dataTask(with: url) { (data,_, error) in
            
            //checking optional, if there is a nil value the app will crash
            guard let data = data, error == nil else{
                return
            }
            print("Data Received.")
            
            do{
                let Result = try JSONDecoder().decode(APIResponse.self, from: data)
                print(Result.USD)
            }
            catch{
                print(error.localizedDescription)
            }
            

        }
        //Step 3: Task.resume -> initiate the process
        task.resume()
    
    }
    struct APIResponse : Codable {
        let USD : Float
    }

   


}

