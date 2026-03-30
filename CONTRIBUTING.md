# Contributing Guide

Cảm ơn bạn đã đóng góp cho kho skill 🎯

## Quy ước bắt buộc

- Tên skill theo `kebab-case`.
- Mỗi skill nằm tại `.agents/skills/<skill-name>/`.
- Bắt buộc có file `SKILL.md` với YAML frontmatter:
  - `name`
  - `description`

## Cấu trúc tối thiểu của một skill

- `SKILL.md`
- `examples/`
- `templates/`
- `verification/`
- `scripts/`

## Nội dung `SKILL.md` khuyến nghị

- `Purpose`
- `Use When`
- `Expected Output`
- `Execution Approach` (nếu cần)
- `Quality Criteria` (nếu cần)

## Cách tạo nhanh skill mới

- Bash: `scripts/new-skill.sh <skill-name>`
- PowerShell: `scripts/new-skill.ps1 -SkillName <skill-name>`

## Pull Request checklist

- [ ] Tên skill đúng chuẩn.
- [ ] Không dùng đường dẫn cứng theo máy cá nhân.
- [ ] Không xóa/chỉnh sửa skill khác ngoài phạm vi PR.
- [ ] Nội dung rõ ràng, không mơ hồ.
- [ ] Đã tự review chính tả/format Markdown.
