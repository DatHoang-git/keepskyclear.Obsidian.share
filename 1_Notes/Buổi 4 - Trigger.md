---
created: 2026-09-28
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Hệ quản trị cơ sở dữ liệu - INT3202 1|DBMS]]"
---
---
/src: 
[[L2B2_Triggers_Database_Automation.pdf]]

>[!important] Phản ứng như nào khi có các sự kiện thay đổi? (thêm / sửa / xóa)

Objectives:
1. Định nghĩa trigger
2. Đọc trigger
3. Thực hành trigger và các lưu ý nhỏ

### Motivation
Các trường hợp nào thì sài trigger? 
- *Ghi log* 
- Auditing
![[L2B2_Triggers_Database_Automation.pdf#page=13&rect=38,37,932,446|L2B2_Triggers_Database_Automation, p.13]]
![[L2B2_Triggers_Database_Automation.pdf#page=38&rect=27,147,918,520|L2B2_Triggers_Database_Automation, p.38]]


### Nó là gì? 
- Trigger ko gọi bằng CALL
- Nó là chuỗi các dòng lệnh sẽ kích hoạt khi ...
- Có thể đi thêm với điều kiện (`if ... triggers`)

### Nó họat động như thế nào? 
Trigger nằm ở đâu trong chuỗi execution trong DBMS?
![[L2B2_Triggers_Database_Automation.pdf#page=7&rect=44,278,933,412|L2B2_Triggers_Database_Automation, p.7]]

Giải phẫu của Trigger / Các yếu tố cần xét khi nói đến một trigger:
![[L2B2_Triggers_Database_Automation.pdf#page=8&rect=38,97,917,444|L2B2_Triggers_Database_Automation, p.8]]

Cũng cần lưu ý xem xét các giải pháp đơn giản hơn thay vì cứ sài trigger all the time:
- CHECK: Ngay khi thay đổi -> Trường CHECK đã kiểm tra luôn kiểu dl
- FOREIGN KEY: Check MQH cha-con

... quan trọng là check trước cái DBMS đó đã hỗ trợ những cái gì, chứ kp lúc nào cũng tạo mới trigger luôn

### Cú pháp
![[L2B2_Triggers_Database_Automation.pdf#page=16&rect=33,108,865,446|L2B2_Triggers_Database_Automation, p.16]]

##### Thứ tự và sắp xếp các trigger
![[L2B2_Triggers_Database_Automation.pdf#page=20&rect=27,56,444,254|L2B2_Triggers_Database_Automation, p.20|500]]
Sử dụng lệnh `FOLLOWS`


