Function Get-BobResponse()
{
  <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
  [CmdletBinding()]
  Param(
    [string]$HeyBob
  )

  $Trimmed = $HeyBob.Trim()

  Function IsYell($str)
  { 
    return $str -ceq $str.ToUpper() -and $str -cne $str.ToLower() 
  }

  Function IsQuestion($str)
  {
    return $str.EndsWith("?")
  }

  Function IsSilence($str)
  {
    return -not $str
  }

  $Result = switch ($Trimmed)
  {
    { (IsYell($_)) -and (IsQuestion($_)) }
    { "Calm down, I know what I'm doing!" 
      break
    }
    { IsYell($_) }
    { "Whoa, chill out!" 
      break
    }
    { IsQuestion($_) }
    { "Sure." 
      break
    }
    { IsSilence($_) }
    { "Fine. Be that way!" 
      break
    }
    default
    { "Whatever." 
      break
    }
  }

  return $Result
}
