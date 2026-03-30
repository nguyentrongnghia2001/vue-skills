---
name: scaffold-agent-skill-system
description: Tạo bộ khung cấu trúc thư mục và file mẫu cho một system skill của agent.
---
# SKILL: scaffold-agent-skill-system

## Purpose
Tạo sẵn bộ khung (scaffolding) cho một skill agent, bao gồm các thư mục con và tệp tin quan trọng nhất, để người dùng có thể ngay lập tức điền nội dung thay vì phải tạo thủ công từng file.

## Use When
- Bắt đầu tạo mới một process / agent skill
- Muốn duy trì chuẩn cấu trúc `.agents/skills` cho cả team
- Mỗi khi thấy một tác vụ lặp dài và muốn chuyển nó thành skill.

## Required Inputs
- Tên skill (quy tắc kaban-case)
- Mục đích ngắn gọn của skill

## Expected Output
- Thư mục skill được tạo tại `.agents/skills/<skill-name>`
- Các thư mục: examples, templates, verification, scripts
- File SKILL.md có sẵn format chuẩn với thông tin đã cung cấp.

## Execution Approach
1. Kiểm tra xem tên skill hợp lệ không (chỉ lowercase, hyphens).
2. Chạy bash command / shell script để tạo cấu trúc tree.
3. Sinh file markdown mẫu `SKILL.md` dựa trên `TargetFile` và parameters.
4. Trả về thông báo thành công.

## Quality Criteria
- Script không xóa các file cũ nếu skill đã tồn tại
- Render đúng chuẩn mẫu của Anthropic

## References
- scripts/scaffold.sh
