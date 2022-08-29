//
//  PokemonViewController.swift
//  MVC-Example
//
//  Created by Proteco on 27/08/22.
//

import UIKit

class PokemonViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var pokemons: [Pokemon] = []
    private let manager = PokemonDataManager()
    private var selectedPokemon : Pokemon!
    
    @IBOutlet weak var PokemonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        manager.fetch()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.pokemonCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as! PokemonCell
        let pokemon = manager.pokemonAtIndex(index: indexPath.row)
        cell.pokemonImage.image = UIImage.init(named: pokemon.image)
        cell.pokemonName.text = pokemon.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPokemon = manager.pokemonAtIndex(index: indexPath.row)
        self.performSegue(withIdentifier: "PokemonInfoSegue", sender: Self.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PokemonInfoViewController
        destination.recivedPokemon = selectedPokemon
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
