#!/bin/bash
cd ~/.local/share/agent-toolbox || exit 1
mkdir -p ~/.agents/skills ~/.claude/skills

while true; do
  git pull --ff-only
  ln -sfn "$PWD"/skills/{pkg00-base,pkg01-dev}/* ~/.agents/skills/
  ln -sfn "$PWD"/skills/{pkg00-base,pkg01-dev}/* ~/.claude/skills/
  find ~/.agents/skills ~/.claude/skills -maxdepth 1 -xtype l -delete
  sleep 3600
done
