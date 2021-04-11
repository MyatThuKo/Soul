//
//  JournalVIewModel.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation

class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = []
    @Published var errorMessage: String = ""
    @Published var titleText = ""
    @Published var noteText = ""
    @Published var mood = ""
    var moodArray = ["excellent", "happy", "good", "sad", "awful"]
    var moodDict = ["excellent": 10, "happy": 6, "good": 4, "sad": 2, "awful": 0]
    
    var session: APIServiceManager?
    var journalService = JournalService()
    
    func fetchJournals(_ session: APIServiceManager) {
        guard let user = session.user else {
            return
        }
        journalService.fetchMyJournels(userId: user.uid) { [weak self] journals, error in
            guard let self = self, let journals = journals else {
                return
            }
            self.journals = journals
        }
    }
    
    func addNewJournal() {
        guard let user = session?.user else {
            return
        }
        let currentDate = Date().timeIntervalSince1970.description
        let moodValue = moodDict[mood] ?? 0
        let newJournal = Journal(userId: user.uid, title: titleText, note: noteText, date: currentDate, mood: moodValue)
        journalService.createJournal(journal: newJournal) { [weak self] error in
            guard let self = self, let error = error else {
                return
            }
            self.errorMessage = error.localizedDescription
        }
    }
}
