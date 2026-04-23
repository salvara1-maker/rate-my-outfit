//
//  MyOutfitsViewController.swift
//  RateMyOutfits
//
//  Created by Sergio Alvarado on 4/22/26.
//

import UIKit

class MyOutfitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var savedOutfits: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemGray6
        title = "My Outfits"

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        savedOutfits = UserDefaults.standard.stringArray(forKey: "savedOutfits") ?? []
        tableView.reloadData()
    }

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedOutfits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = savedOutfits[indexPath.row]

        return cell
    }

    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedOutfit = savedOutfits[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

        detailVC.outfitName = selectedOutfit

        navigationController?.pushViewController(detailVC, animated: true)
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


