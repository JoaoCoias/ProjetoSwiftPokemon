import Foundation


class Carro{

  var marca:String
  var id_carro:Int
  var cilindrada:Int
  var ano:Int
  var preço:Int
  var id_Pessoa:Int

  init(marca:String , cilindrada:Int, ano:Int , preço:Int,Id_carro:Int,id_Pessoa:Int)
  {
    self.marca = marca
    self.cilindrada = cilindrada
    self.ano = ano
    self.preço = preço
    self.id_Pessoa = id_Pessoa
    self.id_carro = Id_carro
  }

}

class Pessoa{
  
  var id:Int

  init(id:Int)
  {
    self.id = id
  }
}




class Vendedor:Pessoa{

  var nome:String
  var companhia:String

  init(id:Int,nome:String ,companhia:String)
  {
    
    self.nome = nome
    self.companhia = companhia
    super.init(id:id)
  }

 
  func pedidoCarro(){
  }

}//end vendedor

class Cliente:Pessoa{

var nome:String
var apelido:String

init(id:Int,nome:String, apelido:String)
{
  self.nome = nome
  self.apelido = apelido
  super.init(id:id)
}

}//end cliente





//print("\(carro1.tipo)")

var vendedor1 = Vendedor(id:1,nome:"Antonio", companhia:"CorsaAuto")
var cliente1 = Cliente(id:2,nome:"Joao", apelido:"Santos")

var vendedor2 = Vendedor(id:2,nome:"Rodolfo", companhia:"AMgAuto")
var cliente2 = Cliente(id:3,nome:"Joao", apelido:"Pereira")

var vendedor3 = Vendedor(id:4,nome:"Carlos", companhia:"MGAuto")
var cliente3 = Cliente(id:5,nome:"Sergio", apelido:"Santos")

var carro1 = Carro(marca:"Opel Corsa",cilindrada:1200,ano:1998,preço:1200,Id_carro:1,id_Pessoa:0)
var carro2 = Carro(marca:"Fiat Punto",cilindrada:1400,ano:2003,preço:3200,Id_carro:2,id_Pessoa:0)
var carro3 = Carro(marca:"Reanult Clio",cilindrada:1600,ano:1995,preço:2700,Id_carro:3,id_Pessoa:0)

var vendedor_lista = [vendedor1,vendedor2,vendedor3]
var cliente_lista = [cliente1,cliente2,cliente3]
var carro_lista = [ carro1,carro2,carro3]


func Menu() -> Int{

var flag:Int = 0

print(
  "-----------------\n",
  "1 - Compra carro\n",
  "2 - Vender Carro\n",
  "3 - Listar Carro\n",
  "0 - Sair        \n",
  "-----------------")

flag = Int(readLine()!)!

return flag
}

//variavel que guarda a escolha

var choiceG:Int
var id_Cliente:Int = 0
var flag_cliente:Bool = false

func comprar(ccliente:Int){

  var flag = true
  var id_Carro:Int
  while flag {
    
  

  print("Selecione um veiculo\n",
        "0 - para sair do menu")
  for item in carro_lista {
    if item.id_Pessoa == 0 {
      print(item.id_carro,"-",item.marca)
    }
  }     

  id_Carro = Int(readLine()!)!

  if id_Carro == 0 {
    flag = false
  }
  else {
    flag = true
  }

  for item in carro_lista {
    if id_Carro == item.id_carro {
      item.id_Pessoa = ccliente
      print("O carro",item.marca)
      flag = false
    }
  }

  }


}

func carrosDisp() -> Int {
  var cont = 0
  for item in carro_lista {
    if item.id_Pessoa == 0 {
    cont=cont + 1
    }
  }
  return cont
}

func vender() {
  var marca:String?
  var cilindrada:Int
  var ano:Int
  var preco:Int
  print("Insira um carro para venda")
  //marca:"Reanult Clio",cilindrada:1600,ano:1995,preço:2700,Id_carro:3,id_Pessoa:0

  print("Insira marca carro para venda")

  marca = readLine()

  print("Insira a cilindrada")
  cilindrada = Int(readLine()!)!

  print("Insira o ano do carro")
  ano = Int(readLine()!)!

  print("Insira o preço do carro")
  preco = Int(readLine()!)!

  var car = Carro(marca:marca!,cilindrada:cilindrada,ano:ano,preço:preco,Id_carro:carro_lista[carro_lista.count-1].id_carro+1,id_Pessoa:0)


  carro_lista.append(car)

  print(carro_lista[carro_lista.count-1].id_carro)
  
  
  
}


func listarPessoa(ID:Int) {

  for item in carro_lista where item.id_Pessoa == ID {
      print(item.marca,"-",item.id_carro)
  }
  
}

func LerMenu(choice:Int) -> Bool{


var dev:Bool = true;





		switch (choice) {
        case 1:
            
            print("Introduza um cliente [1 a 3] -> ")
            id_Cliente = Int(readLine()!)!
            flag_cliente =  retornaCliente(id:id_Cliente)
            if(flag_cliente)
            {
              comprar(ccliente:id_Cliente)
              //print("carros disponiveis",carrosDisp())
              
            }

          
            break;

        case 2:
          vender()

            break;

         case 3:
         print("Insira a pessoa para listar carros")
           var lid = Int(readLine()!)!
            listarPessoa(ID:lid)
            break;
        default:// Outras opcoes
			   dev = false;
			      break;}

            return dev
}






 //implementar func retornar um id

func retornaCliente(id:Int) -> Bool
{
      for cl in cliente_lista {
          if(cl.id == id)
          {
            return true
          }
       }

  return false

}

var fl = true

while fl {
  choiceG = Menu()
  fl = LerMenu(choice:choiceG)
}

 
