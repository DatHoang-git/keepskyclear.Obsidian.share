---
created: 2026-04-21
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Công nghệ phần mềm - INT2208]]"
project:
  - "[[Ôn thi giữa kì II năm 2026]]"
---
---
/src:
[[Week 6 - Thu thập và phân tích yêu cầu 2026-03-31 16.53.12.excalidraw]]

![[Tổng quan về phân tích và đặc tả yêu cầu 2026-06-13 07.07.34.excalidraw|1000]]

> *Bài này sẽ cung cấp cho ta những góc nhìn sâu hơn về **yêu cầu** , một phần lớn trong CNPM cũng như trong dự án PM nói chung. Việc xác định rõ các yêu cầu không chỉ là bước quan trọng để tạo tác nên phần mềm, mà còn là yếu tố quan trọng để thương lượng, thỏa hiệp, tư vấn cho KH - một nghiệp vụ rất cần thiết để đi được đến kq cuối cùng. Vậy:*
> *- Có những loại yêu cầu nào?*
> *- Thế nào là yêu cầu tốt? Khi nào nên hài lòng với yc của khách hàng? Khi nào cần vặn?*
> *- Mình viết các yêu cầu đó ở đâu? Làm tài liệu ntn?*
> *- Nên biểu diễn các yêu cầu đó dưới dạng gì cho dễ đọc, dễ hiểu? (Nhất là với các dự án lớn, rất rất nhiều yc đan xen, có quan hệ với nhau)*

