---
name: debug-sentry-error
description: Hỗ trợ debug lỗi từ Sentry (v9.1.0) cho Nuxt 3, khoanh vùng chính xác dòng code lỗi, tiết kiệm 80% Context Window.
---
# SKILL: debug-sentry-error

## Purpose
Debug lỗi production báo về từ hệ thống Sentry. Khi có Stack Trace, AI thường muốn dùng `list_dir` đọc toàn bộ thư mục để tìm manh mối. 
Skill này **cấm AI quét lan man**, ép Agent khoanh vùng đúng file/dòng bị báo lỗi và môi trường bao quanh nó.

## Use When
- User dán một đoạn log lỗi / Stack Trace (Sentry/Console) vào chat và bảo "Sửa lỗi này".

## Context Optimization Rules (Luật Giới Hạn Context)
1. Xác định file có trong Stack Trace (thường là file `.vue` hoặc `.ts` cuối cùng xuất hiện).
2. Dùng `view_file` tải ** ĐÚNG LINE ĐÓ +- 20 dòng** (dùng tham số StartLine & EndLine). KHÔNG load toàn bộ file nếu file trên 200 dòng.
3. KHÔNG quét thư mục cấu hình Sentry (`sentry.client.ts` / `sentry.server.ts`) trừ khi bản thân module Sentry bị crash khởi tạo.

## Execution Approach
1. Phân tích Stack Trace để lấy [Tên File] & [Dòng Lỗi].
2. Nạp đoạn code +- 20 dòng xung quanh dòng lỗi.
3. Xác định phân loại lỗi:
   - *Lỗi Null/Undefined:* (Do object `user.id` chưa có dữ liệu API trả về nhưng đã render). -> Thêm Optional Chaining `?.` hoặc `v-if`.
   - *Lỗi Hydration:* (SSR sinh ra HTML không khớp với Client). -> Bọc trong `<ClientOnly>` hoặc check lại logic mount.
   - *Lỗi API Call:* Kiểm tra lại biến môi trường hoặc params truyền vào.

## Expected Output
- Lời giải thích ngắn gọn nguyên nhân root cause.
- Đoạn Diff thay đổi dòng code lỗi kèm Try/Catch hoặc Guard clause.
