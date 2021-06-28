//
//  ViewController.swift
//  tableViewWithMultipleSelection
//
//  Created by minal borole on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView2: UITableView!
    
    var dataArray = ["Hello 1","Hello 2","Hello 3","Hello 4","Hello 5","Hello 6","Hello 7","Hello 8","Hello 9","Hello 10"]
    var selectArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView2.isEditing = true
        self.tableView2.allowsMultipleSelectionDuringEditing = true
        // Do any additional setup after loading the view.
    }

    @IBAction func btnNextClick(_ sender: UIButton) {
    }
    
    
    
    @IBAction func multipleSelectBtnClicked(_ sender: UIButton) {
        self.selectArray.removeAll()
        if sender.isSelected{
            for row in  0 ..< dataArray.count {
                self.tableView2.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
            }
            
            selectArray = dataArray
            sender.setImage(UIImage(named: "select.svg"), for: .normal)
            sender.isSelected = false
            
        }else{
            for row in  0 ..< dataArray.count {
                self.tableView2.deselectRow(at: IndexPath(row: row, section: 0), animated: false)
            }
            sender.isSelected = true
            sender.setImage(UIImage(named: "deselect.png"), for: .normal)
            self.selectArray.removeAll()
            
        }
       
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectDeselectRow(tableView: tableView, indexPath: indexPath)
        print("select")
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectDeselectRow(tableView: tableView, indexPath: indexPath)
        print("deselect")
    }
    
}
extension ViewController{
    func selectDeselectRow(tableView: UITableView, indexPath: IndexPath){
        self.selectArray.removeAll()
        if let arr = tableView.indexPathsForSelectedRows{
            for index in arr{
                selectArray.append(dataArray[indexPath.row])
            }
        }
        print(selectArray)
    }
}
