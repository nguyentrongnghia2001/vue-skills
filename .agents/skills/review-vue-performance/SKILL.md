---
name: review-vue-performance
description: Review code Vue 3/Nuxt 3 component chuyên sâu về hiệu năng và chống memory leak, cực kỳ tiết kiệm Context Area.
---
# SKILL: review-vue-performance

## Purpose
Ngăn chặn tình trạng AI (và thậm chí là Reviewer) rà soát toàn bộ code lan man. Skill này cấu trúc hóa việc duyệt một `.vue` component, chỉ tập trung vào 4 điểm gây giảm hiệu năng lớn nhất, bỏ qua HTML styling/CSS cơ bản để tiết kiệm Token.

## Use When
- Khi User muốn tối ưu lại một Component bị chậm (VD: ModalViewTemplate, Danh sách Contact).
- Trước khi đóng Pull Request cho một tính năng Frontend phức tạp.

## Context Optimization Rules (Luật Giới Hạn Context)
1. **CHỈ đọc duy nhất** file `.vue` đang được yêu cầu review. Tuyệt đối **KHÔNG** đọc các file cha/con của nó nếu chưa được tính năng yêu cầu (ngăn AI đọc nguyên cụm Component).
2. Nếu Model phát hiện composable lạ (như `useNotification`), dùng `grep_search` quét đúng tên hàm và đọc đúng file đó. Rút gọn Context tối đa.

## Execution Approach (Luồng Review Bắt Buộc)
Khi nhận 1 đoạn code Vue, Agent phải check theo thứ tự:
1. **Reactivity:** Đang xài `ref` hay `reactive`? Có dư thừa biến state không gán/render không?
2. **Loops:** Các thẻ `v-for` có gắn `:key` chuẩn (dùng ID thay vì index) chưa?
3. **Memory Leaks:** Các sự kiện (event listener, setInterval) đăng ký ở `onMounted` có được gỡ bỏ trong `onUnmounted` không?
4. **Data Fetching:** Thẻ `<Suspense>` hoặc `useAsyncData` có bị gọi lại nhiều lần không? Nút bấm có trạng thái `loading/disabled` khi await API chưa? (Ví dụ: Lỗi plugin button bị bấm nhiều lần).

## Expected Output
- Dạng List checklist (Pass 🟢 / Fail 🔴) cho từng mục trên.
- Chỉ đề xuất đoạn code ĐƯỢC THAY ĐỔI, không sinh lại nguyên file Vue hàng trăm dòng trừ khi cần thiết. 
