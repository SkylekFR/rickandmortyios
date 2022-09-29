//
//  Router.swift
//  rickandmorty
//
//  Created by Emilien on 29/09/2022.
//

import Foundation
import SwiftUI

enum MainActivities: Int {
    case mainView
    case detailView
}

class Router : ObservableObject {
    @Published var currentActivity: MainActivities = .mainView
}
