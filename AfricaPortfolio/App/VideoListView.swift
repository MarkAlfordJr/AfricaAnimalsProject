//
//  VideoListView.swift
//  AfricaPortfolio
//
//  Created by Mark Alford on 6/14/21.
//

import SwiftUI

struct VideoListView: View {
    //state allows shuffling of array data
    @State var video: [VideoModel] = Bundle.main.decoder("videos.json")
    //haptic feedback
    let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView{
            List{
                ForEach(video) { item in
                    //navigation link to send the link to the full vid player
                    NavigationLink(
                        destination: VideoPlayerView(video: item),
                        label: {
                            VideoListItem(video: item)
                        })
                }//loops
                .padding(.vertical, 10)
            }//list
            .listStyle(InsetGroupedListStyle())//use instead of groupbox
            //navigation
            .navigationBarTitle("Video", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                //shuffle the array data
                video.shuffle()
                hapticFeedback.impactOccurred()
            }, label: {
                Image(systemName: "arrow.2.squarepath")
            }))
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
