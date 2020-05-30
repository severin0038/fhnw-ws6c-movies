//
//  SearchView.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: MovieViewModel
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().separatorStyle = .none
    }
    
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    //let searchResult = [Movie]()
    
    var body: some View {
        
        NavigationView {
            //VStack---------------------
            VStack {
                
                //SearchView-HStack
                HStack {
                    //HStack--------------
                    HStack {
                        Image (systemName: "magnifyingglass")
                        
                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                            
                        }, onCommit: {
                            print("onCommit")
                            
                        }).foregroundColor(.primary)
                                
                        Button(action: {
                        self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    //HStack-End--------------
                        
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    
                    //-------------------
                    if showCancelButton {
                        Button ("Cancel") {
                            UIApplication.shared.endEditing(true)
                            self.searchText = ""
                            self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                    //---------------------
                }
                //SearchView-HStack-End----------
                
                .padding (.horizontal)
                .navigationBarHidden(showCancelButton)
                
                //For Each accepts Array or Range
                //Text accepts String
                List {
                    ForEach(viewModel.movies.filter({ (<#Movie#>) -> Bool in
                        <#code#>
                    })){
                        $0.contains(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                    
                }
                
                
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture()
                
            } //VStack-End------------
            
        } //NavigationView-End------------
        
    } //body some View- End-------
    
} //SearchView View- End

                       

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchView(viewModel: MovieViewModel())
        
        
    }
}

extension UIApplication {
    func endEditing(_ force: Bool){
        self.windows
            .filter{$0.isKeyWindow}
        .first?
        .endEditing(force)
    }
}


struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier (ResignKeyboardOnDragGesture())
    }
}
