//
//  AddRegistrationTableViewController.swift
//  HotelCoadable
//
//  Created by Varun Saini on 27/08/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {

    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var checkInDateLabel: UILabel!
    
    @IBOutlet weak var checkOutDateLabel: UILabel!
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    var roomType : RoomType?
    
    var registration: Registration? {
        guard let roomType = roomType else { return nil }

        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(
            firstName: firstName,
            lastName: lastName,
            emailAddress: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren,
            wifi: hasWifi,
            roomType: roomType
        )
    }

     
    override func viewDidLoad() {
           super.viewDidLoad()
           let midnightToday = Calendar.current.startOfDay(for: Date())
           checkInDatePicker.minimumDate = midnightToday
           checkInDatePicker.date = midnightToday
           updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
       }

    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController,
            didSelect roomType: RoomType) {
           self.roomType = roomType
           updateRoomType()
       }
       
       
    func updateRoomType () {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
        
        
       func updateDateViews() {
           let formatter = DateFormatter()
           formatter.dateStyle = .medium
           checkInDateLabel.text = formatter.string(from: checkInDatePicker.date)
           checkOutDateLabel.text = formatter.string(from: checkOutDatePicker.date)
       }

    @IBAction func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        return selectRoomTypeController
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        
    }
    
    // MARK: - Picker Cell Logic
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    // MARK: - Table View Overrides
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkInDateLabelCellIndexPath && !isCheckOutDatePickerVisible {
            // Check-in label selected, check-out picker hidden
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelCellIndexPath && !isCheckInDatePickerVisible {
            // Check-out label selected, check-in picker hidden
            isCheckOutDatePickerVisible.toggle()
        } else if indexPath == checkInDateLabelCellIndexPath || indexPath == checkOutDateLabelCellIndexPath {
            // Either label selected and one picker visible
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    func updateNumberOfGuests () {
    numberOfAdultsLabel.text =
    "\(Int(numberOfAdultsStepper.value) )"
    numberOfChildrenLabel.text =
    "\(Int(numberOfChildrenStepper.value) )"
    }
    

}
