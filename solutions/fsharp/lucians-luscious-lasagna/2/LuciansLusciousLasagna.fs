module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven minutesInOvenSoFar =
    expectedMinutesInOven - minutesInOvenSoFar

let preparationTimeInMinutes layers = layers * 2

let elapsedTimeInMinutes layers minutesInOvenSoFar =
    preparationTimeInMinutes layers + minutesInOvenSoFar
