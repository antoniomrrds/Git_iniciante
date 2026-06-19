# CARREGAR Terminal Icons
Import-Module Terminal-Icons -ErrorAction SilentlyContinue

# DEFINIR O CAMINHO DOS TEMAS
$env:POSH_THEMES_PATH = "$HOME\.poshthemes"

# Criar diretório se não existir
if (-not (Test-Path $env:POSH_THEMES_PATH)) {
    New-Item -ItemType Directory -Path $env:POSH_THEMES_PATH -Force | Out-Null
}

# BAIXAR TEMAS SE NÃO EXISTIREM
$temasDisponiveis = @()
if (Test-Path $env:POSH_THEMES_PATH) {
    $temasDisponiveis = Get-ChildItem $env:POSH_THEMES_PATH -Filter *.omp.json | Select-Object -ExpandProperty Name
}

if ($temasDisponiveis.Count -eq 0) {
    Write-Host "📥 Baixando temas do Oh My Posh..." -ForegroundColor Yellow
    $temaUrl = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/pixelrobots.omp.json"
    $caminhoTema = Join-Path $env:POSH_THEMES_PATH "pixelrobots.omp.json"
    try {
        Invoke-WebRequest -Uri $temaUrl -OutFile $caminhoTema -ErrorAction Stop
        $temasDisponiveis = @("pixelrobots.omp.json")
        Write-Host "✅ Tema baixado com sucesso!" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Erro ao baixar tema. Usando tema padrão." -ForegroundColor Red
    }
}

# CARREGAR TEMA
$temaEscolhido = "pixelrobots.omp.json"

if ($temasDisponiveis -contains $temaEscolhido) {
    $caminhoTema = Join-Path $env:POSH_THEMES_PATH $temaEscolhido
    Write-Host "✅ Carregando tema: $temaEscolhido" -ForegroundColor Green
    oh-my-posh init pwsh --config $caminhoTema | Invoke-Expression
}
elseif ($temasDisponiveis.Count -gt 0) {
    # Fallback para o primeiro tema disponível
    $temaFallback = $temasDisponiveis[0]
    $caminhoFallback = Join-Path $env:POSH_THEMES_PATH $temaFallback
    Write-Host "🔄 Carregando tema alternativo: $temaFallback" -ForegroundColor Yellow
    oh-my-posh init pwsh --config $caminhoFallback | Invoke-Expression
}
else {
    # Fallback para o tema padrão do sistema
    Write-Host "🔄 Usando tema padrão do Oh My Posh" -ForegroundColor Yellow
    oh-my-posh init pwsh | Invoke-Expression
}

# CONFIGURAR PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Mensagem de boas-vindas
Write-Host "`n🚀 PowerShell carregado com sucesso!" -ForegroundColor Magenta
