//
//  JournalVIewModel.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation
import SwiftUI

class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = [Journal.default]
    @Published var errorMessage: String = ""
    @Published var titleText = ""
    @Published var noteText = ""
    @Published var mood = ""
    @Published var date = Date()
    var dateText: String {
        Formatter.displayDateFormat.string(from: date)
    }
    var moodArray = ["excellent", "happy", "good", "sad", "awful"]
    var moodDict = ["excellent": 10, "happy": 6, "good": 4, "sad": 2, "awful": 0]
    var journalService = JournalService()
    
    func fetchJournals(_ session: APIServiceManager) {
        journals = []
        guard let user = session.user else {
            return
        }
        journalService.fetchMyJournels(userId: user.uid) { [weak self] journalsDict, error in
            guard let self = self,
                  let journalsArray = journalsDict?.values.map({$0}) else {
                return
            }
            self.journals = journalsArray
        }
    }
    
    func addNewJournal(_ session: APIServiceManager) {
        guard let user = session.user, validateFields() else {
            return
        }
        
        let moodValue = moodDict[mood] ?? 0
        let newJournal = Journal(
            userId: user.uid,
            title: titleText,
            note: noteText,
            date: dateText,
            mood: moodValue
        )
        journalService.createJournal(journal: newJournal) { [weak self] error in
            guard let self = self else {
                return
            }
            
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            self.journals.append(newJournal)
        }
    }
    
    func delete(index: Int) {
        journalService.delete(journals[index]) { error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            self.journals.remove(at: index)
        }
    }
    
    func validateFields() -> Bool {
        if titleText.isEmpty, noteText.isEmpty  {
            self.errorMessage = APIError.allFieldsManditory.debugDescription
            return false
        }
        self.errorMessage = ""
        return true
    }
}
