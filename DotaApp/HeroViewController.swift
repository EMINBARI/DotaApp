//
//  HeroViewController.swift
//  DotaApp
//
//  Created by Emin Bari on 18.07.2020.
//  Copyright © 2020 Emin Bari. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroHealth: UILabel!
    @IBOutlet weak var heroAttack: UILabel!
    
    var hero: HeroData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroName.text = hero?.first_name.capitalized
        heroHealth.text = "\((hero?.last_name)!) XP"
        heroAttack.text = "\((hero?.email)!)"
        
        let urlString: String = "https://api.opendota.com" + "\(hero!.avatar)"
        guard let imageUrl: URL = URL(string: urlString) else{return}
        if let data = try? Data(contentsOf: imageUrl) {
            heroImage.image = UIImage(data: data)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