# Các khái niệm cơ bản về yêu cầu phần mềm
![[3_Assets/Week 6 - Thu thập và phân tích yêu cầu 2026-03-31 16.53.12.excalidraw.md#^frame=1NFA8naW|1000]]

***Tại sao phải làm rõ, thu thập và phân tích yêu cầu KH?***. Mục đích:
1. Cơ sở cho đề xuất (tư vấn) / đấu thầu hợp đồng *(mọi thứ phải rõ ràng, không mình sẽ là ng chịu thiệt)*
2. Cơ sở lập hợp đồng *(đặc tả chi tiết)*

### Có những dạng yêu cầu nào?
![[3_Assets/Week 6 - Thu thập và phân tích yêu cầu 2026-03-31 16.53.12.excalidraw.md#^frame=ZW4u9fqt|1000]]

Dựa trên các khía cạnh của yêu cầu:
1. Theo **Đối tượng** sử dụng *(hay có thể nói là Mức độ trình bày, High-level / Low level)*
	1. YC người dùng: Ngôn ngữ tự nhiên / Cho KH *(What)*
	2. YC hệ thống: Chi tiết / Xác định cài những gì *(How)*
2. Theo hướng **Bản chất** của yêu cầu
	1. YC chức năng: Cung cấp những features, chức năng gì? 
	2. YC phi chức năng
	3. YC miền: Các ràng buộc miền của nghiệp vụ đó

> *Có thể thấy các loại yc ở đây có một sự overlap với nhau rất rõ ràng. 
> Takeaway: Bất kỳ một yêu cầu "ruột" nào (chức năng, phi chức năng) cũng cần được đóng gọi dưới một cái "vỏ" nào đó (yc mức người dùng, hệ thống)*

>*Vậy khi nào thì dùng yêu cầu nào?*  
>*Mình dùng cả 5, giống như một cái phễu 2 tầng*
>*- Tầng 1: Bắt đầu dự án, gặp gỡ KH. Ta viết **YC người dùng**, KH cũng k biết về tech hay j cả*
>*- Tầng 2: Mang yc đó về, các BA phải "dịch" yc trên thành **YC hệ thống***
>*Lúc viết tài liệu, cần phân chia rõ mục nào là **Chức năng**, **Phi chức năng**, các ràng buộc **Miền**, đây là **Tài liệu đặc tả yêu cầu (SRS)***

### Các tính chất của yêu cầu *(Thế nào là một yc tốt?)*
![[3_Assets/Week 6 - Thu thập và phân tích yêu cầu 2026-03-31 16.53.12.excalidraw.md#^frame=acV5hvmF|1000]]
1. Tính chính xác: Rõ ràng, 0 mơ hồ
2. Tính đầy đủ / nhất quán
3. Tính đo được, kiểm chứng đc
4. Có thể theo vết

# Tài liệu yêu cầu

![[3_Assets/Week 6 - Thu thập và phân tích yêu cầu 2026-03-31 16.53.12.excalidraw.md#^frame=oEyhZ8Yx|1000]]
# Đặc tả yêu cầu
![[3_Assets/Week 6 - Thu thập và phân tích yêu cầu 2026-03-31 16.53.12.excalidraw.md#^frame=3F8JDHCT|1000]]
Đây chính là quá trình đặt bút viết những yêu cầu hệ thống vào tài liệu (tài liệu hóa).

### Có những kiểu đặc tả nào? 
1. Ngôn ngữ tự nhiên:
	- Viết thành các câu văn, đoạn văn
	- KH/người dùng rất dễ hiểu, nhưng dễ mơ hồ, đa nghĩa, dài dòng
	- *Dùng cho **Yêu cầu người dùng** (mức cao)*
2. Đặc tả ngôn ngữ có cấu trúc
	- Vẫn dùng NNTN nhưng có form/template
	- Khắc phục được tính lan man, đảm bảo tính đầy đủ *(Vẫn dùng cho YC người dùng)*
3. Bảng biểu / bảng qdinh:
	- Phù hợp với những chức năng tính logic phức tạp. if / else
4. Ngôn ngữ mô tả thiết kế:
	- Gắn liền với mã giả. Dùng cho những tính năng bắt buộc theo công thức của domain
5. Ký pháp đồ họa / Mô hình trực quan
	- Là các flowchart, UML
	- Để mô tả luồng nghiệp vụ, bổ trợ cho nn tự nhiên, tránh sự rườm rà đọc cả đoạn văn
6. Đặc tả hình thức (*Văn phạm ngôn ngữ bên TRR*)
	- Ko dùng cho các PM bình thường, vì cực cực đắt đỏ, tốn thời gian, rất hàn lâm, hệ thống trọng yếu
	- hệ thống an toàn sinh mạng, lò pư hạt nhân, pm máy bay boeing, ... 


/src:
[[Week 7 - Thu thập và phân tích yêu cầu (P2) 2026-04-07 16.55.55.excalidraw]]

### Kỹ nghệ yêu cầu *(requirements engineering)*
Là một "kĩ thuật/kĩ năng" để xác định các dịch vụ hệ thống mà KH yêu cầu cũng như các ràng buộc để phát triển và vận hành PM
# Quy trình kỹ nghệ yêu cầu
![[3_Assets/Week 7 - Thu thập và phân tích yêu cầu (P2) 2026-04-07 16.55.55.excalidraw.md#^frame=SgGwYRgu|1000]]
![[Pasted image 20260612213819.png]]

### Thu thập và phân tích yêu cầu - Khám phá yêu cầu
>*(thường được gộp chung với khâu Khám phá yêu cầu)*
![[3_Assets/Week 7 - Thu thập và phân tích yêu cầu (P2) 2026-04-07 16.55.55.excalidraw.md#^frame=cWhh3XYz|1000]]

Trong thu thập và ptich, có những quy trình sau:
1. Khám phá yêu cầu *(Đây là bước THU THẬP)*
2. Phân loại và tổ chức yêu cầu *(Từ bước này trở đi là PHÂN TÍCH)*
	Từ đống yc thu thập trên, [[Tổng quan về phân tích và đặc tả yêu cầu#Có những dạng yêu cầu nào?|phân loại YC]] nào là yc chức năng, phi chức năng...
	Mô hình hóa yc, sử dụng UML, sơ đồ hoạt động, sơ đồ use case
3. Thương lượng và gán độ ưu tiên
	Trong quá trình đó, các phòng ban đưa ra yc đá nhau, ta phải làm việc với các bên để đàm phán và đánh giá
4. [[Tổng quan về phân tích và đặc tả yêu cầu#Đặc tả yêu cầu|Đặc tả yêu cầu]]
	Là bước cuối - viết tài liệu
#### Thu thập yêu cầu
![[3_Assets/Week 7 - Thu thập và phân tích yêu cầu (P2) 2026-04-07 16.55.55.excalidraw.md#^frame=biO6Uc6Q|600]]
Mục tiêu của bước này không chỉ là "nghe KH nói", mà là **khai quật** những nhu cầu thực sự của họ
>*Vậy làm sao để có thể khai quật được? Có những bước sau:*
1. **Kỹ thuật phỏng vấn**: PV đóng (câu hỏi cbi sẵn) / mở (thảo luận tự do)
2. **Kỹ thuật dùng kịch bản**: Đưa ra các câu chuyện / kịch bản thực tế
	**Kỹ thuật ca sử dụng**: Dựa vào kịch bản, mô tả chức năng của hệ thống từ góc nhìn của các vai trò khác nhau
		![[3_Assets/Week 7 - Thu thập và phân tích yêu cầu (P2) 2026-04-07 16.55.55.excalidraw.md#^frame=m592fglU|100%]]
3. **Kỹ thuật nghiên cứu nhân học** *(field trip)*: Quan sát thực tế

### Thẩm định yêu cầu
Đảm bảo các yêu cầu xác định đúng nhu cầu của KH mà hệ thống cần đáp ứng. Đây là khâu rất quan trọng
##### Nội dung kiểm tra
![[3_Assets/Week 7 - Thu thập và phân tích yêu cầu (P2) 2026-04-07 16.55.55.excalidraw.md#^frame=9FMUOUfm|800]]
##### Thẩm định bằng cách nào?
1. Thẩm định yêu cầu *(checklist như trên)*
2. Làm bản mẫu: SD cái đó để test
3. Sinh testcase: Kiểm tra tính kiểm thử được

> *Kiểm định khác gì với thẩm định?* 
> **Kiểm định** (Verification): Làm có ĐÚNG CÁCH ko? 
> - Kiểm tra tài liệu đặc tả, thiết kế, mã nguồn, kiến trúc hệ thống...
> - DIễn ra sớm, đan xen, liên tục trong các khâu ptrien
> 
> **Thẩm định** (Validation): Có làm ĐÚNG SẢN PHẨM ko?  
> - Kiểm thử PM, chạy thử PM, kiểm thử hộp đen
> - Diễn ra cuối quy trình
##### Kiểm định yêu cầu
- Diễn ra trong quá trình [[Tổng quan về phân tích và đặc tả yêu cầu#Đặc tả yêu cầu|đặc tả]] luôn
- Các bên liên quan cùng tham gia
##### Nội dung kiểm định yêu cầu
1. Tính kiểm chứng được
2. Tính hiểu được 
3. Tính lần vết được
4. Tính thích ứng được: YC có thể thay đổi được mà ko ảnh hưởng đến yc khác

### Quản lý yêu cầu
>*Các yêu cầu không đứng yên, nó kiểu gì cũng phát sinh ra các thay đổi trong quá trình phát triển, vậy làm sao có thể quản lý được các thay đổi đó?* 

2 công việc cốt lõi:
1. Lập kế hoạch quản lý yêu cầu:
	- Định danh yêu cầu: Mỗi yc có một mã ID duy nhất
	- **Chính sách lần vết** (Traceability): Thiết lập các mối liên kết, lần ra và tham chiếu được  
	- SD công cụ hỗ trợ quản lý
2. Quy trình quản lý thay đổi:
	1. Phân tích vấn đề và đặc tả thay đổi: Tại sao lại thay đổi, muốn thay cái gì? 
	2. Phân tích tầm ảnh hưởng và chi phí
	3. Cài đặt sự thay đổi
