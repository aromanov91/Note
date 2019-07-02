import Foundation
import UIKit


extension Note {
    var json: [String: Any] {
        var json: [String: Any] = [:]
        json["uid"] = uid
        json["title"] = title
        json["content"] = content
        if self.color != UIColor.white {
            var r: CGFloat = 0;
            var g: CGFloat = 0;
            var b: CGFloat = 0;
            var a: CGFloat = 0;
            self.color.getRed(&r, green: &g, blue: &b, alpha: &a)
            
            json["color"] = ["r": r, "g": g, "b": b, "a": a]
        }
        if self.importance != .ordinary {
            switch self.importance {
            case .important:
                json["importance"] = "important"
            case .unimportant:
                json["importance"] = "unimportant"
            default:
                break
            }
        }
        
        if let selfDestructionDate = self.selfDestructionDate {
            json["selfDestructionDate"] = selfDestructionDate.timeIntervalSince1970
        }
        
        return json
    }
    
    static func parse(json: [String: Any]) -> Note? {
        let uid = json["uid"] as? String ?? ""
        let title = json["title"] as? String ?? ""
        let content = json["content"] as? String ?? ""
        var color = UIColor.white
        var importance: Importance = .ordinary
        
        if let xcolor = json["color"] as? [CGFloat] {
            color = UIColor.init(
                red: xcolor[0],
                green: xcolor[1],
                blue: xcolor[2],
                alpha: xcolor[3]
            )
        }
        
        if json["importance"] != nil {
            switch json["importance"] as! String {
            case "important":
                importance = .important
            case "unimportant":
                importance = .unimportant
            default:
                break
            }
        }
        
        let selfDestructionDate = Date(timeIntervalSince1970: json["selfDestructionDate"] as! TimeInterval)
        
        let noteObject = Note(uid: uid, title: title, content: content, importance: importance, color: color, selfDestructionDate: selfDestructionDate)
        
        return noteObject
    }
    
}





