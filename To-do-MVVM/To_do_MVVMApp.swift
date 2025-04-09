//
//  To_do_MVVMApp.swift
//  To-do-MVVM
//
//  Created by Sai bharadwaj Adapa on 4/9/25.
//

import SwiftUI
import SwiftData

@main
struct To_do_MVVMApp: App {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(viewModel)
    }
}
