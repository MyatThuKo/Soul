//
//  Journel.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation

struct Journal: Decodable, Hashable {
    var uuid: String = UUID().uuidString
    var userId: String
    var title: String
    var note: String
    var date: String
    var mood: String
    
    static let `default`  = Self(
        uuid: UUID().uuidString,
        userId: "test",
        title: "Test",
        note: "TestNote",
        date: "April 15, 2021",
        mood: "excellent")
    
    func getJournalDictionary() -> [String: Any] {
        return [
            "uuid": self.uuid,
            "userId": self.userId,
            "title": self.title,
            "note": self.note,
            "date": self.date,
            "mood": self.mood
        ]
    }
}
