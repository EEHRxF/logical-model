RuleSet: Full(strength)
* ^extension[$obligation][+].extension[code].valueCode = {strength}:process
* ^extension[$obligation][=].extension[actor].valueCanonical = $actor-full

RuleSet: Basic(strength)
* ^extension[$obligation][+].extension[code].valueCode = {strength}:process
* ^extension[$obligation][=].extension[actor].valueCanonical = $actor-basic
