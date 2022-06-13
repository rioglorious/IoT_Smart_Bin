//
//  AddLogViewController.swift
//  Smart Bin
//
//  Created by Glorio on 13/06/22.
//

import UIKit

class AddLogViewController: UIViewController {
    
    @IBOutlet weak var txtLevel: UITextField!
    
    @IBOutlet weak var btnAdd: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickAdd(_ sender: UIButton) {
        let string = NSDate.now
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        
        let myTrash = MyTrashModel(id: "", level: txtLevel.text!, timestamp: String(formatter.string(from: string)))
        
        let isSave = ModelManager.getInstance().SaveTrashData(trash: myTrash)
        
        print("isSave :- \(isSave)")
    }
    
}
