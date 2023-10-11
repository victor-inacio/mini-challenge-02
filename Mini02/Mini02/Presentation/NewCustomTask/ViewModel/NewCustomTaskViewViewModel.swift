//
//  NewCustomTaskViewViewModel.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 09/10/23.
//

import UIKit

struct Form {
    var name: String?
    var description: String?
    var level: DifficultyLevel?
    
    func validate() -> Bool {
        
        guard let name = self.name else {
            return false
        }
        
        guard let description = self.description else {
            return false
        }
        
        guard let level = level else {
            return false
        }
        
        return true
    }
}

class NewCustomTaskViewViewModel: ViewModel {
    
    let viewController: NewCustomTaskViewController
    let data: Observable<[DifficultyLevel]> = Observable([])
    let error: Observable<String?> = Observable(nil)
    let formData: Observable<Form> = Observable(.init())
    
    init(viewController: NewCustomTaskViewController) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        fetchDifficulties()
    } 
    
    func submit(onSuccess: @escaping () -> Void) {
        
        guard validateFields() else {
            self.error.value = "Preencha todos os campos"
            return
        }
        
        do { 
            let form = self.formData.value
            
            try Task.addTask(name: form.name!, description: form.description!, difficultyLevel: form.level!)
            
            
            
            onSuccess()
        } catch {
            self.error.value = error.localizedDescription
        }
    }
    
    private func validateFields() -> Bool {
        return formData.value.validate()
    } 
    
     
    
     
    private func fetchDifficulties() {
        do {
            let data = try DifficultyLevel.getAll()
            
            self.data.value = data
        } catch {
            self.error.value = error.localizedDescription
        }
    }
    
}
