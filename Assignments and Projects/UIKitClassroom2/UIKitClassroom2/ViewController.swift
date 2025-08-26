//
//  ViewController.swift
//  UIKitClassroom2
//
//  Created by Varun Saini on 15/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wifiToggle: UISwitch!
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //    @IBAction func wifiToggle(_ sender: UISwitch) {
    //
    //        if sender.isOn {
    //            print("Wifi is ON")
    //        }else{
    //            print("Wifi is OFF")
    //        }
    //    }
    //
    //    @IBAction func volumeChanged(_ sender: UISlider) {
    //        print(sender.value)
    //    }
    //    @IBAction func nameEdited(_ sender: UITextField) {
    //        if let text = sender.text {
    //            print(text)
    //        }
    //    }
    //    @IBAction func keyboardReturnKeyPressed(_ sender: UITextField) {
    //        if let text = sender.text{
    //            print(text)
    //        }
    //    }
    //}
    
    
    
    
    
    @IBAction func displayButtonTapped(_ sender: UIButton) {
        if wifiToggle.isOn{
            print("wifi is on")
        }
        else {
            print("wifi is off")
        }
        print(volumeSlider.value)
    }
    
}

    
    

