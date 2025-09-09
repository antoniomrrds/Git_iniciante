# 🧰 Guia Completo de Comandos Git

## 🛠️ Configurações Iniciais

```bash
# Instalação (Linux)
sudo apt install git

# Inicializar repositório
git init

# Configuração de usuário
git config --global user.name "Seu Nome"
git config --global user.email "seuemail@email.com"

# Alterar branch padrão para main
git config --global init.defaultBranch main
git branch -m master main

# Definir o VS Code como editor padrão
git config --global core.editor "code --wait --reuse-window"
```

---

## 🔑 Chaves SSH

### 💻 Windows (Git Bash ou CMD)

```bash
ssh-keygen -t ed25519 -C "seu_email@example.com"
cat ~/.ssh/id_ed25519.pub
clip < ~/.ssh/id_ed25519.pub
```

### 🐧 Linux

```bash
ssh-keygen -t rsa -C "seu_email@example.com"
cat ~/.ssh/id_rsa.pub
# Ou criando com nome específico
ssh-keygen -t rsa -b 4096 -C "seu_email@example.com" -f ~/.ssh/nome_chave_rsa
cat ~/.ssh/nome_chave_rsa.pub
```

---

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
```

---

## 🌿 Branches

```bash
# Criar nova branch
git branch nome-da-branch

# Criar e trocar ao mesmo tempo
git checkout -b nome-da-branch
# ou
git switch -c nome-da-branch

# Ver todas as branches
git branch -av

# Trocar de branch
git checkout nome-da-branch

# Deletar branch local
git branch -D nome-da-branch

# Deletar branch remota
git push origin --delete nome-da-branch

# Detalhes de uma branch
git show nome-da-branch
```

---

## ✅ Status e Histórico

```bash
git status            # status completo
git status -s         # status resumido
git log               # histórico completo
git log --oneline     # histórico resumido
git show              # mostra alterações do último commit
git log --branches --not --remotes  # commits ainda não enviados
```

---

## 💬 Commits

```bash
# Adicionar arquivos
git add nome-do-arquivo
git add .            # adiciona todos os arquivos

# Criar commit
git commit -m "mensagem do commit"

# Editar último commit (sem mudar a mensagem)
git commit --amend --no-edit

# Editar último commit (com nova mensagem)
git commit --amend -m "nova mensagem"

# Rebase interativo
git rebase -i HEAD~7
# Altere "pick" para "r" para renomear commits

# Reverter commit
git revert HEAD                # último commit
git revert hash-do-commit     # commit específico
```

---

## 🧹 Desfazer Commits

```bash
# Desfazer commit local (mantendo alterações)
git reset --soft HEAD~1

# Desfazer commit local (descartando alterações)
git reset --hard HEAD~1

# Reverter commit remoto
git revert HEAD

# Remover último commit do GitHub (⚠️ força bruta!)
git push origin HEAD^:nome-da-branch --force
```

---

## 📥📤 Push & Pull

```bash
# Clonar repositório
git clone https://github.com/usuario/repositorio.git

# Adicionar remoto
git remote add origin https://github.com/usuario/repositorio.git

# Enviar alterações
git push origin main -u
git push origin nome-da-branch

# Receber alterações
git pull

# Corrigir erro "non-fast-forward"
git pull
git branch --set-upstream-to=origin/main main
git pull --allow-unrelated-histories
git push
```

---

## 🗂️ Arquivos

```bash
# Criar arquivo
touch nome-do-arquivo

# Renomear arquivo
mv antigo novo
ren antigo novo  # CMD

# Deletar arquivo
rm -rf nome
git rm nome

# Parar de monitorar
git rm --cached nome

# Ignorar arquivos
echo nome-do-arquivo >> .gitignore

# Ver conteúdo do arquivo
cat nome-do-arquivo
```

---

## 📦 Stash (Salvar alterações temporárias)

```bash
git stash            # salva alterações
git stash list       # lista stashes
git stash apply      # aplica alterações sem remover stash
git stash pop        # aplica e remove stash
git stash drop       # remove stash
git stash drop stash@{n}  # remove stash específico
```

---

## 🔍 Diffs e Alterações

```bash
git diff               # alterações não adicionadas
git diff nome          # diff de arquivo específico
git diff --staged      # alterações já adicionadas
```

---

## 🗑️ Recuperar Arquivos Deletados

```bash
# Ver arquivos deletados
git log --diff-filter=D --summary

# Recuperar arquivo
git checkout HASH~1 -- caminho/arquivo.js
```

---

## 📚 Dicas Gerais

- `pwd` – caminho atual
- `ls` – listar arquivos
- `ls -a` – incluir ocultos
- `ls -l` – detalhes dos arquivos
- `tree` – estrutura de diretórios
- `CTRL + L` – limpar terminal
- `git help`, `git help -a`, `git help -g` – ajuda

---

## 🧠 Extras

```bash
# Iniciar repositório como pasta de trabalho
git init .

# Ver diferenças nos commits
git diff
git diff --staged

# Adicionar todos arquivos e commitar
git add .
git commit -m "mensagem"

# Commits rápidos com alias
git commit --amend --no-edit
```
