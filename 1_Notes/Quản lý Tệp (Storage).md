---
created: 2026-06-02
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Nguyên lý hệ điều hành - INT2214]]"
---
---
# Giao diện hệ thống tệp

![[Quản lý Tệp (Storage) 2026-06-08 15.52.11.excalidraw]]

Phần này dễ quá đọc slide thôi:v


![[Quản lý Tệp (Storage) 2026-06-08 20.59.04.excalidraw|800]]

### Tệp ảo
![[Quản lý Tệp (Storage) 2026-06-08 21.21.22.excalidraw|800]]

### Cài đặt thư mục: 
1. Bằng danh sách tuyến tính (array) *(dễ cài đặt nhưng chạy lâu)1*
2. Hash table - Danh sách tuyến tính + bảng băm
	- Cỡ cố định
	- Collision

### Cấp phát
1. Cấp phát liên tục
	- Mỗi tệp chiếm không gian liên tục
	- Cần địa chỉ đầu và độ dài
	- Truy cập ngẫu nhiên
	=> NHƯỢC: PHÂN MẢNH NGOÀI
2. Cấp phát liên kết (ô này trỏ đến ô kia)
	- Địa chỉ khối đầu tiên là xác định được
	- Cài đặt bằng linked list
3. Cấp phát chỉ số
	- Dùng một ô nhớ để lưu hết tất cả
	- Các chỉ số trong ô nhớ đó lại tham chiếu vào các block khác nhau trong storage

|**Tiêu chí**|**Liên tục (Contiguous)**|**Liên kết (Linked)**|**Chỉ số (Indexed)**|
|---|---|---|---|
|**Phân mảnh ngoài**|Rất nghiêm trọng|Không có|Không có|
|**Truy cập tuần tự**|Cực nhanh|Chậm (đầu đọc nhảy loạn xạ)|Nhanh hơn liên kết|
|**Truy cập trực tiếp**|Cực nhanh (Toán học: $Địa\_chỉ + N$)|Rất chậm (Phải duyệt tuần tự)|Cực nhanh (Tra cứu bảng)|
|**Chi phí Metadata**|Siêu thấp|Trung bình (Nằm trong mỗi khối)|Cao (Tốn nguyên Khối chỉ số)|
|**Phù hợp nhất cho**|Bộ nhớ ROM, đĩa CD/DVD|Tệp đọc tuần tự, hệ thống nhỏ|Các hệ điều hành đa năng hiện đại|