//
//  ModelManager.swift
//  Smart Bin
//
//  Created by Glorio on 13/06/22.
//

import Foundation
import UIKit

var shareInstance = ModelManager()

class ModelManager {
    var database: FMDatabase? = nil
    
    static func getInstance() -> ModelManager {
        if shareInstance.database == nil {
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "iot_dummy.sqlite3"))
        }
        return shareInstance
    }
    
    func SaveTrashData(trash: MyTrashModel) -> Bool {
        shareInstance.database?.open()
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO trash (level, timestamp) VALUES(?, ?)", withArgumentsIn: [trash.level, trash.timestamp])
        
        shareInstance.database?.close()
        return isSave!
    }
    
    func getAllTrashData() -> [MyTrashModel] {
            shareInstance.database?.open()
            //FMResultSet  :  Used to hold result of SQL query on FMDatabase object.
            let resultSet : FMResultSet! = try! shareInstance.database?.executeQuery("SELECT * FROM trash", values: nil)
            var allTrashes = [MyTrashModel]()
            
            if resultSet != nil{
                while resultSet.next() {
                    let trashModel = MyTrashModel(id: resultSet.string(forColumn: "id")!, level: resultSet.string(forColumn: "level")!, timestamp: resultSet.string(forColumn: "timestamp")!)
                    allTrashes.append(trashModel)
                }
            }
            shareInstance.database?.close()
            return allTrashes
        }
    
    func getLatestTrashData() -> [MyTrashModel] {
            shareInstance.database?.open()
            //FMResultSet  :  Used to hold result of SQL query on FMDatabase object.
            let resultSet : FMResultSet! = try! shareInstance.database?.executeQuery("SELECT * FROM trash ORDER BY ID DESC", values: nil)
            var allTrashes = [MyTrashModel]()
            
            if resultSet != nil{
                while resultSet.next() {
                    let trashModel = MyTrashModel(id: resultSet.string(forColumn: "id")!, level: resultSet.string(forColumn: "level")!, timestamp: resultSet.string(forColumn: "timestamp")!)
                    allTrashes.append(trashModel)
                }
            }
            shareInstance.database?.close()
            return allTrashes
        }
}
