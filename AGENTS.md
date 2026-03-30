# AGENTS.md

Repository-level guidance for contributors and coding agents.

## Scope

This repository contains reusable Agent Skills for Vue/Nuxt workflows.

- Canonical skill location: `skills/`
- Each skill must include `SKILL.md` with valid YAML frontmatter.

## Required frontmatter

```yaml
---
name: my-skill
description: What this skill does and when to use it.
---
```

## Authoring rules

1. Use `kebab-case` for folder and `name`.
2. Keep `description` concrete and activation-oriented.
3. Prefer step-by-step instructions in Markdown body.
4. Avoid machine-specific paths and secrets.

## Optional skill folders

- `scripts/` for automation helpers
- `references/` for supporting docs
- `assets/` for templates/resources

Project-specific extras like `examples/`, `templates/`, and `verification/` are allowed.

## Compatibility target

Skills should stay compatible with Agent Skills ecosystem and install flows like:

- `npx skills add <owner>/<repo>`
- `npx skills add <owner>/<repo> --skill <skill-name>`
