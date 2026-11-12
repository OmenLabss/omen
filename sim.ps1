# Omen: run a simulation from anywhere in this folder.
#   .\sim.ps1                              -> example GLINT scenario, offline
#   .\sim.ps1 examples/scenarios/moss-team-rumor.md
#   .\sim.ps1 my-launch.md --agents 100 --rounds 12
param([string]$Scenario = "examples/scenarios/pons-creator-tax.md", [Parameter(ValueFromRemainingArguments)]$Rest)
$env:PATH = "$PSScriptRoot\tools\foundry;$env:PATH"
$env:PYTHONUTF8 = "1"
Push-Location "$PSScriptRoot\engine"
try {
  if (-not $Rest) { $Rest = @("--agents", "50", "--rounds", "10", "--offline", "--no-fork") }
  uv run --no-sync hyvo run --scenario $Scenario @Rest
} finally { Pop-Location }
