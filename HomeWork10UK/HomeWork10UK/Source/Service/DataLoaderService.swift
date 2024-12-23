//
//  DataLoaderService.swift
//  HomeWork10UK
//
//  Created by user on 20.12.2024.
//

import Foundation

enum CustomError: Error {
    case someError
}

class DataLoaderService {
    
    func loadPlaylist(completion: @escaping (Playlist?) -> ()) {
        
        guard let url = Bundle.main.url(forResource: "Playlist", withExtension: "json") else {
            assertionFailure()
            completion(nil)
            return
        }
        
        var playlist: Playlist?
        do {
            let data = try Data(contentsOf: url)
            playlist = try JSONDecoder().decode(Playlist.self, from: data)
        } catch {
            debugPrint("error:\(error)")
        }
        
        completion(playlist)
    }
}
