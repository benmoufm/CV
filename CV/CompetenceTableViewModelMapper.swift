//
//  CompetenceTableViewModelMapper.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/10/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct CompetenceTableViewModelMapper {

    func map() -> CompetenceTableViewModel {
        // Titles
        let developmentCell = CompetenceCellViewModelMapper(label: "development_cells".localized, isTitleCell: true).map()
        let developmentToolsCell = CompetenceCellViewModelMapper(label: "development_tools_cells".localized, isTitleCell: true).map()
        let patternsCell = CompetenceCellViewModelMapper(label: "pattern_cells".localized, isTitleCell: true).map()
        let methodsCell = CompetenceCellViewModelMapper(label: "methods_cells".localized, isTitleCell: true).map()
        let languageCell = CompetenceCellViewModelMapper(label: "languages_cells".localized, isTitleCell: true).map()
        let specialSkillsCell = CompetenceCellViewModelMapper(label: "special_skills_cells".localized, isTitleCell: true).map()

        // Cells
        let swiftCell = CompetenceCellViewModelMapper(label: "competence_swift".localized, isTitleCell: false).map()
        let javaCell = CompetenceCellViewModelMapper(label: "competence_java".localized, isTitleCell: false).map()
        let cSharpCell = CompetenceCellViewModelMapper(label: "competence_c_sharp".localized, isTitleCell: false).map()
        let htmlCell = CompetenceCellViewModelMapper(label: "competence_html".localized, isTitleCell: false).map()
        let xcodeCell = CompetenceCellViewModelMapper(label: "competence_xcode".localized, isTitleCell: false).map()
        let androidStudioCell = CompetenceCellViewModelMapper(label: "competence_android_studio".localized, isTitleCell: false).map()
        let mvcCell = CompetenceCellViewModelMapper(label: "competence_mvc".localized, isTitleCell: false).map()
        let cleanCodeCell = CompetenceCellViewModelMapper(label: "competence_clean_code".localized, isTitleCell: false).map()
        let agileCell = CompetenceCellViewModelMapper(label: "competence_agile".localized, isTitleCell: false).map()
        let gitCell = CompetenceCellViewModelMapper(label: "competence_git".localized, isTitleCell: false).map()
        let gerritCell = CompetenceCellViewModelMapper(label: "competence_gerrit".localized, isTitleCell: false).map()
        let englishCell = CompetenceCellViewModelMapper(label: "competence_english".localized, isTitleCell: false).map()
        let spanishCell = CompetenceCellViewModelMapper(label: "competence_spanish".localized, isTitleCell: false).map()
        let italianCell = CompetenceCellViewModelMapper(label: "competence_italian".localized, isTitleCell: false).map()
        let koreanCell = CompetenceCellViewModelMapper(label: "competence_korean".localized, isTitleCell: false).map()
        let violinCell = CompetenceCellViewModelMapper(label: "competence_violin".localized, isTitleCell: false).map()
        let drawingCell = CompetenceCellViewModelMapper(label: "competence_drawing".localized, isTitleCell: false).map()

        return CompetenceTableViewModel(tableCells: [developmentCell, swiftCell, javaCell, cSharpCell, htmlCell,
                                                     developmentToolsCell, xcodeCell, androidStudioCell,
                                                     patternsCell, mvcCell, cleanCodeCell,
                                                     methodsCell, agileCell, gitCell, gerritCell,
                                                     languageCell, englishCell, spanishCell, italianCell, koreanCell,
                                                     specialSkillsCell, violinCell, drawingCell])
    }
}
