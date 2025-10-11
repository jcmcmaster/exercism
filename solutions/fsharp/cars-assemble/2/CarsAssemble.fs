module CarsAssemble

let CARS_PER_HOUR_PER_SPEED = 221

let successRate (speed: int) : float =
    match speed with
    | 0 -> 0.0
    | s when s < 5 -> 1.0
    | s when s < 9 -> 0.9
    | 9 -> 0.8
    | 10 -> 0.77
    | _ -> failwith "invalid speed"

let productionRatePerHour (speed: int) : float =
    float speed * float CARS_PER_HOUR_PER_SPEED * (successRate speed)

let workingItemsPerMinute (speed: int) : int =
    int ((productionRatePerHour speed) / float 60)
