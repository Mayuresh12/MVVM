//
//  ViewModel.swift
//  MVVMSample
//
//  Created by Mayuresh Rao on 12/3/20.
//

import Foundation

class ViewModel {
    private var simpleModel: [Model]
    
    // computed property
    var count: Int {
        return simpleModel.count
    }
    
    init() {
        simpleModel = [
            Model(text: "Orange", color: .orange),
            Model(text: "Blue", color: .blue),
            Model(text: "Green", color: .green),
            Model(text: "Purple", color: .purple),
            Model(text: "Cyan", color: .cyan)

        ]
    }
    
    func getModelAt(_ index: Int) -> Model {
        return simpleModel[index]
    }
}
