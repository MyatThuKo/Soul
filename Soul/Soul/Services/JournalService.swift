//
//  JournalService.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation
import FirebaseDatabase
import CodableFirebase

class JournalService {
    var databaseJournalReference = Database.database().reference().child("journal")
    
    // MARK: - Fetch all journals for a user
    
    func fetchMyJournels(userId: String, handler: @escaping ([Journal]?, Error?) -> Void) {
        databaseJournalReference
            .child(userId)
            .observeSingleEvent(of: .value, with: { snapshot in
           guard let value = snapshot.value else {
                return
           }
           do {
               let questionsSet = try FirebaseDecoder().decode([Journal].self, from: value)
                handler(questionsSet, nil)
           } catch let error {
               handler(nil, error)
           }
        })
    }
    
    // MARK: - Create New Journal
    
    func createJournal(journal: Journal, handler:  @escaping(Error?) -> Void) {
        databaseJournalReference
            .child(journal.userId)
            .child("\(journal.uuid)")
            .setValue(journal.getJournalDictionary()) {
                (error: Error?, ref: DatabaseReference) in
           handler(error)
        }
    }
    
    // MARK: - Delete Journal
    
    func deleteJournal(for pin: String, handler:  @escaping(Error?) -> Void) {
        databaseJournalReference.child(pin).removeValue { (error: Error?, ref: DatabaseReference) in
           handler(error)
        }
    }
}


class MockJournalService {
    var dataService = JournalService()
    
    func fetchJournal() {
        dataService.fetchMyJournels(
            userId: "sk0ATulSibZSPts0eSsznzFzcR13") { journal, error  in
            guard let journal = journal else {
                if let error  = error {
                    print(error)
                }
                return
            }
            print(journal)
        }
    }
    
    func addJournal() {
        dataService.createJournal(journal: Journal.default) { error in
            guard let error = error else {
                self.fetchJournal()
                return
            }
            print(error)
        }
    }
}
