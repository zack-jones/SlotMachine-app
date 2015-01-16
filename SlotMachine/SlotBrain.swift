//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Zack Jones on 1/15/15.
//  Copyright (c) 2015 Zack Jones. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func unpackSlotIntoSlotRows (slots: [[Slot]]) -> [[Slot]] {
        
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var i = 0; i < slotArray.count; i++ {
                let slot = slotArray[i]
                if i == 0 {
                    slotRow.append(slot)
                }
                else if i == 1 {
                    slotRow2.append(slot)
                }
                else if i == 2 {
                    slotRow3.append(slot)
                }
                else {
                    println("Error")
                }
            }
        }
        
        var slotsInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotsInRows
        
    }
    
    class func computeWinnings (slots: [[Slot]]) -> Int {
        
        var slotsInRows = unpackSlotIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straitWinCount = 0
        
        for slotRow in slotsInRows {
            if checkFlush(slotRow) == true {
                winnings += 1
                flushWinCount += 1
            }
            
            if checkThreeInARow(slotRow) == true {
                winnings += 1
                straitWinCount += 1
            }
            
            if checkForThreeOfAKind(slotRow) == true {
                winnings += 3
                threeOfAKindWinCount += 1
            }
        }
        
        if flushWinCount == 3 {
            winnings += 15
        }
        
        if straitWinCount == 3 {
            winnings += 100
        }
        
        if threeOfAKindWinCount == 3 {
            winnings += 50
        }
        
        return winnings
        
    }
    
    class func checkFlush (slotRow: [Slot]) -> Bool {
        
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkForThreeOfAKind (slotRow:[Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }
        else {
            return false
        }
    }
    
    
    
    
    
}