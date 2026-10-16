---
tags:
  - class
  - Kì_II
Giảng viên:
  - "[[Trần Hoàng Việt]]"
Mã LHP: INT2208
Điểm:
Số tín:
people:
---
---
```dataview
TABLE 
    created,
    category, 
    project, 
    tags
FROM "1_Notes"
WHERE contains(subject, this.file.link)
SORT tags ASC, created ASC, project ASC
```

# CNPM Canvas
![[Class. Công nghệ phần mềm - INT2208.canvas]]
### Tài liệu 
*Slide này thực sự tạp nham :) Làm cái slide các phần ko liên kết với nhau chút nào đọc rất khó hiểu, rcm tìm slide khác mà học*
[[00_tongQuan.pptx]]
[[01_SE intro1.pptx]]
[[02_SE intro2.pptx]]
[[03-process models.pptx]]
[[04- processes RUP - Agile.pptx]]
[[05_KhaiNiemYeuCau.pptx]]
[[06_QuyTrinhThuThapYC.pptx]]
[[07_MoHinhHoaPhanMem.pptx]]

---gk
[[08-Thiet ke kien truc.pptx]]
[[09-Thiet ke chi tiet.pptx]]
[[10-UI-Design.pptx]]
[[11_Cai dat ma nguon.pptx]]
[[12_Tong quan Testing.pptx]]
[[13_Mot so ky thuat kiem thu.pptx]]
[[14. Vận hành và bảo trì PM.pptx]]
[[INT2208_CongNghePhanMem_revised_2026_V3.docx]]

### Ôn thi
Tài liệu a NNKN: 
[[screenshot_9-4-2026_103040_portal.uet.vnu.edu.vn.jpeg]]

Đề 1:
![[Pasted image 20260601150336.png|411]]

Đề 2: 
![[Pasted image 20260601150424.png|398]]
![[Pasted image 20260612220124.png|475]]

Đề 3:
![[Pasted image 20260612220253.png|499]]
![[Pasted image 20260612220301.png|497]]

Đề 4:
![[Pasted image 20260612221258.png|385]]
![[Pasted image 20260612221308.png|398]]

Đề 5: 
![[Pasted image 20260612221659.png]]

[[Giải đề CNPM by AI]]

![[Class. Công nghệ phần mềm - INT2208.canvas]]

