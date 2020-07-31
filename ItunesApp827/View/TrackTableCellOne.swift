//
//  TrackTableCellOne.swift
//  ItunesApp827
//
//  Created by mac on 9/11/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TrackTableCellOne: UITableViewCell {
    
    @IBOutlet weak var trackAlbumImage: UIImageView!
    @IBOutlet weak var trackAlbumPrice: UIButton!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var trackAlbumArtist: UILabel!
    @IBOutlet weak var trackAlbumName: UILabel!
    
    static let identifier = "TrackTableCellOne"
    
    
    var album: Album? {
        didSet {
            guard let price = album?.price ?? nil else {
                return
            }
            trackAlbumPrice.setTitle("$\(price)", for: .normal)
            trackCountLabel.text = "\(album?.trackCount ?? 0) tracks"
            trackAlbumArtist.text = album?.artist
            trackAlbumName.text = album?.title
            album?.getImage { [weak self] img in
                self?.trackAlbumImage.image = img
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        trackAlbumPrice.layer.cornerRadius = 5
        trackAlbumPrice.layer.borderWidth = 2
        trackAlbumPrice.layer.borderColor = trackAlbumPrice.tintColor.cgColor
    }
    
}
