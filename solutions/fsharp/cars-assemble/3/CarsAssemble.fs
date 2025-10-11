module CarsAssemble

exception InvalidSpeedException of int

let carsPerHourPerSpeed = 221

let successRate (speed: int) : float =
    match speed with
    | s when s < 0 -> raise (InvalidSpeedException(s))
    | 0 -> 0.0
    | s when s < 5 -> 1.0
    | s when s < 9 -> 0.9
    | 9 -> 0.8
    | 10 -> 0.77
    | s -> raise (InvalidSpeedException(s))

let productionRatePerHour (speed: int) : float =
    float speed * float carsPerHourPerSpeed * (successRate speed)

let workingItemsPerMinute (speed: int) : int =
    int ((productionRatePerHour speed) / float 60)
