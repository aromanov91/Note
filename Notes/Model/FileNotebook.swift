import Foundation

class FileNotebook  {
    
    var allNotes = [Note]()
    
    public func add(_ note: Note) {
        allNotes.append(note)
    }
    
    public func remove(with uid: String) {
        var position :Int = 0
        var flagStop :Bool = false
        while flagStop == false {
            if allNotes[position].uid.contains(uid) == true {
                flagStop = true
                allNotes.remove(at: position)
            } else {
                position += 1
            }
        }
        
        
    }
    
    public func saveToFile() {
        //реализация
    }
    
    
    
    public func loadFromFile() {
        //реализация
    }
}
