//
//  PlaylistDeleteModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistDeleteModelDelegate: AnyObject {
    
    func dataDidLoad()
    
}

class PlaylistDeleteModel {
    
    weak var delegate: PlaylistDeleteModelDelegate?
    private let dataLoader = DataLoaderService()
    
    var items: [Song] = []
    
    func loadData() {
        
        dataLoader.loadPlaylist { playList in
            
            self.items = playList?.songs ?? []
            self.delegate?.dataDidLoad()
        }
    }
}
