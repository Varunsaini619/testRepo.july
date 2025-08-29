//
//  SelectRoomTypeTableViewController.swift
//  HotelCoadable
//
//  Created by Varun Saini on 28/08/25.
//

//
//  SelectRoomTypeTableViewController.swift
//  HotelCodable
//
//  Created by Varun Saini on 28/08/25.
//

import UIKit

protocol SelectRoomTypeTableViewControllerDelegate: AnyObject {
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController,
     didSelect roomType: RoomType)
}

class SelectRoomTypeTableViewController: UITableViewController {
    
    weak var delegate: SelectRoomTypeTableViewControllerDelegate?
    var roomType: RoomType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomType.all.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
        
        let currentRoomType = RoomType.all[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = currentRoomType.name
        content.secondaryText = "$\(currentRoomType.price)"
        cell.contentConfiguration = content
        
        cell.accessoryType = (currentRoomType == roomType) ? .checkmark : .none
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedRoomType = RoomType.all[indexPath.row]
        self.roomType = selectedRoomType
        
      
        delegate?.selectRoomTypeTableViewController(self, didSelect: selectedRoomType)
        
        tableView.reloadData()
    }
}
