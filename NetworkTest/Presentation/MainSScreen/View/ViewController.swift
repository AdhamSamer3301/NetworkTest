//
//  ViewController.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import UIKit
import Combine

class ViewController: UIViewController {

  @IBOutlet weak var myTableView: UITableView!
  var viewModel: HomeViewModel!
  var cancellables = Set<AnyCancellable>()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    bindUI()
    // Do any additional setup after loading the view.
  }
  func setupUI() {
    myTableView.dataSource = self
    myTableView.delegate = self
    
    myTableView.register(
      UINib(nibName: "CustomTableViewCell", bundle: nil),
      forCellReuseIdentifier: "CustomTableViewCell")
  }
  func bindUI() {
    viewModel = HomeViewModel()
    viewModel.getRecipes()
    viewModel.recipesPublisher?.sink(receiveValue: { isPublished in
      if isPublished == true {
        print("Recipes are published")
        DispatchQueue.main.async {
          self.myTableView.reloadData()
        }
      }
    }).store(in: &cancellables)
  }

}

// MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.recipesCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
    guard let recipe = viewModel.getRecipeBy(id: indexPath.row) else { return cell }
    cell.configureCell(data: recipe)
    return cell
  }
  
  
}

