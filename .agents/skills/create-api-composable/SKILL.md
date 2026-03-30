---
name: create-api-composable
description: Tạo composable gọi API chuẩn Nuxt 3 của dự án, tối ưu context window bằng việc giới hạn phạm vi đọc file.
---
# SKILL: create-api-composable

## Purpose
Ngăn chặn Agent đọc lan man toàn bộ mã nguồn khi tạo mới/cập nhật chức năng gọi API. 
Skill này ép Agent CHỈ ĐƯỢC PHÉP đọc đúng các file cấu hình liên quan thay vì quét toàn bộ hệ thống, giúp **tiết kiệm Context Window** và **tăng tốc độ Model phản hồi**.

## Use When
- Khi Dev yêu cầu: *"Viết hàm gọi API lấy danh sách data"*, *"Tạo service fetch dữ liệu"*, hoặc *"Làm lại luồng gọi API"*.

## Context Optimization Rules (Luật tối ưu Context - BẮT BUỘC)
Để Model không tốn Token và không bị "Hallucination" (ảo giác code), Agent KHI NẠP SKILL NÀY PHẢI TUÂN THỦ:
1. **KHÔNG** dùng lệnh tìm kiếm diện rộng (`grep_search` vô định) hoặc đọc toàn bộ các Component không liên quan.
2. **CHỈ được phép gọi tool đọc các file cốt lõi sau:**
   - Base fetch api: Các file trong thư mục `utils/` hoặc định nghĩa `$fetch`.
   - Type definitions: Các interface định nghĩa kiểu dữ liệu.

## Expected Output
- Một file TypeScript/Vue composable.
- Cấu trúc bắt buộc sử dụng cơ chế `useAsyncData` hoặc `useFetch` của cục bộ dự án.
- Try/catch bắt lỗi theo chuẩn và đưa ra log rõ ràng (VD: Sentry error logging nếu có).

## Verification (Code Review tự động)
- [ ] Code sinh ra có import thừa thãi các thư viện bên ngoài không?
- [ ] Lượng context window đọc vào có bị dư thừa file nào không? (Agent phải xác nhận số file đã mở).
- [ ] Hàm tạo ra có bị conflict với các biến toàn cục (như `authStore`) không?
