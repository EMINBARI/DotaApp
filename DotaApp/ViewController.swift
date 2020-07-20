//
//  ViewController.swift
//  DotaApp
//
//  Created by Emin Bari on 18.07.2020.
//  Copyright © 2020 Emin Bari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //var heroes = HeroModel(nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dota characters"

        setupTableView()
        fetchData {
            self.tableView.reloadData()
        }
    }
    
    private func setupTableView(){
        let nibItemCell = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableView.register(nibItemCell, forCellReuseIdentifier: "itemCellIdentifier")
    }
    
    func fetchData(completion: @escaping (Result<HeroModel, Error>) -> Void){
        guard let url = URL(string: "https://reqres.in/api/users") else{fatalError()}
        let dataTask = URLSession.shared.dataTask(with: url){data, _, _ in
            guard let jsonData = data else{
                completion()
                return
            }
            do{
                let decoder = JSONDecoder()
                let heroesResponse = try decoder.decode(HeroModel.self, from: jsonData)
            }
        }
        dataTask.resume()
        
        
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.data.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCellIdentifier", for: indexPath) as! ItemTableViewCell
        cell.initCell(
            imageName: heroes.data[indexPath.row].avatar,
            title: heroes.data[indexPath.row].first_name.capitalized
        )
       
        return cell
    }
}

extension ViewController: UITableViewDelegate{
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? HeroViewController{
            dest.hero = heroes.data[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}

