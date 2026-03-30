---
name: meeting-note-to-actions
description: Chuyển đổi biên bản họp (meeting notes) thô thành bản tóm tắt hành động (action plan) có cấu trúc.
---
# SKILL: meeting-note-to-actions

## Purpose
Biến các mẩu ghi chú họp rời rạc, không cấu trúc thành một bản tóm tắt nội dung chính và danh sách công việc cần làm (action items) rõ ràng, có phân công người phụ trách và deadline.

## Use When
- Ngay sau khi kết thúc một cuộc họp dài
- Cần gửi email follow-up cho khách hàng hoặc team
- Khi có một bản transcript chữ dài cần tóm gọn

## Required Inputs
- Meeting notes thô (giọng nói, chữ đánh vội)
- Danh sách người tham gia (nếu có để assign tasks)
- Ngữ cảnh dự án (ngắn gọn)

## Expected Output
- Bản tóm tắt 3-5 ý chính đã chốt (Key Takeaways)
- Danh sách công việc (Action Items) theo định dạng bảng: Task | Assignee | Deadline
- Những vấn đề còn tồn đọng (Open questions/Blockers)

## Execution Approach
1. Đọc lướt toàn bộ notes thô để hiểu ngữ cảnh.
2. Lọc bỏ các thông tin ngoài lề, small talk.
3. Gom nhóm các quyết định (decisions) vào một mục.
4. Trích xuất tất cả các câu chứa hành động ("A sẽ làm X trước Y").
5. Format lại output thành dạng Markdown dễ đọc.

## Quality Criteria
- Không sót việc quan trọng
- Ai làm gì, khi nào phải cực kỳ rõ ràng
- Câu chữ súc tích, chuyên nghiệp

## Verification
- Có task nào thiếu người làm không?
- Có assignee nào được nhắc đến mà sai tên/role không?
- Các decisions có đi đôi với actions giải quyết nó không?
