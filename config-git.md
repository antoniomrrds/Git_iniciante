
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

[alias]
[alias]

  #############################
  # 🔍 Status & Log
  #############################

  # 🔄 Status resumido (short)
  s = status -s

  # 🧾 Status detalhado (verbose)
  sv = status -v

  # 🔎 Status com branch atual
  st = status -sb

  # 📜 Log bonito customizado
  l = !git log --pretty=format:'%C(auto)%h %C(red)%d  %C(white)| %s | - %C(cyan)%an, %C(green)%cr' --graph

  # 🕵️‍♂️ Log de branches locais (não enviadas)
  ls = !git log --branches --not --remotes

  # 📂 Histórico completo de um arquivo
  hist = log --follow --

  # 🔍 Buscar por texto no histórico
  search = !sh -c 'git log --all --grep=\"$0\"'

  #############################
  # 📦 Commit & Add
  #############################

  # ✅ Add tudo e commit com mensagem
  c = !git add --all && git commit -m

  # ✏️ Amend no último commit (sem mudar msg)
  amend = !git add . && git commit --amend --no-edit

  # 🗑️ Desfaz o último commit (mantém alterações)
  undo = reset HEAD~1 --mixed

  # 🔙 Remove arquivos do staging
  unstage = reset HEAD --

  # 📝 Criar commit vazio
  ci-empty = commit --allow-empty -m

  #############################
  # 🚀 Push & Pull
  #############################

  # ⬆️ Push normal
  p = push

  # ⚠️ Push forçado com segurança
  pf = push --force-with-lease

  # ⬇️ Pull com rebase
  pl = pull --rebase

  # 🔄 Pull normal
  pull = pull

  #############################
  # 🌳 Branches & Checkout
  #############################

  # 🌿 Listar branches locais
  br = branch

  # 🌿 Listar branches remotas
  br-remote = branch -r

  # 🌿 Listar branches remotas com último commit
  br-remote-full = !git branch -r -v

  # 🌿 Listar todas (local + remoto)
  br-all = branch -a

  # 🔀 Trocar de branch (checkout)
  co = checkout

  # 🔄 Trocar de branch (switch)
  sw = switch

  # 🔄 Switch para branch remota criando local
  swr = "!f() { git fetch origin && git switch --track origin/$1; }; f" 

  # 🚧 Criar nova branch e trocar para ela
  nb = !sh -c 'git checkout -b \"$0\"'

  # 🆕 Criar nova branch com switch
  nbs = !sh -c 'git switch -c \"$0\"'

  # 🆕 Nova branch baseada na main
  nbm = !sh -c 'git checkout -b \"$0\" main'

  # 🆕 Nova branch baseada na develop
  nbd = !sh -c 'git checkout -b \"$0\" develop'

  # ❌ Deletar branch local
  bd = branch -d

  # ❌ Forçar deletar branch local
  bdf = branch -D

  # 🐛 Criar branch de bugfix
  bugfix = !sh -c 'git checkout -b bugfix/$0'

  #############################
  # 🔖 Tags
  #############################

  # 🏷️ Criar tag anotada
  t = !sh -c 'git tag -a \"$0\" -m \"$0\"'

  # 📄 Listar tags por data
  tags = tag -l --sort=-creatordate

  #############################
  # 🧹 Limpeza & Reset
  #############################

  # 🧽 Deletar branches já mescladas na main
  cleanup = !git branch --merged main | grep -v '\\*\\|main' | xargs -r git branch -d

  # 🧹 Limpar referências remotas que não existem mais
  cleanup-remote = !git fetch --prune && git remote prune origin

  # 🚮 Limpar arquivos não rastreados
  purge = clean -fd

  # 🔄 Reset hard (cuidado!)
  rhard = reset --hard

  # 🧹 Reset branch local para remoto
  rmt = !sh -c 'git fetch origin && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'

  #############################
  # 🛠️ Diff, Blame & Outras
  #############################

  # 👀 Diff destacando palavras
  d = diff --color-words

  # 👓 Diff simplificado
  ds = diff --stat

  # 🧠 Quem modificou a linha (blame)
  who = blame

  #############################
  # 🎯 Rebase & Merge
  #############################

  # 🔄 Rebase interativo
  ri = rebase -i

  # ⚔️ Abortar rebase
  ri-abort = rebase --abort

  # ⚔️ Abortar merge
  amend-merge = merge --abort

  # 🔀 Merge com mensagem padrão
  m = merge

  #############################
  # 🧮 Stash
  #############################

  # 📥 Salvar stash
  stash-save = stash save

  # 📤 Aplicar stash
  stash-pop = stash pop

  # 📋 Listar stashs
  stash-list = stash list

  # 🧹 Limpar todos os stashs
  stash-clear = stash clear

  #############################
  # ⚙️ Config & Info
  #############################

  # 🌐 Ver configs globais
  cfg = config --list

  # 🧑 Ver usuário atual
  whoami = config user.name

  # 🧾 Último commit
  last = log -1 HEAD

  #############################
  # ⚡ Extras Úteis
  #############################

  # ⚡ Atualizar submodules remotos
  subup = submodule update --remote --merge

  # ⚡ Inicializar e atualizar submodules
  subupdate = submodule update --init --recursive --remote

  #############################
  # 📍 Novos Aliases Adicionados
  #############################

  # 📁 Ver arquivos não rastreados
  untracked = !git status --short | grep '^??'

  # ✏️ Ver arquivos modificados (não commitados)
  modified = diff --name-only

  # ⬆️ Commits locais ainda não enviados
  unpushed = log @{u}..HEAD --oneline

  # ⬇️ Commits do remoto que ainda não foram puxados
  incoming = log HEAD..@{u} --oneline

  # 🌍 Mostrar branches locais com rastreamento remoto
  track = !git branch -vv

  # ⚖️ Ver diferença entre local e remoto (em contagem)
  sync-status = !git rev-list --left-right --count origin/$(git rev-parse --abbrev-ref HEAD)...HEAD

  # 🧪 Ver diferenças entre HEAD local e remoto
  diff-remote = !git fetch origin && git diff HEAD origin/$(git rev-parse --abbrev-ref HEAD)


```

---


