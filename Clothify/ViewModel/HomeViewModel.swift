//
//  HomeViewModel.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-10.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectedTab: Int = 0
    @Published var searchText: String = ""
}
