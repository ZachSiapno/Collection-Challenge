//
//  ViewController.swift
//  CollectionsChallenge
//
//  Created by Bob Villa
//  Copyright © 2020 MobileMakersEdu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indexTextField: UITextField!
    @IBOutlet weak var removedMovieLabel: UILabel!
    
    let sectionTitles = ["Arrays","Dictionaries"]
    var numberOfFavoriteMovies = 0
    var key = ""
    var value = 0
    var movie = ""
    
    // MARK: - MVP - Part I
    var myFavoriteMovies = ["A Silent Voice", "Spider Man: Into the Spider Verse", "Remember the Titans"]
    var myMovieRatings = ["A Silent Voice": 5, "Spider Man: Into the Spider Verse": 4, "Remember the Titans": 4]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = sectionTitles[section]
        label.font = UIFont(name: "Times", size: 30)
        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // MARK: - MVP - Part II
        numberOfFavoriteMovies = myFavoriteMovies.count
        
        return numberOfFavoriteMovies
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TODO: - MVP
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            if indexPath.section == 0 {
                movie = myFavoriteMovies[indexPath.row]
                cell.textLabel?.text = movie
            } else {
                key = Array(myMovieRatings.keys)[indexPath.row]
                value = Array(myMovieRatings.values)[indexPath.row]
                var output = "\(key) "
                for _ in 1...value {
                    output += "⭐️"
                }
                cell.textLabel?.text = output
            }
            return cell
        }
        return UITableViewCell()
    }
    
    @IBAction func whenStretch1ButtonPressed(_ sender: UIButton) {
        // MARK: - Stretch #1
        myFavoriteMovies.append("The Karate Kid")
        myMovieRatings.updateValue(2, forKey: "The Karate Kid")
        
        
        tableView.reloadData()
    }
    
    @IBAction func whenStretch2ButtonPressed(_ sender: UIButton) {
        // MARK: - Stretch #2
        myFavoriteMovies.insert("Happy Gilmore", at: 0)
        myMovieRatings.updateValue(3, forKey: "Happy Gilmore")
        
        
        tableView.reloadData()
    }
    
    @IBAction func whenStretch3ButtonPressed(_ sender: UIButton) {
        // MARK: - Stretch #3
        let removedIndex = Int(indexTextField.text!)! + 0
        let removedMovie = myFavoriteMovies.remove(at: removedIndex)
        removedMovieLabel.text = removedMovie
        myMovieRatings.removeValue(forKey: removedMovie)
        
        tableView.reloadData()
    }
}

