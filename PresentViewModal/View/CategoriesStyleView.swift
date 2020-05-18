//
//  Categories.swift
//  Lists
//
//  Created by Javier Fernández on 11/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct CategoriesStyleView: View {
    let sanpleCategory = Category(name: "Animals", image: "animals")
    var body: some View {
        VStack {
            Text("Cell Samples")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .underline()
            CellFullImageView(category: sanpleCategory)
                .padding(30)
            CellDefaultView(category: sanpleCategory)
        }
    }
}

struct CellFullImageView: View {
    var category: Category
    var body: some View {
        ZStack {
            Image(category.image)
                .resizable()
                .frame(width: 335, height: 200)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .opacity(0.2)
            )
            Text(category.name)
                .font(.system(.largeTitle, design: .default))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 20, x: -1, y: -1)
        }
    }
}

struct CellDefaultView: View {
    var category: Category
    var body: some View {
        HStack {
            Image(category.image)
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(40)
                .clipped()
            Text(category.name)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
    }
}

// MARK: - Preview
struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesStyleView()
    }
}
