module LogLevels

let message (logLine: string) : string =
    let parts = logLine.Split ":"
    parts[1].Trim()

let logLevel (logLine: string) : string =
    let parts = logLine.Split ":"
    parts[0].Replace("[", "").Replace("]", "").Trim().ToLower()

let reformat (logLine: string) : string =
    sprintf "%s (%s)" (message logLine) (logLevel logLine)
