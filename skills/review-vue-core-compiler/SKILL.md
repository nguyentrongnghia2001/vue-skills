---
name: review-vue-core-compiler
description: Review Vue compiler code (AST transform, code generation, optimization) với focus vào performance và correctness cho compiler-core, compiler-dom, compiler-sfc packages.
---

# SKILL: review-vue-core-compiler

## Purpose

Cấu trúc hóa việc review compiler code trong Vue core, tập trung vào 3 giai đoạn:
1. **Parsing & AST** - Cấu trúc cây cú pháp
2. **Transform** - Biến đổi AST tối ưu
3. **Code Generation** - Xuất code tối ưu

## Use When

- Review PR ở `compiler-core/`, `compiler-dom/`, `compiler-sfc/` packages
- Optimize code generation để giảm bundle size
- Refactor AST traversal/transformation logic
- Debug compiler edge cases hoặc performance issues

## Execution Approach

Agent phải kiểm tra theo thứ tự:

1. **AST Correctness**: Cây cú pháp có bao gồm tất cả node cần thiết không? Có thiếu metadata không?
2. **Transform Logic**: Các transform function có đảm bảo AST đầu ra hợp lệ không? Có tối ưu được không?
3. **Code Generation**: Generated code có tương ứng với AST không? Có tránh được dead-code/unreachable không?
4. **Memory/Perf**: Có reuse object được không? Có tránh tạo object không cần không?

## Expected Output

- Checklist Pass 🟢 / Fail 🔴 cho từng giai đoạn
- Nêu cụ thể vị trí lỗi (hàm, dòng)
- Đề xuất fix code hoặc optimization idea

## Context Optimization

- CHỈ đọc file compiler code cần review, không scan toàn bộ package
- Nếu cần xem test case, dùng `grep_search` tìm file test tương ứng
- Tối ưu context bằng cách chỉ load relevant transform/generate logic
