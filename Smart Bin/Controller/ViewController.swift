//
//  ViewController.swift
//  Smart Bin
//
//  Created by Glorio on 13/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var trashes = [MyTrashModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        trashes = ModelManager.getInstance().getAllTrashData()
        tblView.reloadData()
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trashes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTrashCell", for: indexPath) as! MyTrashCell
        cell.lblLevel.text = trashes[indexPath.row].level
        cell.lblTimestamp.text = trashes[indexPath.row].timestamp
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
}
