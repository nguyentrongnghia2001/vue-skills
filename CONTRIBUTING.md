# Contributing Guide

Cảm ơn bạn đã đóng góp cho kho skill 🎯

## Goal

Giữ repo theo chuẩn Agent Skills để dễ dùng với `npx skills add` và tương thích nhiều agent.

## Required conventions

- Tên skill theo `kebab-case`.
- Mỗi skill nằm tại `skills/<skill-name>/`.
- Bắt buộc có `SKILL.md` với frontmatter YAML hợp lệ:
  - `name` (required)
  - `description` (required)

Frontmatter mẫu:

```yaml
---
name: my-skill
description: What this skill does and when to use it.
---
```

## Recommended skill structure

- `SKILL.md` (required)
- `scripts/` (optional)
- `references/` (optional)
- `assets/` (optional)

Repo này vẫn hỗ trợ thêm `examples/`, `templates/`, `verification/` khi cần tài liệu nội bộ.

## SKILL.md writing tips

- Mở đầu rõ “khi nào dùng skill này” (triggering context).
- Chỉ dẫn theo bước, tránh mơ hồ.
- Nếu có script/tool side effects, ghi rõ điều kiện và expected output.

## Create a new skill

- Bash: `scripts/new-skill.sh <skill-name>`
- PowerShell: `scripts/new-skill.ps1 -SkillName <skill-name>`
- Hoặc: `npx skills init <skill-name>`

## Optional metadata

Bạn có thể thêm:

```yaml
metadata:
  internal: true
```

để ẩn skill khỏi discover thông thường (chỉ hiện khi bật biến môi trường cho internal skills).

## Pull Request checklist

- [ ] Frontmatter YAML hợp lệ (`name`, `description`).
- [ ] Tên skill khớp thư mục và đúng `kebab-case`.
- [ ] Không dùng đường dẫn hard-code theo máy cá nhân.
- [ ] Nội dung rõ ràng, có thể thực thi được.
- [ ] Không chỉnh sửa ngoài phạm vi PR.
