import Foundation

class CombatHistory{
  var victor: String
  var loser: String
  var pokpl1: String
  var pokpl2: String

  init(victor:String,loser:String,pokpl1:String,pokpl2:String){
    self.victor = victor
    self.loser = loser
    self.pokpl1 = pokpl1
    self.pokpl2 = pokpl2
  }

}

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
  var idPokemon:Int

  //Pokemon creation
  init(name: String, hp: Double, attack: Double, defense: Double, type: String,idPokemon:Int)
  {
    self.name = name
    self.hp = hp
    self.maxhp = hp
    self.attack = attack
    self.defense = defense
    self.type = type
    self.guardm = false
    self.level = 1
    self.idPokemon = idPokemon 
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
    print(self.name," guards")
  }

  //Repor Hitpoints
  func resetHp(){
    self.hp = self.maxhp
  }

  //Basic Attack
  func Battack(pokemon: Pokemon) {

    var damage = 0.0

    //If defense higher than attack only does 75% of the attack points as damage
    if(attack > pokemon.defense){
      damage = attack
    }else{
      damage = 0.75 * attack
    }

    //If Enemy Guarded Lower damage by 50%
    if(pokemon.guardm == true){
      pokemon.hp = pokemon.hp - (0.50 * damage)
    }else{
      pokemon.hp = pokemon.hp - damage
    }

    print(name," attacks ",pokemon.name,".")
    if(pokemon.hp < 0){
      print(pokemon.name," has ",0," hit points remaining.")
    }else{
      print(pokemon.name," has ",pokemon.hp," hit points remaining.")
    }
    
    pokemon.guardm = false
  }

  //Special Attack
  func Spattack(pokemon: Pokemon) {

    var multiplier = 1.0
    var damage = 0.0

    //If weakness: only 20% to damage count, If strength: +75% to damage count, If same type: No effect
    if(strength == pokemon.type){
      multiplier = 1.75
      print(name," attacks ",pokemon.name," with special attack. Super effective")
    }else if(type == pokemon.type){
      multiplier = 0
      print(name," attacks ",pokemon.name," with special attack. It has no effect")
      return
    }else{
      multiplier = 0.2
      print(name," attacks ",pokemon.name," with special attack. Not Very Effective")
    }

    //If defense higher than attack only does 75% of the attack points as damage
    if(attack > pokemon.defense){
      damage = attack * multiplier
    }else{
      damage = 0.75 * attack * multiplier
    }

    //If Enemy Guarded Lower damage by 50%
    if(pokemon.guardm == true){
      pokemon.hp = pokemon.hp - 0.50 * damage
    }else{
      pokemon.hp = pokemon.hp - damage
    }

    if(pokemon.hp < 0){
      print(pokemon.name," has ",0," hit points remaining.")
    }else{
      print(pokemon.name," has ",pokemon.hp," hit points remaining.")
    }
    pokemon.guardm = false
  }
}

extension Pokemon: Equatable{
  static func == (lhs: Pokemon, rhs: Pokemon) -> Bool{
    return (lhs.idPokemon == rhs.idPokemon)
  }
}

//Default Pokemon
var Charmander = Pokemon(name:"Charmander",hp:35.0, attack:55.0,defense:40.0, type:"Fire",idPokemon:1)

var Squirtle = Pokemon(name:"Squirtle",hp:44.0, attack:48.0,defense:65.0, type:"Water",idPokemon:2)

var Bulbasour = Pokemon(name:"Bulbasour",hp:45.0, attack:49.0,defense:49.0, type:"Plant",idPokemon:3)

// Array de combates
var lista_combats:[CombatHistory] = []

// Array de pokemons
var lista_pokemons = [Charmander,Squirtle,Bulbasour]


//Variaveis Globais
var choice_menu:Int
var password_admin:String = "123"
var PokEsc:Int = 0
var PokEscPl2:Int = 0
var combat = true
let winxp = 25
let reqxpinc = 25


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

  var pokemon = Pokemon(name:name!, hp:hp, attack:attack, defense:defense,type:type2,idPokemon:lista_pokemons[lista_pokemons.count-1].idPokemon+1)

 lista_pokemons.append(pokemon)


}

