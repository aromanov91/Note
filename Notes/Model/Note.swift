import UIKit

enum Importance {
    case unimportant
    case ordinary
    case important
}

struct Note {
    
    let uid: String
    let title: String
    let content: String
    let importance: Importance
    let color : UIColor
    let selfDestructionDate :Date?
    
    init(uid: String = UUID().uuidString,
         title: String,
         content: String,
         importance: Importance,
         color: UIColor = UIColor.white,
         selfDestructionDate: Date? = nil) {
        self.uid = uid
        self.title = title
        self.content = content
        self.color = color
        self.importance = importance
        self.selfDestructionDate = selfDestructionDate
    }
}
