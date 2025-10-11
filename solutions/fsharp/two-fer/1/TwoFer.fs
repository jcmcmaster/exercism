module TwoFer

let twoFer (input: string option): string =
  let who =
    match input with
      | None -> "you"
      | Some s -> s
  sprintf "One for %s, one for me." who