### Syllabus (made by me)
- Bài 1: [[Các khái niệm cơ bản trong công nghệ phần mềm]] (phần 1), gồm:
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Khái niệm về sản phẩm phần mềm|Khái niệm về sản phẩm phần mềm]]
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Đặc trưng của phần mềm *(thường hay so với phần cứng)*|Các đặc trưng của phần mềm]]
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Phân loại phần mềm|Phương pháp phân loại phần mềm]]
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Thế nào là một phần mềm tốt?|Các tiêu chí của một sản phẩm phần mềm tốt]]
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Thách thức của SE|Tiến hóa phần mềm và thách thức]]
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Các hoạt động chính trong phát triển PM|Các hoat động chính trong quá trình phát triển phần mềm]]
- Bài 2: Các khái niệm cơ bản trong công nghệ phần mềm (phần 2), gồm:
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Kỹ nghệ phần mềm - SE - Software Engineering|Kỹ nghệ phần mềm (SE)]]
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Các yếu tố cơ bản|Các yếu tố cơ bản của kỹ nghệ phần mềm]]
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Thách thức của SE|Các thách thức trong phát triển phần mềm]]
    - Chi phí cho phát triển phần mềm
    - [[Các khái niệm cơ bản trong công nghệ phần mềm#Đạo đức trong CNPM|Đạo đức nghề nghiệp trong phát triển phần mềm]] (Opensource, MIT, Apache…)
- Bài 3: [[Các mô hình phát triển phần mềm CƠ BẢN]]
    - Mô hình phát triển phần mềm
    - Mô hình [[Các mô hình phát triển phần mềm CƠ BẢN#1. Waterfall|thác nước]]
    - Mô hình chữ V (?)
    - Mô hình [[Các mô hình phát triển phần mềm CƠ BẢN#2. Prototyping|bản mẫu]]
    - Mô hình [[Các mô hình phát triển phần mềm CƠ BẢN#3. Spiral - Xoắn ốc|xoắn ốc]]
    - Mô hình [[Các mô hình phát triển phần mềm CƠ BẢN#4. CBSD - Component-Based Software Engineering|CBSD]], [[Các mô hình phát triển phần mềm CƠ BẢN#5. UP - Unified Process *(aka RUP - Rational UP do IBM đặt)*|RUP]], …
- Bài 4: [[Các mô hình phát triển phần mềm LINH HOẠT]] (3 tiết)
    - Triết lý [[Các mô hình phát triển phần mềm LINH HOẠT#Agile method|Agile]]
    - Mô hình [[Các mô hình phát triển phần mềm LINH HOẠT#Scrum|Scrum]], các vai trò, sự kiện, ước lượng, v.v.
    - Kiểm soát thay đổi của phần mềm
    - Lựa chọn mô hình phát triển phần mềm
- Bài 5: [[Tổng quan về phân tích và đặc tả yêu cầu]] (P1)
    - [[Tổng quan về phân tích và đặc tả yêu cầu#Các khái niệm cơ bản về yêu cầu phần mềm|Khái niệm về yêu cầu phần mềm]]
    - [[Tổng quan về phân tích và đặc tả yêu cầu#Kỹ nghệ yêu cầu *(requirements engineering)*|Khái niệm về kỹ nghệ yêu cầu phần mềm]]
    - [[Tổng quan về phân tích và đặc tả yêu cầu#Có những dạng yêu cầu nào?| Phân loại yêu cầu]]
    - [[Tổng quan về phân tích và đặc tả yêu cầu#Quy trình kỹ nghệ yêu cầu|Quy trình kỹ nghệ yêu cầu]]
        - Một số phương pháp thu thập yêu cầu
        - Phân tích yêu cầu
        - Đặc tả yêu cầu
        - Thẩm định yêu cầu
        - Quản lý yêu cầu
- Bài 6: [[Tổng quan về phân tích và đặc tả yêu cầu]] (P2)
    - [[Tổng quan về phân tích và đặc tả yêu cầu#Đặc tả yêu cầu|Tổng quan về đặc tả yêu cầu phần mềm]]
    - [[Tổng quan về thiết kế hệ thống#Mô hình hóa hệ thống|Mô hình hoá hệ thống]]
    - [[Tổng quan về thiết kế hệ thống#Làm sao để mô hình hóa?|Ngôn ngữ mô hình hóa thống nhất (UML)]]
        - Giới thiệu về UML
        - Các góc nhìn hệ thống
        - Một số loại mô hình hệ thống
- Bài 7: [[Tổng quan về thiết kế hệ thống]] *(bài này y hệt bài 8, link này dẫn tới bài 6)*
	- Khái niệm về kiến trúc phần mềm
    - Khái niệm về thiết kế phần mềm
    - Nguyên lý thiết kế phần mềm
    - Quy trình thiết kế  phần mềm
    - Thẩm định thiết kế
    - Một số phương pháp và chiến lược thiết kế
    - Một số vấn đề của thiết kế phần mềm



- Bài 8: [[(Thiết kế) Kiến trúc phần mềm]]
    - [[(Thiết kế) Kiến trúc phần mềm#Khái niệm|Khái niệm kiến trúc phần mềm]]
    - [[(Thiết kế) Kiến trúc phần mềm#Thiết kế kiến trúc PM|Thiết kế kiến trúc PM]]
	    - [[(Thiết kế) Kiến trúc phần mềm#Nguyên lý thiết kế kiến trúc|Nguyên lý thiết kế kiến trúc]]
	    - Một số tiêu chuẩn và cách đạt được chúng
    - [[(Thiết kế) Kiến trúc phần mềm#Một số kiến trúc phổ biến|Một số loại kiến trúc phổ biến]]
        - Kiến trúc máy khách - máy chủ
        - Kiến trúc hướng dịch vụ
        - Kiến trúc vi dịch vụ
        - Kiến trúc phân lớp
        - Kiến trúc đường ống - bộ lọc
- Bài 9: [[Thiết kế chi tiết]]
    - Thiết kế chi tiết
    - Khái niệm về thiết kế chi tiết
    - Thiết kế dữ liệu
    - Thiết kế xử lý
- [ ] Bài 10: [[Thiết kế giao diện và trải nghiệm người dùng]]
    - Tầm quan trọng của giao diện
    - Đầu vào và đầu ra của thiết kế giao diện
    - Yếu tố con người khi thiết kế giao diện
    - Quy trình thiết kế giao diện
    - Một số nguyên tắc trong thiết kế giao diện
- [ ] Bài 11: [[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm]]
    - [[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm#Cài đặt PM|Khái niệm về cài đặt (implementation)]]
    - [[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm#Chất lượng mã nguồn|Chất lượng mã nguồn]]
    - [[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm#Tiêu chuẩn lập trình *(Coding Standard / Conventions)* - "Chính tả"|Tiêu chuẩn lập trình]]
    - [[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm#Các kinh nghiệm lập trình *(best practices)*|Một số kinh nghiệm lập trình tốt]]
    - [[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm#Tái sử dụng mã nguồn|Tái sử dụng mã nguồn]]
    - [[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm#Gỡ lỗi|Gỡ lỗi]]
    - [[Đảm bảo chất lượng mã nguồn - Cài đặt phần mềm#Môi trường làm việc của dự án|Môi trường làm việc của dự án]]
    - Quản lý mã nguồn
    - Tái cấu trúc mã nguồn *(Chính là Refractoring)*
    - Phần mềm mã nguồn mở
- [ ] Bài 12: [[Tổng quan Kiểm thử và đảm bảo chất lượng phần mềm]]
    - Giới thiệu
    - Đảm bảo chất lượng phần mềm
    - Quy trình kiểm thử
    - Các mức kiểm thử
    - Phân loại kiểm thử
    - Tài liệu kiểm thử
- [ ] Bài 13: [[Một số phương pháp kiểm thử]]
    - Bức tranh tổng thể về kiểm thử phần mềm
    - Phương pháp phân tích giá trị biên
    - Phương pháp phân lớp tương đương
    - Phương pháp bảng quyết định
- [ ] Bài 14: [[Bàn giao, vận hành và bảo trì phần mềm]]
    - Khái niệm về bàn giao phần mềm
    - Một số lưu ý khi bàn giao phần mềm
    - Khái niệm về vận hành phần mềm
    - Quy trình vận hành phần mềm
    - Các nhóm công việc trong vận hành phần mềm
    - Một số công việc thường gặp trong vận hành phần mềm
    - Khái niệm về bảo trì phần mềm
    - Quy trình bảo trì phần mềm
    - Một số thách thức trong bảo trì phần mềm
- Bài 15: Phát triển phần mềm trong ngữ cảnh sử dụng AI
    - Một số chủ đề nâng cao trong CNPM có sử dụng AI
    - Gợi mở các nội dung, chủ để khác trong CNPM như Open-source, v.v