func editarPokemon() {
  // TODO
  var name:String?
  var hp:Double
  var attack:Double
  var defense:Double
  var choice:Int

  var type2:String


    for item in lista_pokemons {
      print(item.idPokemon,"-",item.name)  
  }
  
  print("Insira um nome do Pokemon para editar")
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
       break
    case 2:
       type =  Pokemon_enum.Water
       break
    case 3:
       type =  Pokemon_enum.Plant
       break
     default:
          print("Incorrect number. Choose from 1 to 3")
          
      break   
  }

  type2 = type.rawValue

  var pokemon = Pokemon(name:name!, hp:hp, attack:attack, defense:defense,type:type2,idPokemon:lista_pokemons[lista_pokemons.count-1].idPokemon+1)

 lista_pokemons.append(pokemon)


}

func RemovePokemon() {
  
    for item in lista_pokemons {
      print(item.idPokemon,"-",item.name)  
  }

  print("Qual o Pokemon a eliminar. Escolha o Id ->")
  var aux = Int(readLine()!)!

   for item in lista_pokemons where item.idPokemon == aux {

    if let index = lista_pokemons.firstIndex(of:item){
      lista_pokemons.remove(at: index)}
  }
}

func escolha(trigger:Bool) {

  for item in lista_pokemons {
      print(item.idPokemon,"-",item.name)  
  }

  print("Selecione o pokemon")
  if(trigger==false){
    PokEsc = Int(readLine()!)!
  }else{
    repeat{
    print("Pokemon ",PokEsc," Utilizador por player 1")
    PokEscPl2 = Int(readLine()!)!
    }while(PokEscPl2==PokEsc)
  }
  
  

}

func EndCombat(PokemonVictor:Pokemon,PokemonLoser:Pokemon) {
  var victor = ""
  var loser = ""
  print(PokemonVictor.name," earned ",winxp," xp\n")
  PokemonVictor.xp += winxp
  if(PokemonVictor.xp >= PokemonVictor.xpreq){
    PokemonVictor.level += 1
    PokemonVictor.xp = PokemonVictor.xpreq - PokemonVictor.xp
    PokemonVictor.xpreq += reqxpinc
    print(PokemonVictor.name," has reached level ",PokemonVictor.level,".\n",PokemonVictor.xpreq - PokemonVictor.xp," xp until next level")
  }
  PokemonVictor.resetHp()
  PokemonLoser.resetHp()

  if(PokemonVictor.idPokemon == PokEsc){
    victor = "Player1"
    if(PokemonLoser.idPokemon == PokEscPl2){
      loser = "Player2"
    }else{
      loser = "CPU"
    }
  }else if(PokemonVictor.idPokemon == PokEscPl2){
    victor = "Player2"
    loser = "Player1"
  }else{
    victor = "CPU"
    loser = "Player1"
  }

  var combatlog = CombatHistory(victor:victor,loser:loser,pokpl1:PokemonVictor.name,pokpl2:PokemonLoser.name)

  lista_combats.append(combatlog)

  print("\nO jogador: ",combatlog.victor, "venceu o combate.\n")



  combat = false
}

func escape(){
  var escapevalue = 50
  var escapecalc = Int.random(in:1 ... 100)
  if(escapecalc > escapevalue){
    print("\nFailed to escape\n")
  }else{
    print("\nEscaped successfully\n")
    combat = false
  }
}

func PlayerTurn(PokemonPl2:Pokemon,PokemonPl:Pokemon) -> Bool {
print(" \n1 - Atacar",
        "\n2 - Ataque Especial",
        "\n3 - Defender",
        "\n4 - Fugir")
    var Esc = 1
    Esc = Int(readLine()!)!

    switch(Esc){
      case 1:
            PokemonPl.Battack(pokemon:PokemonPl2)
       if(PokemonPl2.hp <= 0){
        EndCombat(PokemonVictor:PokemonPl,PokemonLoser:PokemonPl2)
       }
        break
      case 2:
            PokemonPl.Spattack(pokemon:PokemonPl2)
       if(PokemonPl2.hp <= 0){
         EndCombat(PokemonVictor:PokemonPl,PokemonLoser:PokemonPl2)
       }
        break
      case 3:
            PokemonPl.guardmove()
        break
      case 4:
          escape()
        break
      default:
        print("Invalido")
        break
    }

  return false
}

