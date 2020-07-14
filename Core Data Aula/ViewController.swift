//
//  ViewController.swift
//  Core Data Aula
//
//  Created by Bruno Alves da Silva on 12/07/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Recuperando a classe AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //Criando um contexto
        let context = appDelegate.persistentContainer.viewContext
        
        //Criando uma requisicao
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        //Ordenando os itens A-Z
        let ordenacaoAZ = NSSortDescriptor(key: "descricao", ascending: true)
        
        //Pesquisando dados especificos
        //let predicate = NSPredicate(format: "descricao == %@", "Playstation 4")
        
        //Aplicando o filtro
        requisicao.sortDescriptors = [ordenacaoAZ]
        //requisicao.predicate = predicate
        
        //Recuperando os produtos
        do {
            let produtos = try context.fetch(requisicao)
            if produtos.count > 0 {
                for produto in produtos as! [NSManagedObject] {
                    if let descricao = produto.value(forKey: "descricao") {
                        if let cor = produto.value(forKey: "cor") {
                            if let preco = produto.value(forKey: "preco") {
                                print(String(describing: descricao) + " | " + String(describing: cor) + " | " + String(describing: preco))
                                
                                //remover um produto
                                context.delete(produto)
                                
                                //Efetuando a exclusao
                                /*do {
                                    try context.save()
                                    print("Excluido com sucesso")
                                } catch {
                                    print("Erro ao excluir")
                                }*/
                                
                                //Atualizando valores
                                /*
                                produto.setValue(199.00, forKey: "preco")
                                produto.setValue("MacBook Pro 13", forKey: "descricao")
                                produto.setValue("Branca", forKey: "cor")
                                */
                                
                                //Atualizando de fato os valores
                                /*do {
                                    try context.save()
                                } catch {
                                    print("Erro ao atualizar")
                                }*/
                            }
                        }
                    }
                }
            } else {
                print("Nenhum produto encontrado")
            }
        } catch {
            print("Nao foi possivel recuperar os dados")
        }
        
        //Criando a entidade
        /*let usuario = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
        
        //Passando as informacoes para o banco
        usuario.setValue("Prata", forKey: "cor")
        usuario.setValue("Macbook Pro 15", forKey: "descricao")
        usuario.setValue(150.00, forKey: "preco")
        
        //Salvando as informacoes
        do {
            try context.save()
            print("Saaaaalvo")
        } catch {
            print("Nao foi possivel salvar as informacoes")
        }*/
    }
}

