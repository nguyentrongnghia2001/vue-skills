---
name: organize-types-interfaces
description: Thu gom toàn bộ định nghĩa TypeScript (Interface, Type) vụn vặt rải rác trong các Component về thư mục gốc types/.
---
# SKILL: organize-types-interfaces

## Purpose
Chấm dứt việc mỗi file `<script setup lang="ts">` chứa 20, 30 dòng tự định nghĩa Type/Interface gây phình cấu trúc và khó đồng bộ qua lại. Đặc biệt Nuxt 3 đã hỗ trợ Auto-Import cho thư mục `types/`.
Skill này tự động di dời (refactor) các interface đó sang `.d.ts` hoặc `.ts` dùng chung.

## Use When
- Một Object data (như Interface User, Interface Order) bị khai báo lặp đi lặp lại ở 3, 4 màn hình khác nhau.
- Refactor định kỳ cấu trúc Data Models.

## Execution Rules
1. Khi Agent được yêu cầu *"Chuẩn hóa phần Type của màn hình Bảng Dữ Liệu"*. Agent tìm kiếm toàn bộ từ khóa chữ `interface XYZ` đang nằm ở trên cùng của thẻ `script` ở file `.vue`.
2. Dùng Tool tạo một file mới dạng `types/[ten-chuc-nang].ts` (hoặc `.d.ts` nếu là cấu trúc Global).
3. Đặt `export interface` (nếu không phải là file .d.ts).
4. Sửa thẻ `<script setup>` trong file gốc bằng Tool `replace_file_content` để xóa những khai báo đó đi, tận dụng auto-imports của Nuxt để Types tự nhận diện.

## Quality Criteria
- Tên Type phải có tiền tố rõ ràng (Ví dụ: `IContact`, `IOrderForm`, `TApiResponse`) không đặt chung chung là `Data` hay `Item`.
- Đảm bảo mã Types bóc ra sẽ không phá vỡ Props/Emits của Vue compiler (Nếu là Prop interface nằm cùng file thì nên giữ lại hoặc import rõ ràng theo chuẩn `import type`).
