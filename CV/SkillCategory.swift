//
//  SkillCategory.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

enum SkillCategory: Int, CustomStringConvertible {

    case development
    case developmentTools
    case patterns
    case methods
    case languages
    case specialSkills

    var description: String {
        switch self {
        case .development:
            return "development_skills_category".localized
        case .developmentTools:
            return "development_tools_skills_category".localized
        case .patterns:
            return "pattern_skills_category".localized
        case .methods:
            return "methods_skills_category".localized
        case .languages:
            return "languages_skills_category".localized
        case .specialSkills:
            return "special_skills_category".localized
        }
    }
    var icon: UIImage {
        switch self {
        case .development:
            return #imageLiteral(resourceName: "developmentSkillsCategoryIcon")
        case .developmentTools:
            return #imageLiteral(resourceName: "developmentToolsSkillsCategoryIcon")
        case .patterns:
            return #imageLiteral(resourceName: "patternSkillsCategoryIcon")
        case .methods:
            return #imageLiteral(resourceName: "methodSkillsCategoryIcon")
        case .languages:
            return #imageLiteral(resourceName: "languagesSkillsCategoryIcon")
        case .specialSkills:
            return #imageLiteral(resourceName: "specialSkillsCategoryIcon")
        }
    }
}
