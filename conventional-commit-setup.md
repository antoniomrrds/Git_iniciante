Claro! Aqui está o conteúdo em formato **Markdown (`.md`)**, pronto para você salvar como `setup-commits-dotnet.md` ou colar em qualquer README.

---

````md
# ✅ Setup de Commits Padronizados no .NET com Emojis

> Guia passo a passo para configurar Conventional Commits + Emojis + Validação com Husky, Commitlint e Commitizen no seu projeto .NET (C#)

---

## 🧩 Requisitos

- Git instalado
- Node.js e **pnpm** instalados
- Projeto Git iniciado (`git init`)
- Projeto .NET existente (C#, ASP.NET, etc.)

---

## 📦 Passo 1: Instalar as dependências

No terminal, dentro da pasta do seu projeto:

```bash
pnpm add -D commitizen cz-emoji husky @commitlint/cli @commitlint/config-conventional
````

---

## 📦 Passo 2: Configurar o `package.json`

Crie (ou edite) um arquivo chamado `package.json` com o seguinte conteúdo:

```json
{
  "name": "seu-projeto-dotnet",
  "version": "1.0.0",
  "scripts": {
    "prepare": "husky install",
    "commit": "cz"
  },
  "devDependencies": {
    "@commitlint/cli": "^19.8.1",
    "@commitlint/config-conventional": "^19.8.1",
    "cz-emoji": "^1.3.0",
    "commitizen": "^4.3.0",
    "husky": "^9.1.7"
  },
  "config": {
    "commitizen": {
      "path": "cz-emoji"
    }
  }
}
```

---

## 📦 Passo 3: Criar configuração do Commitlint

Crie um arquivo na raiz chamado:

```
commitlint.config.cjs
```

Com o seguinte conteúdo:

```js
module.exports = {
  extends: ['@commitlint/config-conventional']
};
```

---

## 📦 Passo 4: Inicializar o Husky

Execute:

```bash
pnpm dlx husky-init
pnpm install
```

> Isso criará a pasta `.husky/` e ativará os hooks

---

## 📦 Passo 5: Criar hook de validação de commit

Edite o arquivo `.husky/commit-msg` e insira:

```bash
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

pnpm exec commitlint --edit "$1"
```

Certifique-se de que o arquivo é executável (no Git Bash/WSL):

```bash
chmod +x .husky/commit-msg
```

---

## 📦 Passo 6: Fazer um commit amigável com emoji

Agora, ao invés de usar `git commit`, use:

```bash
pnpm commit
```

Você verá um prompt interativo como este:

```
? Select the type of change: ✨ feat
? Scope: auth
? Description: adiciona login com Google
```

💬 O commit gerado será algo como:

```
✨ feat(auth): adiciona login com Google
```

---

## ✅ Resultado

| Funcionalidade             | Ativado |
| -------------------------- | ------- |
| Commits interativos        | ✅       |
| Emojis automáticos         | ✅       |
| Validação com Commitlint   | ✅       |
| Hook Git com Husky         | ✅       |
| Padrão para o time inteiro | ✅       |

---

## 🧪 Dica

Adicione `.husky/_/` ao `.gitignore` para evitar arquivos desnecessários no Git:

```
# Husky
.husky/_/
```

---

## 🙌 Pronto!

Seu projeto .NET agora tem:

* ✅ Commits bonitos e padronizados
* ✅ Validação automática
* ✅ Emojis sem erro
* ✅ Configuração compatível com CI/CD

Use **`pnpm commit`** sempre para garantir o padrão!

