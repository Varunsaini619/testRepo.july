//
//  ViewController.swift
//  UIKitClassRoom
//
//  Created by Varun Saini on 15/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var universityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button is tapped")
        universityLabel.text = "iOS Program"
    }
}

