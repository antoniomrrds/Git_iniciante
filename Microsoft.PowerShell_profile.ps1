Import-Module -Name Terminal-Icons
Import-Module Az.Tools.Predictor

oh-my-posh init pwsh --config 'C:\Users\anton\AppData\Local\Programs\oh-my-posh\themes\unicorn.omp.json' | Invoke-Expression

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
