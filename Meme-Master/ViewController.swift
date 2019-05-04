//
//  ViewController.swift
//  Meme-Master
//
//  Created by Aize Igbinakenzua on 2019-04-27.
//  Copyright © 2019 Aize Igbinakenzua. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UICollectionViewDelegate, MFMailComposeViewControllerDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    

    @IBAction func sendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
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
        return cell
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["jacob@memebox.lol"])
        mailComposerVC.setSubject("Contact Us")
        
        return mailComposerVC
        
    }
    
    func showMailError () {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}

