---
name: review-pinia-store
description: Review cấu trúc và hiệu năng của Pinia Store trong Vue 3, đặc biệt là lỗi mất Reactivity (Reactivity Loss).
---
# SKILL: review-pinia-store

## Purpose
Tối ưu hóa Pinia Store và nơi gọi Store. Khi Review, Agent thường bỏ sót lỗi lớn nhất của Pinia là "Destructuring Reactivity Loss" (gán mảng object mà quên dùng `storeToRefs`). 
Skill này ép hệ thống Review focus thẳng vào luồng dữ liệu (State & Actions) thay vì tốn Context đọc file lan man.

## Use When
- Khi User yêu cầu: "Review file store XYZ", "Sao state không update trên UI", hoặc trước khi duyệt PR thay đổi luồng state chung.

## Context Window Optimization
1. CHỈ Load file `stores/xxx.ts` được yêu cầu review.
2. Nếu đi kèm Component gọi Store, dùng `grep_search` kiểm tra cách component đó import từ Store (`storeToRefs`). Không load toàn bộ file component nếu nó lớn hơn 300 dòng.

## Execution Requirements (Các checkpoint bắt buộc)
Khi Review Pinia Store & Component liên quan, Agent BẮT BUỘC kiểm tra:
1. **Lỗi Mất Reactivity (Nghiệm trọng nhất):**
   - 🔴 Sai: `const { userList } = useUserStore()` (State sẽ "chết", không update UI).
   - 🟢 Đúng: `const { userList } = storeToRefs(useUserStore())` (Phải bọc trong `storeToRefs`).
2. **Setup Store Pattern:** Dự án dùng Vue 3, hãy cảnh báo nếu Store đang dùng "Options API Store" (kiểu cũ `state: () => ({})`). Đề xuất viết theo chuẩn **Setup Store** (`defineStore('x', () => { })`).
3. **Async Actions:** Trong các hàm Actions gọi API (VD: `useMy$Fetch`), có gán lại biến `isLoading.value` không? Có bắt `try/catch/finally` chuẩn không?
4. **Hữu dụng (Utility):** Có getter/computed nào được tính toán đi tính toán lại mà không dùng cache của Pinia không?

## Expected Output
- Báo cáo tập trung vào 4 điểm lỗi phía trên.
- Chỉ đưa đoạn code fix (`storeToRefs`, thêm `computed`, hoặc đổi sang Setup Store). Không in lại nguyên Store 1000 dòng.
