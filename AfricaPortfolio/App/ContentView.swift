//
//  ContentView.swift
//  AfricaPortfolio
//
//  Created by Mark Alford on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    let animals: [AnimalModel] = Bundle.main.decoder("animals.json")
    
    //MARK: - Body
    var body: some View {
        NavigationView{
            List{
                CoverImageView()
                    //gets rid of padding
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                //for list of cards, ForEACH
                ForEach(animals) { item in
                    //nav link, hooked up to the animal json data array
                    NavigationLink(
                        destination: AnimalDetailView(animal: item),
                        label: {
                            AnimalListView(animals: item)
                        })
                   
                }//loop
                .padding(.vertical, 10)
            }//list
        //navigationView
            .navigationBarTitle("Africa", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
