//
//  Playlist.swift
//  HomeWork10UK
//
//  Created by user on 20.12.2024.
//

import Foundation

struct Playlist: Decodable {
    
    let songs: [Song]
}

struct Song: Decodable {
    
    let author: String
    let songTitle: String
    let albumTitle: String
    let genre: String
    
    enum CodingKeys: String, CodingKey {
        
        case author
        case songTitle = "song_title"
        case albumTitle = "album_title"
        case genre
    }
}
