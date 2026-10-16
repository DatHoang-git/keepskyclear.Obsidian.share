---
created: 2026-04-16
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
[[Buổi 4 - Tiến trình và mô hình tiến trình phần mềm 2026-03-17 16.39.48.excalidraw]]
[[Buổi 5 - Một số tiến trình phần mềm 2026-03-24 16.55.13.excalidraw]]
![[Các mô hình phát triển phần mềm CƠ BẢN 2026-06-12 09.20.51.excalidraw|10000]]

# Tiến trình và Mô hình phát triển phần mềm
![[3_Assets/Buổi 4 - Tiến trình và mô hình tiến trình phần mềm 2026-03-17 16.39.48.excalidraw.md#^frame=O0rVXlSg|1000]]
- <mark style="background: #FFF3A3A6;">Tiến trình</mark> đơn giản là **các hoạt động** để tạo ra phần mềm 
- <mark style="background: #FFF3A3A6;">Mô hình tiến trình aka Mô hình PTPM</mark> là sự trừu tượng hóa, khuôn mẫu mô tả CÁCH các tiến trình được thực hiện ntn (chúng nó xâu chuỗi, kết nối với nhau ntn, làm gì trước / sau. Quy định cách thức tổ chức, sắp xếp, lặp lại các hd) 

![[3_Assets/Buổi 4 - Tiến trình và mô hình tiến trình phần mềm 2026-03-17 16.39.48.excalidraw.md#^frame=2YeWiQ5g|1000]]


# Các mô hình phát triển PM cơ bản
### 1. Waterfall
![[3_Assets/Buổi 4 - Tiến trình và mô hình tiến trình phần mềm 2026-03-17 16.39.48.excalidraw.md#^frame=I98shdCt|1000]]
Diễn ra như trong hình:
***Định nghĩa yc --> Thiết kế --> Triển khai và kiểm thử (trên module -> trên production) --> Vận hành và bảo trì***

Tính chất cốt lõi:
- Cho được sự kỉ luật thông qua **luồng tuần tự**
- Giả định **yêu cầu hệ thống ổn định** và có thể hiểu rõ từ ban đầu

Ưu:
- Dễ hiểu, dễ quản lý tiến độ cho dự án nhỏ *(nhỏ thì xđ được yêu cầu chi tiết, ổn định)*
Nhược:
- Chậm, thích ứng thay đổi kém. *(Nó mà bug ở gd thì phải làm lại hết, mất đống tiền)*
- KH chỉ thấy SP khi dự án kết thúc *(Sinh ra kiểu KH không biết mình muốn gì, thấy SP rồi thì lại đổi ý)*
### 2. Prototyping
![[3_Assets/Buổi 4 - Tiến trình và mô hình tiến trình phần mềm 2026-03-17 16.39.48.excalidraw.md#^frame=Yq9XFwYQ|1000]]
*Đây là một cách tiếp cận của Evolutionary Model*

Tính chất cốt lõi:
- Làm bản mẫu **thăm dò** yêu cầu KH
- **Làm mịn, làm rõ ràng yc** ngay từ ban đầu. Từ đó triển khai tránh đc sự thay đổi tốn kém

Ưu:
- Trị được IKIWISI
- KH được dùng bản release sớm, tiền đổ về sớm
Nhược:
- **Tha hóa kiến trúc**: Một mớ chắp vá nếu không định hướng kiến trúc rõ ràng từ ban đầu
- **Tài liệu thiếu trực quan** *(do thay đổi quá nhanh, tài liệu không bắt kịp tốc độ xây rồi đập, sửa rồi phá của model này)*
- Cần **kỹ năng đặc tả riêng**, kỹ năng đặc thù *(đặc tả trực quan / đặc tả tạo mẫu nhanh)*: Một dạng "nháp" nhanh ra một thứ có thể hd đc, và khả năng nắm bắt và mô phỏng ý tưởng mơ hồ *(ở cái chỗ "initial thoughts" kia)*

### 3. Spiral - Xoắn ốc
![[3_Assets/Buổi 4 - Tiến trình và mô hình tiến trình phần mềm 2026-03-17 16.39.48.excalidraw.md#^frame=ImgV7TKh|1000]]
Là con của [[Các mô hình phát triển phần mềm CƠ BẢN#1. Waterfall|Waterfall]] và [[Các mô hình phát triển phần mềm CƠ BẢN#2. Prototyping|Evolution]]
Kế thừa:
- Tính tuần tự của Waterfall
- Tính linh hoạt của Evolution
--> Mục tiêu chính: Phân tích và giải quyết rủi ro, thấy cấn ở đâu đánh ở đó

Các hd chính của mỗi vòng lặp:
1. Xác định mục tiêu / ràng buộc cho vòng hiện tại
2. Đánh giá các phương án, xác định rủi ro và giải quyết rủi ro
3. Phát triển và kiểm định dựa trên kiến thức từ risk analysis từ bước trên
4. Đánh giá, quyết định kế hoạch tiếp theo *(Mục này có thể có đánh giá của KH luôn, quyết định Go / No-go cho cả dự án)*

Ưu:
- Phù hợp dự án lớn
- Thay vì đẩy rủi ro về cuối dự án, giờ đây được chia nhỏ ở các vòng lặp
Nhược:
- Đòi hỏi chuyên môn để phân tích rủi ro
- Chi phí, thời gian quản lý lớn - Mỗi rep tốn rất nhiều effort, cồng kềnh -> Dự án nhỏ k phù hợp

***Tại sao lại là phân tích rủi ro? Các rủi ro là gì?***
- Rủi ro kỹ thuật - Chờ đến khi ra sp hoàn chỉnh ra đống lỗi, đi tong r phải làm lại ==> Giải quyết bằng prototyping
- Rủi ro yêu cầu - KH yc rất chung chung, mơ hồ ==> Cũng dùng prototype để thăm dò yc khách hàng
### 4. CBSE - Component-Based Software Engineering
![[3_Assets/Buổi 4 - Tiến trình và mô hình tiến trình phần mềm 2026-03-17 16.39.48.excalidraw.md#^frame=GgCANRjZ|1000]]
Tính chất cốt lõi:  PM xây từ các thành phần có sẵn

Ưu:
- Time-to-market ngắn
- Tiết kiệm

Nhược:
- Thời gian tìm kiếm và đánh giá module lâu
- Hidden cost: bảo trì, bản quyền, gọt dũa sao cho nó khớp với dự án của mình
- Rủi ro do k sở hữu module
- Gọt dũa yêu cầu theo các moudle

### 5. UP - Unified Process *(aka RUP - Rational UP do IBM đặt)*
![[3_Assets/Buổi 5 - Một số tiến trình phần mềm 2026-03-24 16.55.13.excalidraw.md#^frame=2IZfvjvh|1000]]
Triết lý cốt lõi:
- **Use-case driven**: Mọi hoạt động đều lấy từ Use-case làm trung tâm dẫn dắt *(literally MỌI HOẠT ĐỘNG - lấy yêu cầu, thiết kế, code/test)*
- **Achitecture-centric**: Ưu tiên xây kiến trúc PM vững từ ban đầu
- **Iterative and incremental**: Lặp và tăng dần, chia thành nhiều vòng nhỏ - tăng dần theo thời gian cho đến khi hoàn thiện

4 pha trong vòng đời:
1. ***Khởi tạo (Inception)***: Định nghĩa scope, mục tiêu, quy mô, khả thi
2. ***Phác thảo (Elaboration)***: Đặt móng, phân tích usecase quan trọng nhất, rủi ro lớn nhất, lên kế hoạch *(dáng dấp của [[Các mô hình phát triển phần mềm CƠ BẢN#3. Spiral - Xoắn ốc|Spiral]])*
3. ***Xây dựng (Construction)***: Xây gạch, viết code, tích hợp, kiểm thử để hoàn thiện tính năng
4. ***Chuyển giao (Transition)***: Bàn giao nhà cho enduser, cài đặt, tài liệu hdan, sửa lỗi vặt

![[3_Assets/Buổi 5 - Một số tiến trình phần mềm 2026-03-24 16.55.13.excalidraw.md#^frame=eTBVKHhQ|1000]]
# Vậy tóm lại, nên dùng cái gì đây?
Gem:

Một nhà quản lý thông minh sẽ áp dụng nguyên lý **W5HH** (Tại sao, Cái gì, Khi nào, Ai, Ở đâu, Như thế nào, Bao nhiêu) để định hướng mọi mô hình.
Bảng So sánh Chiến lược các Mô hình

|Tên mô hình|Bối cảnh sử dụng lý tưởng|Thách thức lớn nhất (Theo Source Table 2.1)|
|---|---|---|
|**Waterfall**|Dự án nhỏ, yêu cầu cực kỳ ổn định.|Khó thích ứng thay đổi; Kiểm thử quá muộn; Khách hàng phê duyệt quá trễ.|
|**Prototyping**|Yêu cầu mờ hồ, cần phản hồi giao diện.|Khách hàng đòi "ship" bản mẫu; Mất công sức cho bản mẫu bỏ đi; Khó quản lý.|
|**Spiral**|Hệ thống lớn, rủi ro kỹ thuật cao.|Thất bại trong phân tích rủi ro sẽ hủy hoại dự án; Khó quản lý; Cần chuyên gia giỏi.|
|**Unified Process**|Dự án phức tạp, cần kiến trúc bền vững.|Use cases không phải lúc nào cũng chính xác; Tích hợp tăng trưởng khó; Chồng chéo các pha.|
**Thông điệp cuối cùng:** Không có mô hình hoàn hảo, chỉ có mô hình phù hợp. Việc tạo ra phần mềm là một quá trình học tập xã hội. Sự giao thoa giữa tính sáng tạo của con người và kỷ luật của quy trình chính là chìa khóa để tạo ra những sản phẩm thực sự thay đổi thế giới.

# Appendix

| Waterfall                      | ![[Pasted Image 20260317175221_116.png]]                                                            |
| ------------------------------ | --------------------------------------------------------------------------------------------------- |
| Protyping (Evolutionary Model) | ![[Pasted Image 20260317180819_417.png]]                                                            |
| Spiral                         | ![[Pasted Image 20260416211044_968.png]]                                                            |
|                                | ![[Pasted Image 20260324113658_584.png]]                                                            |
| UP (or RUP)                    | ![[Pasted Image 20260324170930_954.png]]                                                            |
|                                | ![[3_Assets/Buổi 5 - Một số tiến trình phần mềm 2026-03-24 16.55.13.excalidraw.md#^frame=eTBVKHhQ]] |
