//
//  PlaylistByGenreViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistByGenreViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistByGenreView!
    var model: PlaylistByGenreModel!
    
    var genres: [String] = []
    var groupedSongs: [String: [Song]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
        
        groupSongsByGenre()
    }
    
    func groupSongsByGenre() {
        for song in model.items {
            if groupedSongs[song.genre] != nil {
                groupedSongs[song.genre]?.append(song)
            } else {
                groupedSongs[song.genre] = [song]
            }
        }
        genres = Array(groupedSongs.keys).sorted()
    }
    
    private func setupInitialState() {
        
        model = PlaylistByGenreModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

extension PlaylistByGenreViewController: PlaylistByGenreModelDelegate {
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension PlaylistByGenreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let genre = genres[section]
        return groupedSongs[genre]?.count ?? 0

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlaylistCell")
        else {
            assertionFailure()
            return UITableViewCell()
        }
        if let label1 = cell.viewWithTag(1) as? UILabel,
           let label2 = cell.viewWithTag(2) as? UILabel {
            let genre = genres[indexPath.section]
            let song = groupedSongs[genre]?[indexPath.row]
            label1.text = song?.author
            label2.text = song?.songTitle
            }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return genres[section]
    }

}

extension PlaylistByGenreViewController: UITableViewDelegate {

}

extension PlaylistByGenreViewController: PlaylistByGenreViewDelegate {

}

