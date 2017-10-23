//
//  SkillCategory.swift
//  CV
//
//  Created by Mélodie Benmouffek on 23/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

enum SkillCategory: String, CustomStringConvertible {

    case development = "development_skills_category"
    case developmentTools = "development_tools_skills_category"
    case patterns = "pattern_skills_category"
    case methods = "methods_skills_category"
    case languages = "languages_skills_category"
    case specialSkills = "special_skills_category"

    var description: String { return rawValue.localized }
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
