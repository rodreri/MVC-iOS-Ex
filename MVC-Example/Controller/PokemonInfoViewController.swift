//
//  PokemonInfoViewController.swift
//  MVC-Example
//
//  Created by Proteco on 27/08/22.
//

import UIKit

class PokemonInfoViewController: UIViewController {
    
    var recivedPokemon : Pokemon!

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonMove: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonAbility: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pokemonImage.image = UIImage.init(named: recivedPokemon.image)
        pokemonName.text = recivedPokemon.name
        pokemonMove.text = recivedPokemon.move
        pokemonAbility.text = recivedPokemon.ability
        pokemonWeight.text = recivedPokemon.weight
    }
}
