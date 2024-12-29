//
//  PlaylistMoveDeleteViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistMoveDeleteViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistMoveDeleteView!
    var model: PlaylistMoveDeleteModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.dataLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: "Edit",
                style: .plain,
                target: self,
                action: #selector(toggleEditingMode)
            )
        
    }
    
    //Реалізація перемикання режиму редагування
    @objc func toggleEditingMode() {
        let isEditing = contentView.tableView.isEditing
        contentView.tableView.setEditing(!isEditing, animated: true)
        navigationItem.rightBarButtonItem?.title = isEditing ? "Edit" : "Done"
    }

    
    private func setupInitialState() {
        
        model = PlaylistMoveDeleteModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        
    }
}

extension PlaylistMoveDeleteViewController {
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedSong = model.items.remove(at: sourceIndexPath.row)
        model.items.insert(movedSong, at: destinationIndexPath.row)

    }
}

extension PlaylistMoveDeleteViewController: PlaylistMoveDeleteModelDelegate {
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
    
}

extension PlaylistMoveDeleteViewController: PlaylistMoveDeleteViewDelegate  {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                model.items.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
        }
}

extension PlaylistMoveDeleteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlaylistCell")
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        if let label1 = cell.viewWithTag(1) as? UILabel,
           let label2 = cell.viewWithTag(2) as? UILabel {
            label1.text = model.items[indexPath.row].author
            label2.text = model.items[indexPath.row].songTitle
        }
        
        return cell
    }
}

extension PlaylistMoveDeleteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


