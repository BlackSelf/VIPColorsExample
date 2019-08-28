//
//  LocalDB.swift
//  Colors
//
//  Created by Alexander Vorobyev on 28/08/2019.
//  Copyright © 2019 Utkonos. All rights reserved.
//

import Foundation

// просто хранилище на время сессии
class LocalDB {
    
    static var shared = LocalDB()
    private init() {
        generateColors()
    }
    
    private var colors: [Color] = []
    
    func getColors() -> [Color] {
        return colors
    }
    
    func getColor(by id: ColorID) -> Color? {
        return colors.first(where: { $0.id == id })
    }
    
    // MARK: - Private
    
    private func generateColors() {
        guard colors.isEmpty, let path = Bundle.main.path(forResource: "Colors", ofType: "json") else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let colors = try decoder.decode([Color].self, from: data)
            self.colors = colors
        } catch {
            print(error.localizedDescription)
        }
    }
}