func AiTurn(Pokemonai:Pokemon,PokemonPl:Pokemon) -> Bool {
  var escapecalc = Int.random(in:1 ... 120)
  switch(escapecalc){
    case 1 ... 50:
       Pokemonai.Battack(pokemon:PokemonPl)
       if(PokemonPl.hp <= 0){
        EndCombat(PokemonVictor:Pokemonai,PokemonLoser:PokemonPl)
       }
      break
    case 51 ... 100:
       Pokemonai.Spattack(pokemon:PokemonPl)
       if(PokemonPl.hp <= 0){
         EndCombat(PokemonVictor:Pokemonai,PokemonLoser:PokemonPl)
       }
      break
    case 101 ... 120:
      Pokemonai.guardmove()
      break
    default:
    break
  }
  return true
}

func combathistorylist(){
  for item in lista_combats {
      print("Victor:",item.victor," - Pokemon:",item.pokpl1," - Loser:",item.loser," - Pokemon:",item.pokpl2)  
  }
}

func combatePlvsPl(){
  combat = true
  var turn = true
  var indexPokPl1 = 0
  var indexPokPl2 = 0
  for item in lista_pokemons where item.idPokemon == PokEsc {
          if let index = lista_pokemons.firstIndex(of:item){
           indexPokPl1 = index
          }
   }
   for item in lista_pokemons where item.idPokemon == PokEscPl2 {
          if let index = lista_pokemons.firstIndex(of:item){
           indexPokPl2 = index
          }
   }
    print("Player1",lista_pokemons[indexPokPl1].name,
        "\nHP -",lista_pokemons[indexPokPl1].hp,
        "\nAtaque -",lista_pokemons[indexPokPl1].attack,
        "\nDefesa -",lista_pokemons[indexPokPl1].defense,
        "\ntipo -",lista_pokemons[indexPokPl1].type)

    print("Player2",lista_pokemons[indexPokPl2].name,
        "\nHP -",lista_pokemons[indexPokPl2].hp,
        "\nAtaque -",lista_pokemons[indexPokPl2].attack,
        "\nDefesa -",lista_pokemons[indexPokPl2].defense,
        "\ntipo -",lista_pokemons[indexPokPl2].type)

  while(combat){
    if(turn==true){
     turn = PlayerTurn(PokemonPl2:lista_pokemons[indexPokPl2],PokemonPl:lista_pokemons[indexPokPl1])
    }else{
      PlayerTurn(PokemonPl2:lista_pokemons[indexPokPl1],PokemonPl:lista_pokemons[indexPokPl2])
      turn = true
    }
  }

}

func combateRandom()  {
  combat = true
  var turn = true
  var indexai = 0
  var indexPokPl = 0
  let max = lista_pokemons[lista_pokemons.count-1].idPokemon
  
  var nums = [Int](1...max)
  nums.remove(at: PokEsc-1)

  let random = Int.random(in:1 ... nums.count)
   for item in lista_pokemons where item.idPokemon == nums[random-1] {

    if let index = lista_pokemons.firstIndex(of:item){
      indexai = index
      print("Adversario",lista_pokemons[index].name,
        "\nHP -",lista_pokemons[index].hp,
        "\nAtaque -",lista_pokemons[index].attack,
        "\nDefesa -",lista_pokemons[index].defense,
        "\ntipo -",lista_pokemons[index].type)
    }
   }
   for item in lista_pokemons where item.idPokemon == PokEsc {
          if let index = lista_pokemons.firstIndex(of:item){
           indexPokPl = index
          }
   }


  while(combat){
    if(turn==true){
     turn = PlayerTurn(PokemonPl2:lista_pokemons[indexai],PokemonPl:lista_pokemons[indexPokPl])
    }else{
      turn = AiTurn(Pokemonai:lista_pokemons[indexai],PokemonPl:lista_pokemons[indexPokPl])
    }
  }

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
             var choice_menuad = 0
              var f2 = true
                    escolha(trigger:false)
                      while f2 {
                        choice_menuad = MenuPlay()
                        f2 = LerMenuPlay(choice:choice_menuad)
                      }
                
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
            RemovePokemon()
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
          combateRandom()
            break

        case 2:
          escolha(trigger:true)
          combatePlvsPl()
            break

        case 3:
          combathistorylist()
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



var fl = true

while fl {
  choice_menu = MenuMain()
  fl = LerMenuMain(choice_menu:choice_menu)
}