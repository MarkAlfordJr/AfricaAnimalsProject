//
//  VideoPlayerUtilities.swift
//  AfricaPortfolio
//
//  Created by Mark Alford on 6/16/21.
//

import Foundation
import AVKit

//setup the video player
var videoPlayer: AVPlayer?

//function to play video automatically
func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    //if video is valid (no need for ??)
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
