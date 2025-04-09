//
//  ViewModel.swift
//  To-do-MVVM
//
//  Created by Sai bharadwaj Adapa on 4/9/25.
//

import Foundation
import SwiftData




class ViewModel : ObservableObject{
    @Published var items : [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    init()
    {
        getItems()
    }
    
    
    let itemsKey: String = "items_list"
    
    func getItems()
    {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let decodedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{
            return
        }
        
        self.items = decodedItems
        
    }
    
    func addItem(title : String)
    {
        items.append(ItemModel(text: title))
    }
    
    func deleteItem(indexSet : IndexSet)
    {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from : IndexSet, to : Int)
    {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveItems()
    {
        if let encodedData = try? JSONEncoder().encode(items)
        {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
}
