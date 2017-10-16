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

        // Cells
        let swiftCell = CompetenceCellViewModelMapper(label: "swift_cell".localized, isTitleCell: false).map()
        let javaCell = CompetenceCellViewModelMapper(label: "java_cell".localized, isTitleCell: false).map()
        let cSharpCell = CompetenceCellViewModelMapper(label: "c_sharp_cell".localized, isTitleCell: false).map()
        let htmlCell = CompetenceCellViewModelMapper(label: "html_cell".localized, isTitleCell: false).map()
        let xcodeCell = CompetenceCellViewModelMapper(label: "xcode_cell".localized, isTitleCell: false).map()
        let androidStudioCell = CompetenceCellViewModelMapper(label: "android_studio_cell".localized, isTitleCell: false).map()
        let mvcCell = CompetenceCellViewModelMapper(label: "mvc_cell".localized, isTitleCell: false).map()
        let cleanCodeCell = CompetenceCellViewModelMapper(label: "clean_code_cell".localized, isTitleCell: false).map()
        let agileCell = CompetenceCellViewModelMapper(label: "agile_cell".localized, isTitleCell: false).map()
        let gitCell = CompetenceCellViewModelMapper(label: "git_cell".localized, isTitleCell: false).map()
        let gerritCell = CompetenceCellViewModelMapper(label: "gerrit_cell".localized, isTitleCell: false).map()
        let englishCell = CompetenceCellViewModelMapper(label: "english_cell".localized, isTitleCell: false).map()
        let spanishCell = CompetenceCellViewModelMapper(label: "spanish_cell".localized, isTitleCell: false).map()
        let italianCell = CompetenceCellViewModelMapper(label: "italian_cell".localized, isTitleCell: false).map()
        let koreanCell = CompetenceCellViewModelMapper(label: "korean_cell".localized, isTitleCell: false).map()

        return CompetenceTableViewModel(tableCells: [developmentCell, swiftCell, javaCell, cSharpCell, htmlCell,
                                                     developmentToolsCell, xcodeCell, androidStudioCell,
                                                     patternsCell, mvcCell, cleanCodeCell,
                                                     methodsCell, agileCell, gitCell, gerritCell,
                                                     languageCell, englishCell, spanishCell, italianCell, koreanCell])
    }
}
