---
name: fix-usemyfetch-error
description: Sửa lỗi đơ màn hình/Lỗi không phản hồi của Component bắt nguồn từ Wrapper API `useMy$Fetch`.
---
# SKILL: fix-usemyfetch-error

## Purpose
Tập trung điều trị tình trạng (mà dự án Fastboy Payment hay gặp): Nút bấm gọi API xong bị liệt, danh sách không cập nhật, hoặc data không chịu render dù file `data.json` có. 
Tất cả thường do xử lý lỗi ở `await useMy$Fetch(...)` chưa triệt để.

## Use When
- "Button này bị lỗi click không ăn sau khi fetch API thất bại"
- "Danh sách báo lỗi rỗng dù log có data"

## Context Optimization Rules
1. CHỈ Load file Component mà user report lỗi.
2. Nhanh chóng tìm kiếm lệnh gọi hạm `useMy$Fetch` bằng regex/grep.
3. **BẮT BUỘC KIỂM TRA:** Nơi gọi `useMy$Fetch` có được bọc trong vòng `try...catch...finally` hay chưa.

## Execution Approach
Rất nhiều lỗi UI bị đơ là do thiếu khối `finally` để reset biến `isLoading.value = false` khi API ném ra Exception.
Agent ngay lập tức fix theo luồng:
1. Thêm `const isLoading = ref(false)` (nếu chưa có).
2. Sửa lại hàm gọi sự kiện:
```ts
const handleCallApi = async () => {
  if (isLoading.value) return; // Prevent double click
  isLoading.value = true;
  try {
     const data = await useMy$Fetch('/api/endpoint');
     // handle data
  } catch (error) {
     // handle error/notification
  } finally {
     isLoading.value = false; // Luôn luôn chạy để gỡ block UI
  }
}
```

## Expected Output
Đoạn code đã được bọc an toàn, UI Component có bind thuộc tính `:loading="isLoading"` hoặc `:disabled="isLoading"`. Trả lại nguyên file hoặc đoạn script để user cập nhật.
