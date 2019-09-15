//
//  UserDetailViewController.swift
//  PracticeParsingUser
//
//  Created by Austin Potts on 9/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var apiController: APIController?
    var user: User? {
        didSet{
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    
    func updateViews() {
        guard isViewLoaded,
            let user = user else{return}
        title = user.name.first.capitalized + " " + user.name.last.capitalized
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        guard let imageData = try? Data(contentsOf: user.picture.large) else {fatalError()}
        imageView.image = UIImage(data: imageData)
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let personToBeSaved = user else{return}
        apiController?.addUser(user: personToBeSaved)
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
