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
\src: 
[[Week 10 - Thiết kế chi tiết 2026-05-05 16.47.14.excalidraw]]
[[09-Thiet ke chi tiet.pptx]]


![[(Thiết kế) Kiến trúc phần mềm 2026-06-13 13.15.02.excalidraw|700]]

# Thiết kế theo quy trình truyền thống
![[Thiết kế chi tiết 2026-06-14 00.33.05.excalidraw|1000]]

1. Nó nhận đầu vào *(từ bước trước)*: 
	- Platform information: Thông tin nền tảng
	- Requirements Specification: Đặc tả yêu cầu
	- Data Description: Mô tả data
2. Từ đó, design được cái gì? 
	1. **Architectual Design:** [[Tổng quan về thiết kế hệ thống|Thiết kế hệ thống]]
	2. **Interface Design:** *API Contracts, Data Format, Error Handling, ...* - Là cách hệ thống nói chuyện với nhau NTN
	3. **Component Design:** Class Diagram, thuật toán, logic cho mỗi module...
	4. **Database Design:** *Dùng lược đồ quan hệ ERD, ERM đã sài trong môn Database*
3. Đầu ra:
	1. Kiến trúc hệ thống *(Đầu ra của [[Tổng quan về thiết kế hệ thống|Thiết kế hệ thống]])*
	2. Đặc tả Database *(Mô tả database + ERD)*
	3. Đặc tả Interface
	4. Đặc tả Component


# Thiết kế theo hướng đối tượng
Hệ thống có nhiều đối tượng, cách xử lý và dữ liệu được đóng gói trong đối tượng
Thiết kế hệ thống chính là qúa trình **định nghĩa các lớp và tương tác giữa chúng**

... Môn OOP đã có ... 

SOLID