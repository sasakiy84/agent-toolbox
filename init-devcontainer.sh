if [ -f ".devcontainer/devcontainer.json" ]; then echo ".devcontainer/devcontainer.json already exists"; exit 0; fi; mkdir -p .devcontainer && cat > .devcontainer/devcontainer.json <<'EOF'
{
	"name": "",
	"image": "mcr.microsoft.com/devcontainers/base:resolute",
  "remoteUser": "vscode",
	"shutdownAction": "none",
	"appPort": [
		// hostPort:containerPort
	],
	"features": {
		"ghcr.io/devcontainers/features/docker-in-docker:4": {
			"version": "latest",
			"moby": "false"
		},
		"ghcr.io/devcontainers/features/github-cli:1": {
			"version": "latest"
		},
		"ghcr.io/devcontainers/features/node:2": {
			"version": "latest"
		},
		"ghcr.io/devcontainers/features/rust:1": {
			"version": "latest",
			"profile": "minimal"
		},
		"ghcr.io/devcontainers/features/go:1": {
			"version": "latest"
		}
	},
	"remoteEnv": {
		"BUN_INSTALL": "/home/vscode/.local",
		"PATH": "/home/vscode/.local/bin:${containerEnv:PATH}"
	},
	"mounts": [
    "type=bind,source=/mnt/data1,target=/data,readonly",
    "source=claude-code-config,target=/home/vscode/.claude,type=volume",
    "source=anthropic-config,target=/home/vscode/.config/anthropic,type=volume",
    "source=codex-config,target=/home/vscode/.codex,type=volume",
		"source=codex-control-${localWorkspaceFolderBasename},target=/home/vscode/.codex/app-server-control,type=volume",
    "source=codex-daemon-${localWorkspaceFolderBasename},target=/home/vscode/.codex/app-server-daemon,type=volume",
    "source=copilot-config,target=/home/vscode/.copilot,type=volume",
    "source=gh-config,target=/home/vscode/.config/gh,type=volume"
	],
  "containerEnv": {
		"CLAUDE_CONFIG_DIR": "/home/vscode/.claude"
	},
	"runArgs": [
		"--gpus=all",
    "--hostname=${localWorkspaceFolderBasename}-devcontainer",
    "--name=devcontainer-${localWorkspaceFolderBasename}-${devcontainerId}"
	],
  "onCreateCommand": "sudo chown -R \"$(id -u):$(id -g)\" /home/vscode/.claude /home/vscode/.codex /home/vscode/.config/gh",
  "postCreateCommand": {
		"codex": "curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh",
    "claude": "curl -fsSL https://claude.ai/install.sh | bash",
		"uv": "curl -LsSf https://astral.sh/uv/install.sh | sh",
		"bun": "curl -fsSL https://bun.com/install | bash",
    "playwright-cli": "npm install -g @playwright/cli@latest && playwright-cli install-browser chromium --with-deps && playwright-cli install --skills=agents --global && playwright-cli install --skills=claude --global",
		"sasakiy-skills": "mkdir -p ~/.local/share && git clone --depth 1 https://github.com/sasakiy84/agent-toolbox.git ~/.local/share/agent-toolbox"
	},
	"postStartCommand": {
		"sync-basic-skills": "nohup bash -c 'bash /home/vscode/.local/share/agent-toolbox/sync-basic-skills.sh >/tmp/skills-update.log 2>&1 </dev/null &' >/dev/null 2>&1",
		"codex-remote": "codex remote-control start"
	}
}
EOF