import UIKit
import SwiftUI
import PlaygroundSupport
//:*Code by Nayeli Castro*
//: --------------------

//:1. Is my number prime?

//:*Pseudocode:*
//:func isPrime (Int) return Bool
//:- check if 1 is prime
//:- check if 2 is prime
//:- check if number is prime by using modulo; if modulo is 0 then not prime

//:**CODE:**

func isPrime(_ number: Int) -> Bool {
//:Function will return boolean
    if (number == 1){
//:Checking for special case of 1 not being prime:
        return false
    }
    if ( number > 2 ){
//:Compensates the fact that 2 is prime
        for n in 2..<number{
            if (number % n == 0){
//:Checks if number is divisible by anything by checking every number starting from even 2
                return false
            }
        }
    }
    return true
}
//:If modulo returns anything but 0, then the number is prime because it means that the number is not evenly dividable

isPrime(1)
isPrime(2)
isPrime(3)
isPrime(4)
isPrime(5)
//: --------------------
//: 3. Did I have my parenthesis correctly?

//:*Pseudocode:*
//: - make function that takes in string and returns a boolean
//: - separate string by character into an array
//: iterate through the array and check if parenthesis are paired
//: - check if they are paired by counting how many beginning and ending parenthesis have appeared

//:**CODE:**

func pCheck(_ pString: String) -> Bool {
    var equalp = false
    var checker: Int = 0
    let pArray = Array(pString)
    
//:equalp will return whether the parenthesis are paired correctly or not. Checker checks how many times the single parenthesis has appeared. pArray is the array version of the string the function took in
    
    for x in pArray {
        print(x)
        if x == "(" {
            checker += 1
        }
        else if x == ")" {
            checker -= 1
        }
        else {
            checker -= 1
        }
        if checker < 0 {
            break
        }
    }
    
//: The function adds 1 to checker if its a "(" and subtracts if its ")". The parenthesis are paired correctly if theres an equal amount of both of them without repeats, so they must equal 0. If there gets to a point where checker is negative it stops, because then there would be a mismatch.
    
    if checker == 0 {
        equalp = true
    }
    
    return equalp
}
pCheck("((()))")
pCheck("((")
pCheck("abc")
pCheck("())()(")

//: --------------------
//:5. Longest subsequence

//:*Pseudocode:*
//: - function that takes in arrays, will have no return value because it will only print
//: - make 2 new arrays, one that will allow for the array in the parameter to be edited (parameter array is constant), and the other used to be appended to and printed
//: sort the new array
//: - make a loop that goes through the amount of spaces the new array has and append those values into the printable array; add 1 to length of subsequence count
//: - have a check to see if the next value of the array is larger than 1 more than the value the loop is on, if so then break and do not append anymore

//:**CODE:**

func sequence(_ list: Array<Int>) {
    var nlist = list
//:nlist is new array to make 'list' be able to change
    var plist: Array<Int> = Array()
//:plist is array that will be printed
    var count: Int = 0
    nlist.sort()
//:Sort nlist from least to greatest number
    for x in 0..<nlist.count{
        plist.append(nlist[x])
        count += 1
//: Loop appends the current value into the array that will be printed and also increases the count of the length of the subsequence
        if nlist[x] + 1 < nlist[x+1] {
            break
        }
//: ^ Code to see if the next value in the array is larger than 1 more than the value the loop is currently on.
    }
    print(plist)
    print(count)
}
sequence([1,4,2,3,5,6,10,20,30,21])
sequence([2,4,2,3,3,30,6,10,10,30,21])
