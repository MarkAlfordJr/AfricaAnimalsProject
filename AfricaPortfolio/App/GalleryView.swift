//
//  GalleryView.swift
//  AfricaPortfolio
//
//  Created by Mark Alford on 6/14/21.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    
    
    //DATA
    let animals: [AnimalModel] = Bundle.main.decoder("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    //simple grid definitions, array count determines column, GRIDITEM
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    //effecient grid definition, GRIDITEM
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //dynamix grid layout
    //these grid def will be change by a slider value
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30){
                //IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                
                //SLIDER
                //slider is filled with switching function, the slider's value is the grid column
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                //MARK: - Grid
                //LAZYVGRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        //in this case, item can access the specific vars of data
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            //when you tap the image, the big bigger image becomes the smaller img
                            .onTapGesture{
                                selectedAnimal = item.image
                                haptic.impactOccurred()
                            }
                    }//loop
                }//lazy grid
                //activates the column switching for lvg
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//vstack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
