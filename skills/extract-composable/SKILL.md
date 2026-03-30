---
name: extract-composable
description: Tách business logic (API, Validate, State phức tạp) ra khỏi Component Vue thành một Composable dùng chung.
---
# SKILL: extract-composable

## Purpose
Ngăn chặn tình trạng "Fat Component" thường gặp trong Vue: Các file `.vue` quá dài hàng trăm dòng vì nhồi nhét xử lý logic bên dưới UI.
Skill này định hướng Agent (và Dev) bóc tách toàn bộ mảng Business Logic, State nội bộ và Data Fetching ra thành một file `composables/useXXX.ts`, chỉ giữ lại phần thuần túy cho UI Render. Cực kỳ dễ bảo trì!

## Use When
- File Component vỡ mốc > 300 dòng và phần lớn là trong thẻ `<script setup>`.
- Có đoạn logic check validation form hoặc xử lý mảng (filter, sort) chạy cục bộ nhưng có khả năng dùng cho trang khác.
- Yêu cầu: *"Dựng cho tôi file Composable tách mớ code này ra khỏi .vue".*

## Execution Requirements
1. CHỈ mở 1 file `.vue` vừa được truyền vào. Đọc cấu trúc.
2. Tìm mảng code có thể gom lại thành 1 chức năng (Ví dụ như quản lý Validate, Form Input, Fetch Bảng Dữ Liệu).
3. Sử dụng Tool `write_to_file` để xuất thẳng toàn bộ code vào `composables/use[FunctionName].ts`.
4. Trả về cho User đoạn mã import ngắn gọn để dán vào file Component cũ. (VD: `const { list, isLoading, fetchData } = useXYZ()`).

## Context Optimization
Cấm Agent mở thêm bất kỳ Component nào khác. Focus 100% vào việc bóc tách `ref()` và `function()` sang `return { }` trong thẻ Closure TS.

## Check-list (Verification)
- [ ] Logic tách ra không dính tới thẻ DOM hay `document.getElementById` (vi phạm bản chất Composable).
- [ ] Không rò rỉ (leak) biến toàn cục giữa các instance (Composable phải xuất mọi biến ra từ bên trong return function).
