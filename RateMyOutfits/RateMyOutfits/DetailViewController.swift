//
//  DetailViewController.swift
//  RateMyOutfits
//
//  Created by Sergio Alvarado on 4/22/26.
//

import UIKit
struct Post: Codable {
    let title: String
}


enum RatingLevel: Int {
    case one = 1, two, three, four, five
}


protocol Saveable {
    func save()
}

class DetailViewController: UIViewController {
    
    
    var outfitName: String?
    
    var rating = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
               red: 0.92,
               green: 0.92,
               blue: 0.94,
               alpha: 1.0
           )

           
           title = outfitName

          
           imageView.layer.cornerRadius = 16
           imageView.clipsToBounds = true
           imageView.contentMode = .scaleAspectFill

         
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.textAlignment = .center
           label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
           label.textColor = .label
           label.text = outfitName

           view.addSubview(label)

           NSLayoutConstraint.activate([
               label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
           ])

       
           if outfitName == "Outfit 1" {
               imageView.image = UIImage(named: "outfit1")
           } else if outfitName == "Outfit 2" {
               imageView.image = UIImage(named: "outfit2")
           } else if outfitName == "Outfit 3" {
               imageView.image = UIImage(named: "outfit3")
           }

           
           UserDefaults.standard.set(outfitName, forKey: "savedOutfit")

           if let saved = UserDefaults.standard.string(forKey: "savedOutfit") {
               print("Saved outfit:", saved)
           }

          
           fetchData()
       }
    @IBAction func rateTapped(_ sender: UIButton) {
            rating = sender.tag
            
        let alert = UIAlertController(title: "Rating",
                                      message: "You rated: \(rating) ⭐",
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        }
   
      func fetchData() {
          let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

          URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  let posts = try? JSONDecoder().decode([Post].self, from: data)
                  print(posts?.first?.title ?? "No data")
              }
          }.resume()
      }

     
      func save() {
          print("Saving outfit")
      }
}

