//
//  ViewController.swift
//  RateMyOutfits
//
//  Created by Sergio Alvarado on 4/22/26.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    let outfits = ["Outfit 1", "Outfit 2", "Outfit 3"]

    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(
            red: 0.92,
            green: 0.92,
            blue: 0.94,
            alpha: 1.0
        )
        
        tableView = view.subviews.compactMap { $0 as? UITableView }.first

        tableView.dataSource = self
        tableView.delegate = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outfits.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = outfits[indexPath.row]

        return cell
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {

                let selectedOutfit = outfits[indexPath.row]

                let detailVC = segue.destination as! DetailViewController
                detailVC.outfitName = selectedOutfit
            }
        }
    }
}
