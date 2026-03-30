# Vue Skills Best Practices

Kho này chứa bộ **agent skills** cho Vue 3 / Nuxt 3 để team dùng lại thống nhất theo best practice.

## Mục tiêu

- Chuẩn hóa cách làm việc với AI agent trong dự án Vue/Nuxt.
- Giảm lặp lại prompt thủ công bằng skill tái sử dụng.
- Giữ cấu trúc rõ ràng để mọi người dễ clone, học, và mở rộng.

## Cấu trúc repo

- `.agents/skills/<skill-name>/SKILL.md`: định nghĩa chính của skill.
- `.agents/skills/<skill-name>/examples/`: ví dụ input/output.
- `.agents/skills/<skill-name>/templates/`: template dùng lại.
- `.agents/skills/<skill-name>/verification/`: checklist/tiêu chí kiểm tra.
- `.agents/skills/<skill-name>/scripts/`: script hỗ trợ riêng cho skill.

## Danh sách skill hiện có

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

## Cách sử dụng

### 1) Clone repo

Clone repo này về máy, mở bằng VS Code, rồi chọn skill phù hợp trong `.agents/skills/`.

### 2) Dùng skill trong dự án khác

Có 2 cách phổ biến:

- Copy skill cần dùng từ repo này sang thư mục `.agents/skills/` của dự án đích.
- Hoặc thêm repo này làm submodule/subtree để cập nhật tập trung.

### 3) Tạo skill mới

- Bash (macOS/Linux/Git Bash): chạy `scripts/new-skill.sh <skill-name>`
- PowerShell (Windows): chạy `scripts/new-skill.ps1 -SkillName <skill-name>`

Skill name phải theo `kebab-case` (ví dụ: `review-auth-flow`).

## Nguyên tắc chất lượng

- Mỗi skill phải có frontmatter (`name`, `description`).
- Mục `Use When` phải rõ phạm vi sử dụng.
- Có tiêu chí kiểm tra tối thiểu trong `verification/` nếu skill phức tạp.
- Không hard-code đường dẫn máy cá nhân trong script.

## Đóng góp

Xem hướng dẫn tại `CONTRIBUTING.md`.

## License

MIT — xem `LICENSE`.
