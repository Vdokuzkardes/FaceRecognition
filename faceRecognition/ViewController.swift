//
//  ViewController.swift
//  faceRecognition
//
//  Created by Vedat Dokuzkardeş on 14.11.2023.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var labelTxt: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


    @IBAction func SignBtn(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you") { success, error in
                if success == true{
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "VC2", sender: nil)
                    }
                    //successful auth
                    
                }else{
                    DispatchQueue.main.async{
                        self.labelTxt.text = "Error!"
                    }
                    
                }
            }
        }
    }
    
}

