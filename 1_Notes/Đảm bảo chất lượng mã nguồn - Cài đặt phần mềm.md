---
created: 2026-05-12
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Công nghệ phần mềm - INT2208]]"
---
---

![[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm 2026-05-12 17.00.37.excalidraw|10000]]

# Cài đặt PM
AKA triển khai [[Thiết kế chi tiết]] thành chương trình
- Hạn chế xảy ra lỗi
- Mã nguồn dễ bảo trì, dễ sửa, dễ hiểu
- Nâng cấp - thay đổi dễ dàng
- Tái sử dụng cao

# Các yêu cầu viết mã nguồn chương trình
![[3_Assets/Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm 2026-05-12 17.00.37.excalidraw.md#^frame=MvYF8LOH|100%]]

### Chất lượng mã nguồn
Đáp ứng các tiêu chí: ***RMET***
1. **Dễ đọc (Readability)**
2. **Dễ bảo trì (Maintainability)**: Khi muốn thêm / sửa tính năng mới, hệ thống không làm ảnh hưởng đến các tính năng khác
3. **Hiệu quả (Efficiency)**: Sử dụng tối ưu tài nguyên tính toán
4. **Khả năng kiểm thử (Testability)**: Code chia thành module độc lập để dễ dàng kiểm thử

### Tiêu chuẩn lập trình *(Coding Standard / Conventions)* - "Chính tả" 
Là tập hợp các **quy tắc** về định dạng, cú pháp.
Bắt buộc tuân thủ 100%.

### Phong cách lập trình - "Văn phong"
Là cách mình viết code:
1. Đặt tên biến, hàm
	1. Sử dụng tên biến, tên hàm **có ý nghĩa, gợi nhớ**
	2. Tránh đặt quá dài
	3. Thống nhất về cách dùng
2. Câu lệnh
	1. Mô tả đc cấu trúc *(trước sau, thụt lề)*
	2. Đơn giản các câu lệnh
	3. Tránh cấu trúc phức tạp *(cấu trúc lồng nhau...)*

### Các kinh nghiệm lập trình *(best practices)*
1. ***KISS - "Keep It Simple, Stupid!!***
2. ***DRY - "Don't Repeat Yourself"***
3. ***YAGNI - "You Aren't Gonna Need It"***: Chỉ code tính năng hiện tại, không code tính năng tương lai

### Chú thích - Comments
- Hỗ trợ cho tính dễ đọc và tính dễ bảo trì
- Cách viết:
	- Cho mục đích sd của các biến
	- Các câu lệnh phức tạp
	- Các module
- Không cần viết cho câu lệnh đã rõ ràng 
### Tái sử dụng mã nguồn
- Tái sử dụng các thành phần đã đc định nghĩa trước
  *(Preventing "Reinventing the Wheel")*
  SD code đã được thẩm định
- Đặc điểm của PM tái sd:
	- Phân chia module
	- Có tính đóng gói

### Quản lý phiên bản
Quản lý quá trình chỉnh sửa mã nguồn của nhóm PT
![[3_Assets/Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm 2026-05-12 17.00.37.excalidraw.md#^frame=B4aH7jFl|100%]]

### Gỡ lỗi
Loại bỏ lỗi ctrinh
Các loại công cụ gỡ lỗi: 
- Debugging Tool
- Printlining: In ra thông tin cần theo dõi
- Logging: Ghi lại thông tin chương trình đợc thwjc thi

### Môi trường làm việc của dự án
- **Development (DEV):** Máy tính cá nhân của lập trình viên. Nơi code có thể lộn xộn, database là dữ liệu giả (dummy data).
- **Testing / Staging (QA/STG):** Môi trường sao chép y hệt thực tế. Nơi các tester (QA) sẽ "tấn công" phần mềm để tìm lỗi.
- **Production (PROD):** Môi trường thực tế, nơi khách hàng đang sử dụng. Dữ liệu ở đây là dữ liệu thật và việc sập hệ thống ở đây đồng nghĩa với mất tiền.

