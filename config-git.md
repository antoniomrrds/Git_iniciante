
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

# 🚀 Aliases Git Completos: Básico, Intermediário e Avançado

Um arquivo com os aliases mais usados e avançados para você dominar o Git de verdade! 😎

---

## 🔍 Status & Log

# 🔄 Status resumido (status short)
git config --global alias.s "status -s"

# 🧾 Status detalhado (status verbose)
git config --global alias.sv "status -v"

# 📜 Log bonito customizado
git config --global alias.l "!git log --pretty=format:'%C(auto)%h %C(red)%d  %C(white)| %s | - %C(cyan)%an, %C(green)%cr' --graph"

# 🕵️‍♂️ Log só das branches locais (sem remotos)
git config --global alias.ls "!git log --branches --not --remotes"

# 🔎 Log do arquivo específico, seguindo renomeações
git config --global alias.hist "log --follow --"

---

## 📦 Commit & Add

# ✅ Add tudo e commit com mensagem: git c "msg"
git config --global alias.c "!git add --all && git commit -m"

# ✏️ Amend último commit sem mudar mensagem
git config --global alias.amend "!git add . && git commit --amend --no-edit"

# 🗑️ Undo último commit (mantendo alterações)
git config --global alias.undo "reset HEAD~1 --mixed"

# 🔙 Resetar staging (unstage tudo)
git config --global alias.unstage "reset HEAD --"

---

## 🚀 Push & Pull

# ⬆️ Push normal
git config --global alias.p "push"

# ⬆️ Push forçado (cuidado)
git config --global alias.pf "push --force-with-lease"

# ⬇️ Pull com rebase
git config --global alias.pl "pull --rebase"

# 🔄 Pull normal
git config --global alias.pull "pull"

---

## 🌳 Branches & Checkout

# 🌿 Lista branches
git config --global alias.br "branch"

# 🔀 Checkout (trocar branch)
git config --global alias.co "checkout"

# 🔄 Alternar branch (git switch)
git config --global alias.sw "switch"

# 🚧 Criar nova branch e trocar para ela (checkout -b)
git config --global alias.nb "!f() { git checkout -b \"$1\"; }; f"

# 🆕 Criar nova branch e trocar para ela (switch -c)
git config --global alias.nbs "!f() { git switch -c \"$1\"; }; f"

# ❌ Deletar branch local
git config --global alias.bd "branch -d"

# ❌ Forçar deletar branch local
git config --global alias.bdf "branch -D"

---

## 🔖 Tags

# 🏷️ Criar tag anotada com mensagem
git config --global alias.t "!sh -c 'git tag -a \$1 -m \$1' -"

# 📄 Listar tags ordenadas por data
git config --global alias.tags "tag -l --sort=-creatordate"

---

## 🧹 Limpeza & Reset

# 🧽 Deletar branches locais já mescladas na main
git config --global alias.cleanup "!git branch --merged main | grep -v '\\*\\|main' | xargs -n 1 git branch -d"

# 🚮 Limpar arquivos não rastreados (clean force)
git config --global alias.purge "clean -fd"

# 🔄 Reset hard (perigoso, apaga tudo local)
git config --global alias.rhard "reset --hard"

# 🧹 Reset para remoto (descarta tudo local)
git config --global alias.rmt "fetch origin && reset --hard origin/$(git rev-parse --abbrev-ref HEAD)"

---

## 🛠️ Diferenças, Blame & Outras Ferramentas

# 👀 Diff com destaque das palavras mudadas
git config --global alias.d "diff --color-words"

# 👓 Diff simplificado (short)
git config --global alias.ds "diff --stat"

# 🧠 Quem modificou a linha? (blame)
git config --global alias.who "blame"

# 📂 Histórico completo de um arquivo
git config --global alias.hist "log --follow --"

# 🔍 Buscar no histórico por mensagem ou autor
git config --global alias.search "!f() { git log --all --grep=\"$1\"; }; f"

---

## 🎯 Rebase & Merge

# 🔄 Rebase interativo
git config --global alias.ri "rebase -i"

# ⚔️ Abort rebase
git config --global alias.ri-abort "rebase --abort"

# ⚔️ Abort merge
git config --global alias.amend-merge "merge --abort"

# 🔀 Merge com mensagem padrão
git config --global alias.m "merge"

---

## 🧮 Stash

# 📥 Salvar stash
git config --global alias.stash-save "stash save"

# 📤 Aplicar stash
git config --global alias.stash-pop "stash pop"

# 📋 Listar stash
git config --global alias.stash-list "stash list"

# 🧹 Limpar stash
git config --global alias.stash-clear "stash clear"

---

## ⚙️ Config & Info

# 🌐 Mostrar config global
git config --global alias.cfg "config --list"

# 🧑 Mostrar usuário atual
git config --global alias.whoami "config user.name"

# 🧾 Ver últimos commits
git config --global alias.last "log -1 HEAD"

---

## 📦 Extras Muito Úteis

# 🔎 Mostrar resumo rápido (status short + branch atual)
git config --global alias.st "status -sb"

# 📝 Criar commit vazio (sem mudanças)
git config --global alias.ci-empty "commit --allow-empty -m"

# 🐛 Criar branch bugfix e mudar para ela
git config --global alias.bugfix "!f() { git checkout -b bugfix/$1; }; f"

# ⚡ Atualizar submódulos
git config --global alias.subup "submodule update --remote --merge"

---

## 💡 Como usar?

Depois de configurar, você pode usar:

git s # status resumido
git sv # status verbose
git c "msg" # add tudo + commit
git amend # corrigir último commit
git undo # desfazer último commit mantendo arquivos
git p # push
git pf # push force com segurança
git pl # pull com rebase
git br # listar branches
git co main # trocar para branch main
git sw dev # trocar para branch dev com switch
git nb feat/x # criar nova branch com checkout
git nbs feat/x # criar nova branch com switch
git bd feature # deletar branch local
git t v1.0.0 # criar tag anotada
git cleanup # limpar branches mescladas
git purge # limpar arquivos não rastreados
git rhard # reset hard local
git rmt # reset hard para remoto
git d # diff colorido
git who file.js # quem alterou cada linha
git ri # rebase interativo
git stash-save # salvar stash
git stash-pop # aplicar stash
git cfg # mostrar config


```

---


