//
//  GetFromApiViewController.swift
//  MeowMeowApp
//
//  Created by coder on 1/14/21.
//

import UIKit
import SnapKit
import Alamofire

class GetFromApiViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var listCocktailData: [Cocktail] = []
    var spinner = UIActivityIndicatorView(style: .large)
    var loadingView: UIView = UIView()
    
    let _view: GetFromApiView = {
        let view = GetFromApiView()
        return view
    }()
    
    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0.5
        layout.minimumLineSpacing = 0.5
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    override func viewDidLoad() {
        self.setupLayout()
        self.mainCollectionView.register(MainCell.self, forCellWithReuseIdentifier: "cellId")
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        
        title = "GET API"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(onBackPrevious))
        
        self.getDataFromApi()
    }
    
    func getDataFromApi() {
        self.showActivityIndicator()
        AF.request("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a").responseJSON { (response) in
            let value = response.value as! [String: Any]
            let drinksValue = value["drinks"] as! [Any]
            for i in drinksValue {
                let drink = i as! [String: Any]
                let strIngred1 = drink["strIngredient1"] as! String
                let strIngred2 = drink["strIngredient2"] as! String
                
                self.listCocktailData.append(Cocktail(strIngredient1: strIngred1, strIngredient2: strIngred2, strIngredient3: "strIngred3"))
            }
            self.mainCollectionView.reloadData()
            self.hideActivityIndicator()
        }
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor(named: "#444444")
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10

            self.spinner = UIActivityIndicatorView(style: .large)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)

            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
    }
    
    @objc func onBackPrevious() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        dismiss(animated: false)
    }
    
    func setupLayout() {
        self.view.addSubview(self._view)
        self._view.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self._view.addSubview(self.mainCollectionView)
        self.mainCollectionView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(60)
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Collection view setting
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listCocktailData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MainCell
        cell.titleLabel.text = self.listCocktailData[indexPath.row].strIngredient1
        
        let pressGesture = UITapGestureRecognizer(target: self, action: #selector(self.pressGetstureDetected(_:)))
        cell.addGestureRecognizer(pressGesture)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    @objc func pressGetstureDetected(_ sender: UITapGestureRecognizer){
        let point = sender.location(in: self.mainCollectionView)
        if let indexPath = self.self.mainCollectionView.indexPathForItem(at: point) {
            print(#function, indexPath.row)
            let itemTitle = self.listCocktailData[indexPath.row].strIngredient1
            self.showResultAlert(message: itemTitle + "has been selected !")
        }
    }
    
    func showResultAlert(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

