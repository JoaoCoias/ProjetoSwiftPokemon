import Foundation

class Pokemon {
  let name: String
  var hp: Double
  var maxhp: Double
  var attack: Double
  var defense: Double
  var type: String
  var weakness: String
  var strength: String
  var xp: Int
  var xpreq: Int
  var level : Int
  var guardm: Bool

  //Pokemon creation
  init(name: String, hp: Double, attack: Double, defense: Double, type: String)
  {
    self.name = name
    self.hp = hp
    self.maxhp = hp
    self.attack = attack
    self.defense = defense
    self.type = type
    self.guardm = false
    self.level = 1
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

  //Guard Move
  func guardmove(){
    self.guardm = true
  }

  //Repor Hitpoints
  func resetHp(){
    self.hp = self.maxhp
  }

  //Basic Attack
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

  //Special Attack
  func spattack(pokemon: Pokemon) {

    var multiplier = 1.0
    var damage = 0.0

    //If weakness: only 20% to damage count, If strength: +75% to damage count, If same type: No effect
    if(strength == pokemon.type){
      multiplier = 1.75
      print("(name) attacks (pokemon.name) with special attack. Super effective")
    }else if(type == pokemon.type){
      multiplier = 0
      print("(name) attacks (pokemon.name) with special attack. It has no effect")
      return
    }else{
      multiplier = 0.2
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


//Tipos de Pokemon nivel1
var Charmander = Pokemon(name:"Charmander",hp:35.0, attack:55.0,defense:40.0, type:"Fire")

var Squirtle = Pokemon(name:"Squirtle",hp:44.0, attack:48.0,defense:65.0, type:"Water")

var Bulbasour = Pokemon(name:"Bulbasour",hp:45.0, attack:49.0,defense:49.0, type:"Plant")

//Tipos de Pokemon nivel2


//Tipos de Pokemon nivel3

// Array de pokemons
var lista_pokemons = [Charmander,Squirtle,Bulbasour]


//Variaveis Globais
var choice_menu:Int
var password_admin:String = "123"

enum Pokemon_enum:String {
        case Fire = "Fire"
        case Water = "Water"
        case Plant = "Plant"
    }



func AddPokemon() {

  var name:String?
  var hp:Double
  var attack:Double
  var defense:Double
  var choice:Int

  var type2:String

  
  print("Insira um nome do Pokemon")
  name = readLine()
  print("Insira o Hp do Pokemon")
  hp = Double(readLine()!)!
  print("Insira o ataque do Pokemon")
  attack = Double(readLine()!)!
  print("Insira a defesa do Pokemon")
  defense = Double(readLine()!)!
  print("Insira o tipo 1:Fire , 2:Water , 3:Plant")
  choice = Int(readLine()!)!

var type:Pokemon_enum = .Fire

switch(choice)
  {
    case 1:
       type =  Pokemon_enum.Fire
   
    case 2:
       type =  Pokemon_enum.Water

    case 3:
       type =  Pokemon_enum.Plant
    
     default:
          print("Incorrect number. Choose from 1 to 3")
          
      break   
  }

  type2 = type.rawValue

  var pokemon = Pokemon(name:name!, hp:hp, attack:attack, defense:defense,type:type2)


  lista_pokemons.append(pokemon)

  
}



///////////////////////
/////MENU PRINCIPAL////
///////////////////////

func MenuMain() -> Int{

var flag:Int = 0

print(
  "----------------\n",
  "1 - Admin Menu  \n",
  "2 - Play Game   \n",
  "0 -    Exit     \n",
  "------------------")

flag = Int(readLine()!)!

return flag
}

///////////////////////
///// MENU ADMIN //////
///////////////////////

func MenuAdmin() -> Int{

var flag:Int = 0

print(
  "----------------..\n",
  "1 - Add Pokemon   \n",
  "2 - Remove Pokemon\n",
  "3 - Edit Pokemon  \n",
  "0 -     Exit      \n",
  "--------------------")

flag = Int(readLine()!)!

return flag
}

///////////////////////
///// MENU PLAY ///////
///////////////////////

func MenuPlay() -> Int{

var flag:Int = 0

print(
  "----------------------------------\n",
  "1 - Play Against Random Opponent  \n",
  "2 - Play Against Another Player   \n",
  "3 - Battle History                \n",
  "0 -          Exit                 \n",
  "------------------------------------")

flag = Int(readLine()!)!

return flag
}


//////////////////
///// Ler Menu ///
/////////////////

func LerMenuMain(choice_menu:Int) -> Bool{

var dev:Bool = true
var pass:String

		switch (choice_menu) {
        case 1:
            print("Introduza a password de aministrador :")
            pass = readLine()!
            if(pass == password_admin)
                    {
                      var choice_menuad = 0
                      var f2 = true
                      while f2 {
                        choice_menuad = MenuAdmin()
                        f2 = LerMenuAdmin(choice:choice_menuad)
                      }
                    }
            else{
                  print("Password incorrecta, tente de novo. ")

            }        
            break

        case 2:
                MenuPlay()
            break

         case 0:
            dev = false
            break
        default:// Outras opcoes
			      dev = false
			      break    
           
}
 return dev
}

func LerMenuAdmin(choice:Int) -> Bool{

var dev:Bool = true

		switch (choice) {
        case 1:
            AddPokemon()
            break

        case 2:

            break

        case 3:
            break

        case 0:
        dev = false
            break


        default:// Outras opcoes
			   dev = false
			      break      
       
}
     return dev
}

func LerMenuPlay(choice:Int) -> Bool{

var dev:Bool = true

		switch (choice) {
        case 1:
          
            break

        case 2:

            break

        case 3:
            break

        case 0:
            break

            
        default:// Outras opcoes
			   dev = false
			      break    
       
}     

     return dev
}



var fl = true

while fl {
  choice_menu = MenuMain()
  fl = LerMenuMain(choice_menu:choice_menu)
}