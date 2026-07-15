# agent-toolbox

agent 関係のファイルを保存しておく

# crit

https://github.com/tomasz-tomczyk/crit/releases の最新版のタグにする。

```
https://github.com/tomasz-tomczyk/crit/releases/download/v0.18.0/crit-linux-amd64 && chmod +x crit-linux-amd64 && sudo mv crit-linux-amd64 /usr/local/bin/crit

crit install codex
```

# codex

```
curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh
codex login --device-auth
```

# playwright
```
npm install -g @playwright/cli@latest
npx playwright install
sudo npx playwright install-deps
playwright-cli install --skills agents
```



