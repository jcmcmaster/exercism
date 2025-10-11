module InterestIsInteresting

let interestRate (balance: decimal) : single =
    match balance with
    | _ when balance < 0m -> 3.213f
    | _ when balance < 1000m -> 0.5f
    | _ when balance < 5000m -> 1.621f
    | _ -> 2.475f // things

let interest (balance: decimal) : decimal =
    decimal (interestRate balance) / 100m * balance

let annualBalanceUpdate (balance: decimal) : decimal = interest balance + balance

let amountToDonate (balance: decimal) (taxFreePercentage: float) : int =
    if balance < 0m then
        0
    else
        int (balance * decimal (taxFreePercentage / 100. * 2.))
