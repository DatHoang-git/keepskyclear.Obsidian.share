---
created: 2026-09-28
tags:
  - lab
category:
  - "[[Class]]"
subject:
  - "[[Class. Hệ quản trị cơ sở dữ liệu - INT3202 1|DBMS]]"
---
---

>[!important] Bài nộp lab 4 - Triggers
>Họ và tên: Đỗ Hoàng Đạt
>MSSV: 24020060

>[!tip] ## Bài 1 (Lab A)
> **Tạo bảng audit**
> ![[Pasted image 20260928110652.png|289]]
> 
> **Tạo trigger**
> ![[Pasted image 20260928110723.png]]
> 
> **Test trigger**
> ![[Pasted image 20260928111053.png]]

>[!tip] ## Bài 2: 
> **Tạo trigger:**
> ![[Pasted image 20260928113304.png]]
> 
> 
> **Test trigger:**
> Thuê thì sẽ phải insert vào bảng rental, tạo trigger `rental_after_insert` chuyển trạng thái is_available = FALSE
> Trả lại thì đồng nghĩa với việc return_date được cập nhật, tạo trigger `rental_after_insert`
> 
> *Khi thuê*
> ![[Pasted image 20260928114308.png]]
> Khi rented, giá trị trả về FALSE (0)
> 
> *Khi trả lại*
> ![[Pasted image 20260928114613.png|333]]


