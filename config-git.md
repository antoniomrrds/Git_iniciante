
## ⚙️ Configurações Avançadas

```bash
# Listar configurações
git config --list

# Editar configurações
git config --global --edit     # do usuário
git config --system --edit     # do sistema
git config --edit              # do projeto

# Apelidos (aliases)
git config --global alias.s "status -s"
git config --global alias.c "!git add --all && git commit -m"
git config --global alias.l "!git log --pretty=format:'%C(auto)%h %C(red)%d  %C(white)| %s | - %C(cyan)[%cn], %C(green)%cr'"
git config --global alias.ls "!git log --branches --not --remotes"
git config --global alias.t "!sh -c 'git tag -a \$1 -m \$1' -"
git config --global alias.amend "!git add . && git commit --amend --no-edit"


# ========================================
#  CONFIGURAÇÕES GERAIS DO GIT
# ========================================

[init]
  # Branch padrão para novos repositórios
  defaultBranch = main

[user]
  # Nome do usuário (será usado nos commits)
  name = アントニオ
  # Email do usuário (será usado nos commits)
  email = email@gmail.com

[core]
  # Editor padrão para mensagens de commit (VS Code)
  editor = code

[push]
  # Seguir tags automaticamente ao fazer push
  followTags = true

# ========================================
#  ALIASES (ATALHOS) PERSONALIZADOS
#  ========================================

[alias]
  #############################
  # 🔍 STATUS & LOG
  #  - Comandos para visualizar o estado do repositório
  #############################

  # Status resumido (mostra apenas arquivos modificados)
  s = status -s
  
  # Status detalhado (mostra todas as informações)
  sv = status -v
  
  # Status com branch atual (mostra em que branch está)
  st = status -sb
  
  # Log bonito e colorido (commits formatados)
  # %h = hash abreviado | %d = tags/branches | %s = mensagem | %cn = autor | %cr = tempo relativo
  l = !git log --pretty=format:'%C(auto)%h %C(red)%d  %C(white)| %s | - %C(cyan)[%cn], %C(green)%cr'
  
  # Log de branches locais que NÃO foram enviadas ao remoto
  ls = !git log --branches --not --remotes
  
  # Histórico completo de um arquivo específico
  # Uso: git hist <arquivo>
  hist = log --follow --
  
  # Buscar por texto no histórico de commits
  # Uso: git search "texto"
  search = !sh -c 'git log --all --grep=\"$0\"'

  #############################
  # 📦 COMMIT & ADD
  #  - Comandos para adicionar arquivos e criar commits
  #############################

  # Adiciona TODOS os arquivos modificados e faz commit com mensagem
  # Uso: git c "mensagem do commit"
  c = !git add --all && git commit -m
  
  # Commit apenas dos arquivos que já estão no staging (git add)
  # Uso: git cm "mensagem"
  cm = !git commit -m
  
  # Adiciona arquivos modificados e faz amend no último commit (mantém a mensagem)
  # Útil para corrigir o último commit ou incluir arquivos esquecidos
  amend = !git add . && git commit --amend --no-edit
  
  # Desfaz o último commit (mantém as alterações nos arquivos)
  # Os arquivos voltam para o estado "modified" (não staged)
  undo = reset HEAD~1 --mixed
  
  # Remove arquivos do staging (área de preparação)
  # Uso: git unstage <arquivo>
  unstage = reset HEAD --
  
  # Cria um commit vazio (útil para testes ou para iniciar uma branch)
  # Uso: git ci-empty "mensagem"
  ci-empty = commit --allow-empty -m

  #############################
  # 🚀 PUSH & PULL
  #  - Comandos para enviar e receber alterações
  #############################

  # Push normal (envia commits para o remoto)
  p = push
  
  # Push forçado com segurança (não sobrescreve commits de outros)
  # Útil quando precisa reescrever o histórico, mas com proteção
  pf = push --force-with-lease
  
  # Pull com rebase (incorpora alterações do remoto sem criar merge commit)
  # Mantém o histórico mais limpo e linear
  pl = pull --rebase
  
  # Pull normal (traz alterações do remoto)
  pull = pull

  #############################
  # 🌳 BRANCHES & CHECKOUT
  #  - Comandos para gerenciar branches
  #############################

  # Merge da branch atual na branch 'dev'
  # Útil para integrar uma feature na develop
  m2dev = "!f() { b=$(git rev-parse --abbrev-ref HEAD); git switch dev && git merge \"$b\"; }; f"
  
  # Merge da branch 'dev' na 'main'
  # Útil para fazer release, integrando develop na main
  dev2main = "!f() { git switch main && git merge dev; }; f"
  
  # Lista branches locais (branch atual destacada)
  br = branch
  
  # Lista branches remotas (do GitHub/GitLab)
  br-remote = branch -r
  
  # Lista branches remotas com último commit e informações
  br-remote-full = !git branch -r -v
  
  # Lista TODAS as branches (locais + remotas)
  br-all = branch -a
  
  # Troca de branch (checkout - método antigo)
  # Uso: git co <branch>
  co = checkout
  
  # Troca de branch (switch - método novo/recomendado)
  # Uso: git sw <branch>
  sw = switch
  
  # Switch para uma branch remota criando automaticamente a local com tracking
  # Uso: git swr <nome-da-branch-remota>
  swr = "!f() { git fetch origin && git switch --track origin/$1; }; f"
  
  # Criar nova branch e trocar para ela (checkout - método antigo)
  # Uso: git nb <nome-da-branch>
  nb = !sh -c 'git checkout -b \"$0\"'
  
  # Criar nova branch e trocar para ela (switch - método novo)
  # Uso: git nbs <nome-da-branch>
  nbs = !sh -c 'git switch -c \"$0\"'
  
  # Criar nova branch baseada na main
  # Uso: git nbm <nome-da-branch>
  nbm = !sh -c 'git checkout -b \"$0\" main'
  
  # Criar nova branch baseada na develop
  # Uso: git nbd <nome-da-branch>
  nbd = !sh -c 'git checkout -b \"$0\" develop'
  
  # Deletar branch local (seguro)
  # Uso: git bd <branch>
  bd = branch -d
  
  # Forçar deletar branch local (mesmo com commits não mesclados)
  # Uso: git bdf <branch>
  bdf = branch -D
  
  # Criar branch de bugfix com prefixo padrão
  # Uso: git bugfix <nome-do-bug>
  bugfix = !sh -c 'git checkout -b bugfix/$0'

  #############################
  # 🔖 TAGS
  #  - Comandos para marcar versões/releases
  #############################

  # Criar tag anotada (com mensagem)
  # Uso: git t <versão> "mensagem"
  t = "!sh -c 'git tag -a \"$1\" -m \"$2\"' -"
  
  # Listar tags ordenadas por data (mais recentes primeiro)
  tags = tag -l --sort=-creatordate

  #############################
  # 🧹 LIMPEZA & RESET
  #  - Comandos para limpar e resetar o repositório
  #############################

  # Deletar branches locais já mescladas na main (mantém apenas main e dev)
  cleanup = "!git branch --merged main | grep -v '\\*\\|main\\|dev' | xargs -r git branch -d"
  
  # Limpar referências remotas que não existem mais (prune)
  cleanup-remote = !git fetch --prune && git remote prune o
  
  # Remover arquivos não rastreados (limpeza agressiva)
  # CUIDADO: arquivos deletados não podem ser recuperados!
  purge = clean -fd
  
  # Reset hard (volta o repositório para um estado anterior)
  # CUIDADO: perde todas as alterações não commitadas!
  # Uso: git rhard <hash-do-commit>
  rhard = reset --hard
  
  # Resetar branch local para a versão do remoto
  # Útil para descartar alterações locais e sincronizar
  rmt = !sh -c 'git fetch origin && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'

  #############################
  # 🛠️ DIFF & BLAME
  #  - Comandos para visualizar diferenças
  #############################

  # Diff destacando palavras (mais legível)
  d = diff --color-words
  
  # Diff resumido (estatísticas)
  ds = diff --stat
  
  # Quem modificou cada linha de um arquivo (blame)
  # Uso: git who <arquivo>
  who = blame

  #############################
  # 🎯 REBASE & MERGE
  #  - Comandos para integrar branches
  #############################

  # Rebase interativo (útil para reorganizar commits)
  # Uso: git ri <hash> 
  ri = rebase -i
  
  # Abortar rebase (volta ao estado anterior)
  ri-abort = rebase --abort
  
  # Abortar merge (volta ao estado antes do merge)
  amend-merge = merge --abort
  
  # Merge (mescla branches)
  # Uso: git m <branch>
  m = merge

  #############################
  # 🧮 STASH
  #  - Comandos para guardar alterações temporariamente
  #############################

  # Guardar alterações no stash
  # Uso: git stash-save "mensagem"
  stash-save = stash save
  
  # Aplicar stash e remover da lista
  stash-pop = stash pop
  
  # Listar todos os stashs
  stash-list = stash list
  
  # Limpar todos os stashs (CUIDADO: perde tudo!)
  stash-clear = stash clear

  #############################
  # ⚙️ CONFIG & INFO
  #  - Comandos para informações do Git
  #############################

  # Listar todas as configurações do Git
  cfg = config --list
  
  # Mostrar usuário configurado
  whoami = config user.name
  
  # Mostrar último commit
  last = log -1 HEAD

  #############################
  # ⚡ EXTRAS ÚTEIS
  #  - Comandos adicionais para tarefas específicas
  #############################

  # Atualizar submodules e mesclar com remoto
  subup = submodule update --remote --merge
  
  # Inicializar e atualizar submodules completos
  subupdate = submodule update --init --recursive --remote

  #############################
  # 📍 NOVOS ALIASES ADICIONADOS
  #  - Comandos extras para facilitar o dia a dia
  #############################

  # Ver arquivos não rastreados (que não estão no Git)
  untracked = !git status --short | grep '^??'
  
  # Ver arquivos modificados (mas ainda não commitados)
  modified = diff --name-only
  
  # Ver commits locais que ainda não foram enviados ao remoto
  unpushed = log @{u}..HEAD --oneline
  
  # Ver commits do remoto que ainda não foram puxados
  incoming = log HEAD..@{u} --oneline
  
  # Mostrar branches locais com rastreamento remoto (upstream)
  track = !git branch -vv
  
  # Ver diferença entre local e remoto (contagem de commits)
  sync-status = !git rev-list --left-right --count origin/$(git rev-parse --abbrev-ref HEAD)...HEAD
  
  # Ver diferenças entre HEAD local e branch remota
  diff-remote = !git fetch origin && git diff HEAD origin/$(git rev-parse --abbrev-ref HEAD)

  #############################
  # 🚀 ALIASES PARA PUSH AUTOMÁTICO
  #  - Enviar sempre para a branch atual (evita erros)
  #############################

  # Enviar commits para a branch atual no remoto
  # Exemplo: git push-here (envia para origin/branch-atual)
  push-here = !git push origin HEAD
  
  # Enviar com força (seguro) para a branch atual
  # Exemplo: git push-here-force
  push-here-force = !git push --force-with-lease origin HEAD
  
  # Enviar para branch atual e configurar upstream (rastreamento)
  # Útil para a primeira vez que envia uma branch nova
  # Exemplo: git push-here-setup
  push-here-setup = !git push -u origin HEAD

```

---


