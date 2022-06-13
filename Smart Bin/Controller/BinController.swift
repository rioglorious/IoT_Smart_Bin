//
//  BinController.swift
//  Smart Bin
//
//  Created by Glorio on 13/06/22.
//

import UIKit

class BinController: UIViewController {

    @IBOutlet weak var txtLevel: UILabel!
    var trashes = [MyTrashModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let trashCount = trashes.count
        trashes = ModelManager.getInstance().getLatestTrashData()
        txtLevel.text = trashes[trashCount].level
    }

}
