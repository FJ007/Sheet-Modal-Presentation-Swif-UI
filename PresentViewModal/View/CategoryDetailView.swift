//
//  CategoryDetailView.swift
//  Lists
//
//  Created by Javier Fernández on 12/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct CategoryDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    var category: Category
    
    var body: some View {
        ScrollView {
            VStack{
                Image(category.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                Text(category.name)
                    .font(.system(.title))
                    .fontWeight(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 35)
                Text(category.description)
                    .font(.system(.body))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 35)
                    .padding(.top, 8)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitle(Text(category.name), displayMode: .automatic)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        self.showAlert = true
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(.largeTitle))
                            .foregroundColor(.white)
                            .opacity(0.9)
                            .frame(width: 45, height: 45)
                    })
                    .padding(.trailing, 25)
                    .padding(.top, 15)
                    Spacer()
                }
            }
        )
        .alert(isPresented: self.$showAlert) { () -> Alert in
                Alert(title: Text("Message"),
                      message: Text("Is your sure?"),
                      primaryButton: .cancel(),
                      secondaryButton: .default(Text("OK"), action: {
                        self.presentationMode.wrappedValue.dismiss()
                      }))
        }
    }
}


// MARK: - Preview
struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(category: CategoyFactory.categories[5])
    }
}
