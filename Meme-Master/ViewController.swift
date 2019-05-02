//
//  ViewController.swift
//  Meme-Master
//
//  Created by Aize Igbinakenzua on 2019-04-27.
//  Copyright © 2019 Aize Igbinakenzua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    let emojis = ["ALL", "SASSY", "PARTY", "DATING", "RANDOM"]
    let emojiImages: [UIImage] = [
        
        UIImage(named: "poop")!,
        UIImage(named: "sassyWoman")!,
        UIImage(named: "partyFace")!,
        UIImage(named: "kissFace")!,
        UIImage(named: "confusedMan")!,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.titleLabel.text = emojis[indexPath.item]
        cell.emoji.image = emojiImages[indexPath.item]
        cell.backgroundColor = .lightGray
        return cell
    }
}

