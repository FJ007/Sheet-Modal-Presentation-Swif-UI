//
//  ContentView.swift
//  PresentViewModal
//
//  Created by Javier Fernández on 14/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCategory: Category?
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(CategoyFactory.categories) { category in
                CellFullImageView(category: category)
                    .frame(width: 350,
                          height: 200,
                          alignment: .center)
                    .onTapGesture {
                        self.selectedCategory = category
                    }
            }
            .sheet(item: self.$selectedCategory) { category in
                CategoryDetailView(category: category)
            }
            .navigationBarTitle(Text("Categories"), displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
