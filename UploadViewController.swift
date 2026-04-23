//
//  UploadViewController.swift
//  RateMyOutfits
//
//  Created by Sergio Alvarado on 4/22/26.
//

import UIKit

class UploadViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGray6
        title = "Upload"
    }
    
    @IBAction func saveOutfitTapped(_ sender: UIButton) {
        let newOutfit = "Outfit \(Int.random(in: 1...100))"
        
        var savedOutfits = UserDefaults.standard.stringArray(forKey: "savedOutfits") ?? []
        
        savedOutfits.append(newOutfit)
        
        UserDefaults.standard.set(savedOutfits, forKey: "savedOutfits")
        
        let alert = UIAlertController(
            title: "Saved",
            message: "\(newOutfit) added!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
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
