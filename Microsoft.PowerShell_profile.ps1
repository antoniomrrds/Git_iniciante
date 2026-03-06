# CARREGAR Terminal Icons
Import-Module Terminal-Icons

# DEFINIR O CAMINHO CORRETO DOS TEMAS (ENCONTRADO AGORA)
$env:POSH_THEMES_PATH = "C:\Users\anton\.poshthemes"

# Verificar se o diretório existe
if (-not (Test-Path $env:POSH_THEMES_PATH)) {
    # Fallback para criar o diretório se não existir
    New-Item -ItemType Directory -Path $env:POSH_THEMES_PATH -Force | Out-Null
}

# Mostrar onde os temas estão
Write-Host "📁 Temas em: $env:POSH_THEMES_PATH" -ForegroundColor Cyan

# Listar temas disponíveis
$temasDisponiveis = @()
if (Test-Path $env:POSH_THEMES_PATH) {
    $temasDisponiveis = Get-ChildItem $env:POSH_THEMES_PATH -Filter *.omp.json | Select-Object -ExpandProperty Name
}

# ESCOLHA SEU TEMA AQUI (altere conforme preferir)
$temaEscolhido = "pixelrobots.omp.json"  # <- Mude para o tema que quiser

# Verificar se o tema escolhido existe
if ($temasDisponiveis -contains $temaEscolhido) {
    $caminhoTema = Join-Path $env:POSH_THEMES_PATH $temaEscolhido
    Write-Host "✅ Carregando tema: $temaEscolhido" -ForegroundColor Green
    oh-my-posh init pwsh --config $caminhoTema | Invoke-Expression
}
else {
    Write-Host "⚠️ Tema '$temaEscolhido' não encontrado!" -ForegroundColor Yellow
    
    if ($temasDisponiveis.Count -gt 0) {
        Write-Host "📋 Temas disponíveis:" -ForegroundColor Cyan
        $temasDisponiveis | ForEach-Object { Write-Host "   - $_" -ForegroundColor White }
        
        # Carregar o primeiro tema disponível
        $temaFallback = $temasDisponiveis[0]
        Write-Host "🔄 Carregando tema alternativo: $temaFallback" -ForegroundColor Yellow
        $caminhoFallback = Join-Path $env:POSH_THEMES_PATH $temaFallback
        oh-my-posh init pwsh --config $caminhoFallback | Invoke-Expression
    }
    else {
        Write-Host "❌ Nenhum tema encontrado!" -ForegroundColor Red
    }
}

# CONFIGURAR PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Mensagem de boas-vindas
Write-Host "`n🚀 PowerShell carregado com sucesso!" -ForegroundColor Magenta
