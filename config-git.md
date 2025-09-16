
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
# 🚀 Aliases Git Completos: Básico, Intermediário e Avançado
 #############################
  # 🔍 Status & Log
  #############################
  s = status -s                                 # 🔄 Status resumido (status short)
  sv = status -v                                # 🧾 Status detalhado (status verbose)
  st = status -sb                               # 🔎 Status curto com branch atual
  l = "!git log --pretty=format:'%C(auto)%h %C(red)%d  %C(white)| %s | - %C(cyan)%an, %C(green)%cr' --graph"  # 📜 Log bonito customizado
  ls = "!git log --branches --not --remotes"  # 🕵️‍♂️ Log só das branches locais (sem remotos)
  hist = log --follow --                        # 📂 Histórico completo de um arquivo
  search = "!sh -c 'git log --all --grep=\"$0\"'"  # 🔍 Buscar no histórico por mensagem ou autor

  #############################
  # 📦 Commit & Add
  #############################
  c = "!git add --all && git commit -m"        # ✅ Add tudo e commit com mensagem
  amend = "!git add . && git commit --amend --no-edit"  # ✏️ Amend último commit sem mudar mensagem
  undo = reset HEAD~1 --mixed                   # 🗑️ Undo último commit (mantendo alterações)
  unstage = reset HEAD --                       # 🔙 Resetar staging (unstage tudo)
  ci-empty = commit --allow-empty -m            # 📝 Criar commit vazio (sem mudanças)

  #############################
  # 🚀 Push & Pull
  #############################
  p = push                                     # ⬆️ Push normal
  pf = push --force-with-lease                 # ⬆️ Push forçado (cuidado)
  pl = pull --rebase                           # ⬇️ Pull com rebase
  pull = pull                                  # 🔄 Pull normal

  #############################
  # 🌳 Branches & Checkout
  #############################
  br = branch                                  # 🌿 Lista branches
  br-remote = branch -r                        # 🌿 Lista branches remotas
  br-all = branch -a                           # 🌿 Lista todas branches (local + remoto)
  co = checkout                                # 🔀 Checkout (trocar branch)
  sw = switch                                  # 🔄 Alternar branch (git switch)
  swr = "!f() { git fetch origin && git switch --track origin/$1; }; f"  # 🔄 Alternar para branch remota criando local (fetch + switch)
  nb = "!sh -c 'git checkout -b \"$0\"'"      # 🚧 Criar nova branch e trocar para ela (checkout -b)
  nbs = "!sh -c 'git switch -c \"$0\"'"       # 🆕 Criar nova branch e trocar para ela (switch -c)
  nbm = "!sh -c 'git checkout -b \"$0\" main'"      # 🆕 Criar nova branch baseada em main
  nbd = "!sh -c 'git checkout -b \"$0\" develop'"   # 🆕 Criar nova branch baseada em develop
  bd = branch -d                               # ❌ Deletar branch local
  bdf = branch -D                              # ❌ Forçar deletar branch local
  bugfix = "!sh -c 'git checkout -b bugfix/$0'"  # 🐛 Criar branch bugfix e mudar para ela

  #############################
  # 🔖 Tags
  #############################
  t = "!sh -c 'git tag -a \"$0\" -m \"$0\"'"  # 🏷️ Criar tag anotada com mensagem
  tags = tag -l --sort=-creatordate           # 📄 Listar tags ordenadas por data

  #############################
  # 🧹 Limpeza & Reset
  #############################
  cleanup = "!git branch --merged main | grep -v '\\*\\|main' | xargs -r git branch -d"  # 🧽 Deletar branches locais já mescladas na main
  cleanup-remote = "!git fetch --prune && git remote prune origin"  # 🧹 Limpar branches locais que não existem mais no remoto
  purge = clean -fd                            # 🚮 Limpar arquivos não rastreados (clean force)
  rhard = reset --hard                         # 🔄 Reset hard (perigoso, apaga tudo local)
  rmt = "!sh -c 'git fetch origin && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'"  # 🧹 Reset para remoto (descarta tudo local)

  #############################
  # 🛠️ Diferenças, Blame & Outras Ferramentas
  #############################
  d = diff --color-words                       # 👀 Diff com destaque das palavras mudadas
  ds = diff --stat                             # 👓 Diff simplificado (short)
  who = blame                                 # 🧠 Quem modificou a linha? (blame)

  #############################
  # 🎯 Rebase & Merge
  #############################
  ri = rebase -i                              # 🔄 Rebase interativo
  ri-abort = rebase --abort                   # ⚔️ Abort rebase
  amend-merge = merge --abort                 # ⚔️ Abort merge
  m = merge                                   # 🔀 Merge com mensagem padrão

  #############################
  # 🧮 Stash
  #############################
  stash-save = stash save                     # 📥 Salvar stash
  stash-pop = stash pop                       # 📤 Aplicar stash
  stash-list = stash list                     # 📋 Listar stash
  stash-clear = stash clear                   # 🧹 Limpar stash

  #############################
  # ⚙️ Config & Info
  #############################
  cfg = config --list                         # 🌐 Mostrar config global
  whoami = config user.name                   # 🧑 Mostrar usuário atual
  last = log -1 HEAD                          # 🧾 Ver últimos commits

  #############################
  # ⚡ Extras Muito Úteis
  #############################
  subup = submodule update --remote --merge  # ⚡ Atualizar submódulos
  subupdate = submodule update --init --recursive --remote  # ⚡ Atualizar e inicializar submodules



```

---


