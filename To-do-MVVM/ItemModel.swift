//
//  ItemModel.swift
//  To-do-MVVM
//
//  Created by Sai bharadwaj Adapa on 4/9/25.
//

import Foundation




class ItemModel: Identifiable,Codable{
    var id : String
    var text: String
    
    init(id: String = UUID().uuidString, text: String) {
        self.id = id
        self.text = text
    }
    
    
}
