# Vue Agent Skills

Bộ skill best-practices cho Vue 3 / Nuxt 3, thiết kế theo hướng tương thích hệ sinh thái **Agent Skills** (như `vercel-labs/skills`).

## What is this?

Mỗi skill là một thư mục chứa `SKILL.md` với YAML frontmatter:

- `name`: định danh skill (kebab-case)
- `description`: mô tả ngắn, nêu rõ khi nào nên dùng

Skills trong repo này tập trung vào các workflow Vue/Nuxt thực tế (composable, Pinia, performance, clean-code, debug Sentry, v.v.) cũng như Vue core development (compiler, reactivity, types organization).

## Install a skill

Repo này tương thích với `npx skills add`.

- Cài từ GitHub repo: `npx skills add nguyentrongnghia2001/vue-skills`
- Cài từ URL đầy đủ: `npx skills add https://github.com/nguyentrongnghia2001/vue-skills`
- Cài từ local path: `npx skills add ./vue-skills`

Ví dụ hữu ích:

- Liệt kê skill: `npx skills add nguyentrongnghia2001/vue-skills --list`
- Cài skill cụ thể: `npx skills add nguyentrongnghia2001/vue-skills --skill review-vue-performance`
- Cài cho agent cụ thể: `npx skills add nguyentrongnghia2001/vue-skills -a github-copilot`

## Skill discovery compatibility

Theo chuẩn `skills` CLI, skill có thể được discover ở nhiều path. Repo này đặt skills tại:

- `skills/`

Path này tương thích tốt với Copilot/Codex/Cursor và nhiều agent khác trong hệ Agent Skills.

## Repository structure

- `skills/<skill-name>/SKILL.md` (required)
- `skills/<skill-name>/scripts/` (optional)
- `skills/<skill-name>/references/` (optional)
- `skills/<skill-name>/assets/` (optional)

Ngoài ra repo có thể dùng thêm `examples/`, `templates/`, `verification/` cho mục đích tài liệu nội bộ.

## Current skills

### Vue/Nuxt Application Development

- `create-api-composable`
- `debug-sentry-error`
- `extract-composable`
- `fix-usemyfetch-error`
- `meeting-note-to-actions`
- `organize-types-interfaces`
- `review-clean-code-vue`
- `review-pinia-store`
- `review-vue-performance`
- `scaffold-agent-skill-system`
- `scaffold-nuxt-component`
- `scaffold-pinia-store`
- `write-enterprise-proposal`

### Vue Application Best Practices

- `review-vue-templates` - Review template code (v-if, v-for, slots, transitions) for performance & memory safety
- `optimize-vue-reactivity` - Optimize reactivity patterns (watch cleanup, memory leaks, array mutations)
- `structure-vue-types` - Structure component TypeScript types (props, emits, slots) to avoid TS slowness

## Create a new skill

- Bash: `scripts/new-skill.sh <skill-name>`
- PowerShell: `scripts/new-skill.ps1 -SkillName <skill-name>`

Hoặc dùng CLI chung:

- `npx skills init <skill-name>`

## Contributing

Xem `CONTRIBUTING.md` để theo đúng spec + checklist.

## License

MIT — xem `LICENSE`.
  