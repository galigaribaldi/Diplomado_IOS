//
//  TunesTableViewController.swift
//  clase5TableItunes
//
//  Created by Daniel Mayo on 28/02/20.
//  Copyright © 2020 Daniel Mayo. All rights reserved.
//

import UIKit

class TunesTableViewController: UITableViewController, UISearchBarDelegate{

    var tracks : [Track] = []
    let searchBarControler = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //Controlando barra buscadora
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchBarControler
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        searchBarControler.dimsBackgroundDuringPresentation = true
        searchBarControler.searchBar.delegate = self
        
        let nib = UINib(nibName: "TrackCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        getTracks(cadena :"")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tracks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TrackCell
        
        cell!.track = tracks[indexPath.row]
        let track = tracks[indexPath.row].trackName

        cell!.title?.text = tracks[indexPath.row].trackName

        //cell
        //cell?.title.text = track.trackName
        return cell!
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func getTracks(cadena : String){
        let stringConverted = cadena.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string:  "https://itunes.apple.com/search?term=\(stringConverted)%media")

        let jsonDecoder = JSONDecoder()

        //singleton con shared y no ocupar mas de una referencia a la vez
        let task = URLSession.shared.dataTask(with: url!) { (data, responde, error) in

            
            if (error != nil){
                print(error?.localizedDescription)
            }
            
            if let data = data, let tracksList = try? jsonDecoder.decode(ResultSearch.self , from : data) {
                for track in tracksList.results{
                    print(track.trackName)
                }
                
                self.tracks = tracksList.results
                //Para no tener que acer una accion (Forma asincrona) 
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
             
            }
        }

        task.resume()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 4{
            getTracks(cadena: searchText)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}
