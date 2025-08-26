//
//  ViewController.swift
//  LoginPrac
//
//  Created by Varun Saini on 30/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var forgotUsername: UIButton!
    
    @IBOutlet weak var forgotPassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else{return}
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else if sender == forgotUsername{
            segue.destination.navigationItem.title = "Forgot User Name"
        }
        else{
            segue.destination.navigationItem.title = userName.text
        }
    }
    
    @IBAction func forgotubutton(_ sender: UIButton) {
        performSegue(withIdentifier: "vssSgue", sender: sender)
    }
    
    @IBAction func forgotpbutton(_ sender: UIButton) {
        performSegue(withIdentifier: "vssSgue", sender: sender)
    }
    
}

