---
name: review-clean-code-vue
description: Dò tìm Code Smell và tổ chức lại giao diện, logic theo chuẩn Clean Code và 5 nguyên tắc SOLID trong Vue 3.
---
# SKILL: review-clean-code-vue

## Purpose
Mọi Developer khi chạy deadline đều vô tình sinh ra "mã rác" (Technical Debt) gây khó khăn khổng lồ để bảo trì sau này.
Agent áp dụng kỹ thuật Code Inspector vào một cụm Tính năng để đề xuất "Tổ chức lại Cấu trúc dự án" (Refactoring).

## Use When
- Bạn gặp 1 tính năng khó đọc, các dòng lệnh lồng ghép vào nhau (Nested quá nhiều).
- Có 1 luồng truyền dữ liệu phải pass Props xuống 3-4 tầng Component cha/con. Chán thì bảo Agent chạy skill này để tái cấu trúc.
- Cấu trúc component rườm rà, nhồi nhét quá nhiều logic vi phạm nguyên lý SOLID.

## Execution Checkpoints (Agent Scanning)
Agent cấm đọc lan man. Khi quét một nhánh (1 cha, 2 con), Model bắt buộc chấm điểm các bộ tiêu chí sau và báo cáo:

### 1. SOLID in Vue.js (Nguyên tắc Cốt lõi)
1. **S - Single Responsibility Principle (SRP):** Component/Composable chỉ làm 1 việc. Tách logic lộn xộn ra các composable nhỏ. Khuyến khích chia nhỏ template nếu file quá dài.
2. **O - Open/Closed Principle (OCP):** Thiết kế cấu trúc sao cho dễ mở rộng mà không phải sửa code gốc. Dùng `Slots`, `Scoped Slots` hoặc Dynamic Components thay vì viết chuỗi dài `v-if/v-else-if` phức tạp.
3. **L - Liskov Substitution Principle (LSP):** Base Component (ví dụ: `BaseButton`, `BaseInput`) khi dùng để thay thế thẻ HTML chuẩn phải đảm bảo nhận chuẩn prop/emit chính xác sự kiện như một phần tử gốc.
4. **I - Interface Segregation Principle (ISP):** Component chỉ nên nhận vào các prop mà nó thật sự cần thao tác. TUYỆT ĐỐI không ném nguyên object khổng lồ (VD: `toàn bộ user`) vào component con trong khi nó chỉ dùng một mẩu data (VD: `user.name`).
5. **D - Dependency Inversion Principle (DIP):** Tránh "ghi chết" config HTTP/Axios gọi API bên trong Component UI cấp thấp. Cần xử lý qua Store actions hoặc các composable dịch vụ dùng chung.

### 2. General Code Smell - Basic
1. **Prop-Drilling (Khoan sâu Props):** Dữ liệu truyền từ thẻ Cha -> Con 1 -> Con 2 -> Cháu 3. Báo cáo Tệ 🔴. Yêu cầu chuyển qua `Provide/Inject` Context Api hoặc đưa biến lên `Pinia Store`.
2. **Magic Strings / Magic Numbers:** Kiểm tra có `if (status === 3)` hay `type === 'draft'` nằm chết trên code không? Yêu cầu sinh file Enum (VD: `constants/status.ts`) vứt vào gán biến Constant.
3. **Template Lồng lộn xộn:** Các vòng lặp `v-if/v-for` lồng 3, 4 tầng. Phải bóc tách 3 tầng thẻ `<div>` sâu nhất thành 1 Mini-Component trong thư mục `components/...` cục bộ.

## Expected Output
- Table báo hiệu điểm thắt nút cấu trúc (Hạng mục | Tình trạng | Quy tắc SOLID | Cách giải quyết).
- Đánh giá cụ thể các vi phạm SOLID trong thiết kế Component hiện tại.
- Agent đề xuất đoạn code mẫu theo chuẩn SOLID hoặc Lệnh Linux sinh file chia nhỏ giúp User.
