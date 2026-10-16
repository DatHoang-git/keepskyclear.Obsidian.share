---
created: 2026-09-21
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Hệ quản trị cơ sở dữ liệu - INT3202 1|DBMS]]"
---
---
![[L2B1_Stored_Procedures_Functions.pdf#page=1&rect=50,231,882,344|L2B1_Stored_Procedures_Functions, p.1]]
*"Thủ tục lưu trữ"* **Stored ROUTINE**
Thủ tục (Routine - Thói quen...) nghĩa là cái hoạt động xảy ra thường xuyên
Để tránh việc gọi đi gọi lại tốn thời gian / tài nguyên

Ứng dụng gọi và 


# Giới thiệu
### Stored routine
- CHứa trong DBMS catalog *(Định nghĩa thủ tục)*
- Thân của nó cũng là lệnh SQL
- Nó chỉ lưu các tham số --> Chạy lại với một bộ tham số có sẵn
> [!PDF|] [[L2B1_Stored_Procedures_Functions.pdf#page=4&selection=23,0,31,47|L2B1_Stored_Procedures_Functions, p.4]]
> > The routine is invoked by name. A procedure is invoked with CALL. A function is invoked as an expression and returns a value
> 

***Tại sao phải làm thế?***
- Tránh việc lặp lại
- Tối ưu hiệu suất và tài nguyên

### Các objects trong Databases
![[L2B1_Stored_Procedures_Functions.pdf#page=6&rect=35,82,923,455|L2B1_Stored_Procedures_Functions, p.6]]

>[!note] Một số điều nhìn nhận đc
>- Dường như từ trên cao đổ xuống ở trong cái bảng là đi từ mức abstraction cao -> thấp
>  *View* (Abstract, có cả relations) --> *Procedure* (Đã đc thiết kế và lưu sẵn để thực hiện một routine) --> *Function* (Sài như bth, với sql bth) --> *Trigger* (Thực hiện phản ứng sau khi có sự kiện thay đổi data)

![[L2B1_Stored_Procedures_Functions.pdf#page=7&rect=37,86,927,518|L2B1_Stored_Procedures_Functions, p.7]]
Hình dung: 
- Procedure truyền vào param. Một procedure xây dựng quanh *một chuỗi thao tác/workflow*. Nó có thể gọi nhiều function, chạy nhiều câu SQL, cập nhật nhiều bảng...
- Function cũng truyền vào param, nhưng nó ở đơn vị nhỏ hơn, cũng trả ra giá trị *(MỘT giá trị)*

# Syntax
![[L2B1_Stored_Procedures_Functions.pdf#page=14&rect=25,45,945,527|L2B1_Stored_Procedures_Functions, p.14]]

# BTVN
![[L2B1_Stored_Procedures_Functions.pdf#page=39&rect=27,165,859,523|L2B1_Stored_Procedures_Functions, p.39]]![[L2B1_Stored_Procedures_Functions.pdf#page=48&rect=24,97,892,471|L2B1_Stored_Procedures_Functions, p.48]]
Extended
![[Pasted image 20260921120014.png]]

Mở rộng 
![[L2B1_Stored_Procedures_Functions.pdf#page=50&rect=33,124,925,523|L2B1_Stored_Procedures_Functions, p.50]]