//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit

//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?
var str  :String = "hello";

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    
    
    
    init (words: [String?]) {
        wordA = words[0]
        wordB = words[1]
    }
    
//: The optionals actually don't need to be unwrapped, since it's fine to assign an optional to implicitly unwrapped optionals, which `wordA` and `wordB` are. Having a question mark in the original context just didn't make sense, since that implies optional chaining which is unnecessary given there is no method call right after either assignments and the return value is already of type `String?`. If `wordA` and `wordB` weren't defined as optionals, then you would just append `!` to the end of both lines of assignment.
    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    static func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() {String($0.characters.reverse())}
        var numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: The compiler dislikes the for loop because `i` originally was defined with a `let` statement, which means its value cannot be modified. Subsequently, the loop counter cannot increment and the loop will not function properly. `true` should be returned instead of `nil`
    
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    class func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters : [Character : Int] = [Character:Int]()
        var lenA = wordA.characters.count
        var lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: `countLetters` was not initialized so it was causing errors when the function tried using it. Also, `true` should be returned instead of `nil`

//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

