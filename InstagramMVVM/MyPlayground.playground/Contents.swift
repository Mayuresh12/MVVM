import UIKit

var str = "Hello, playground"


func concatEdgeLetters(a: [String]) -> [String] {
    //let a = ["cat", "dog", "ferret", "scorpion"]
    var temp1 : [String] = []
    var temp2 : [String] = []
    var final : [String] = []

    for item in a {
        
        temp1.append(String(item.prefix(1)) )
    }

    if  a.count != 1  {
        for item in a.indices.dropFirst() {
      
            temp2.append(String(a[item].suffix(1)) )
        }
        temp2.append(String(a[a.count - 2].suffix(1)))
    }
 
    
    
    
    for item in 0...a.count - 1{
        if  a.count != 1  {
            final.append(temp1[item] + temp1[item])
            
        } else {
            final.append(temp1[item])
        }
        
        print(item)
    }
    
    print("temp1:\(temp1)")
    print("temp1:\(temp2)")
    print(final)
    return a
}


print(concatEdgeLetters(a: ["ct"]))
