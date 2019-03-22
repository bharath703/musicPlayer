//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Bharath on 22/03/19.
//  Copyright © 2019 TestCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = "Music Play List"
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/non-explicit.json")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            //            guard let data = data else { return }
            //            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        //        cell.imageView.image = [UIImage imageNamed:@"image.png"];
        let url = URL(string: "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/64/23/7c/64237c91-9cd4-6ce1-ca1e-5f91a5a261dd/4050538482782.jpg/200x200bb.png")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: data!)
                self.listTable.reloadData()
            }
        }
        cell.textLabel?.text = "good morning"
        
        return cell
    }
    
    
    
}

