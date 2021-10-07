import Foundation
//teste teste  push 3
class Pokemon {
  let name: String
  var hp: Double
  var attack: Double
  var defense: Double
  var type: String
  var weakness: String
  var strength: String
  var xp: Int
  var xpreq: Int
  var guardm: Bool

  init(name: String, hp: Double, attack: Double, defense: Double, type: String)
  {
    self.name = name
    self.hp = hp
    self.attack = attack
    self.defense = defense
    self.type = type
    self.guardm = false
    if(type == "Fire"){
      weakness = "Water"
      strength = "Plant"
    }else if(type == "Water"){
      weakness = "Plant"
      strength = "Fire"
    }else{
      weakness = "Fire"
      strength = "Water"
    }
    xp = 0
    xpreq = 50
  }

  func guardmove(){
    self.guardm = true
  }

  func attack(pokemon: Pokemon) {
    var damage = 0.0
    //If defense higher than attack only does 75% of the attack points as damage
    if(attack > pokemon.defense){
      damage = attack
    }else{
      damage = round(0.75 * attack)
    }

    //If Enemy Guarded Lower damage by 50%
    if(pokemon.guardm == true){
      pokemon.hp = pokemon.hp - round(0.50 * damage)
    }else{
      pokemon.hp = pokemon.hp - damage
    }
    print("(name) attacks (pokemon.name).")
    print("(pokemon.name) has (pokemon.hp) hit points remaining.")
    pokemon.guardm = false
  }

  func spattack(pokemon: Pokemon) {
    //If weakness: only 20% to damage count, If strength: +75% to damage count, If same type: No effect
    var multiplier = 1.0
    var damage = 0.0
    if(strength == pokemon.type){
      multiplier = 1.75
      print("(name) attacks (pokemon.name) with special attack. Super effective")
    }else if(strength == pokemon.type){
      multiplier = 0
      print("(name) attacks (pokemon.name) with special attack. It has no effect")
      return
    }else{
      multiplier = 1
      print("(name) attacks (pokemon.name) with special attack. Not Very Effective")
    }

    //If defense higher than attack only does 75% of the attack points as damage
    if(attack > pokemon.defense){
      damage = round(attack * multiplier)
    }else{
      damage = round(0.75 * attack * multiplier)
    }

    //If Enemy Guarded Lower damage by 50%
    if(pokemon.guardm == true){
      pokemon.hp = pokemon.hp - round(0.50 * damage)
    }else{
      pokemon.hp = pokemon.hp - damage
    }

      print("(pokemon.name) has (pokemon.hp) hit points remaining.")
      pokemon.guardm = false
  }
}