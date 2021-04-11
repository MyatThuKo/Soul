//
//  Journel.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation

struct Journal: Decodable {
    var uuid: String = UUID().uuidString
    var userId: String
    var title: String
    var note: String
    var date: String
    var mood: Int
    
    static let `default`  = Self(
        uuid: UUID().uuidString,
        userId: "sk0ATulSibZSPts0eSsznzFzcR13",
        title: "Test",
        note: "TestNote",
        date: "",
        mood: 3)
    
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
