---
created: 2026-03-10
tags:
  - summarized
category: "[[Class]]"
subject:
  - "[[Class. Công nghệ phần mềm - INT2208]]"
project:
  - "[[Ôn thi giữa kì II năm 2026]]"
---
---
\src:
[[Buổi 2 2026-03-10 16.28.00.excalidraw]]
![[Mindmap_Các khái niệm cơ bản trong công nghệ phần mềm.excalidraw|1000]]
# Giới thiệu chung về PM
### Khái niệm về sản phẩm phần mềm 
Sản phẩm phần mềm bao gồm 3 phần chính:
- Chương trình máy tính *(scr code / object code - mã máy)*
- Cấu trúc dữ liệu *(cấu trúc để hệ thống tương tác với thông tin - ở bộ nhớ trong / ngoài)*
- Tài liệu:
	- Kỹ thuật *(cho admin, kỹ sư: phát triển và bảo trì)*
	- Đào tạo *(cho end-user, hdsd)*

### Đặc trưng của phần mềm *(thường hay so với phần cứng)*
1. ***Không mòn cũ nhưng thoái hóa***: 
   Không bị tác động vật lý, thoái hóa khi Thay đổi môi trường / Phát sinh lỗi / Thay đổi nhu cầu sd
2. ***Vô hình và phức tạp***: 
   Khó hiểu, không vật lý
3. ***Bản chất là thay đổi***: Luôn thay đổi do nghiệp vụ thay đổi / Sản sinh lỗi / Thay đổi môi trg
4. ***Phát triển theo nhóm***
5. **Không được lắp ráp từ mẫu có sẵn**: Vì tính đa dạng của nghiệp vụ, cần những pm riêng để phục vụ theo nhu cầu của nghiệp vụ đó

### Phân loại phần mềm
Theo các tiêu chí khác nhau, phân loại cũng khác nhau:
1. Theo chức năng *(function-oriented)*: 
	- Hệ thống: HĐH, tiện ích *(Windows, Linux)*
	- Nghiệp vụ: PM hỗ trợ doanh nghiệp
	- Công cụ: Hỗ trợ ptrien pm
2. Theo nguồn gốc *(user-oriented)*:
	- Đơn đặt hàng: Theo KH nhất định
	- Dùng chung: Thỏa mãn lượng lớn ng dùng
3. Theo lĩnh vực *(domain-oriented)*:
	- Realtime, học máy, embedded system (pm nhúng), web/mobile

### Thế nào là một phần mềm tốt?
Là PM đảm bảo được các tiêu chí *(ISO 9126)*
1. ***Functionality - Khả dụng (functional)***: Khả năng chính xác, làm việc an toàn với dữ liệu *("it just works") - làm được việc*
2. ***Reliability - Tin cậy***: Tránh KQ sai, khả năng phục hồi khi có sự cố
3. ***Usability - Dễ dùng***: Dễ hiểu, dễ học, dễ sử dụng / vận hành
4. ***Maintainability - Bảo trì***: Dễ phân tích lỗi, dễ thay đổi và ổn định khi chỉnh sửa
5. ***Efficiency - Hiệu quả***: Sử dụng tốt tài nguyên, thời gian đáp ứng nhanh
6. ***Portable - Khả chuyển***: Dễ chuyển giao, cài đặt, cs thể thay thế PM khác

### Các hoạt động chính trong phát triển PM
![[3_Assets/Buổi 2 2026-03-10 16.28.00.excalidraw.md#^clippedframe=02|700|quy trình PTPM]]
![[Pasted Image 20260310175340_642.png|401]]
1. **Giao tiếp (Communication):** Hiểu mục tiêu của khách hàng và thu thập yêu cầu.
2. **Lập kế hoạch (Planning):** Xác định các tác vụ kỹ thuật, rủi ro, nguồn lực và lịch trình.
3. **Mô hình hóa (Modeling):** Tạo ra các bản thiết kế (phác thảo) để hiểu rõ hơn về yêu cầu và giải pháp.
4. **Xây dựng (Construction):** Bao gồm viết mã nguồn (code) và kiểm thử (testing).
5. **Triển khai (Deployment):** Giao sản phẩm cho khách hàng, nhận phản hồi và đánh giá.

# Kỹ nghệ phần mềm - SE - Software Engineering
*Kỹ nghệ phần mềm là việc áp dụng một cách ==tiếp cận có hệ thống, có kỷ luật và định lượng== cho việc phát triển, vận hành và bảo trì phần mềm. Đây là sự áp dụng các nguyên tắc kỹ thuật vào lĩnh vực phần mềm để đảm bảo chất lượng và tiến độ.*

### Các yếu tố cơ bản
![[3_Assets/Buổi 2 2026-03-10 16.28.00.excalidraw.md#^frame=rMTjDD4r|1000]]
1. ***Quality focus - Trọng tâm chất lượng***: Là một cái "mindset" cần có - luôn thúc đẩy cải tiến quy trình
2. ***Process - Quy trình***: Khung làm việc - Quản lý dự án và đảm bảo chất lượng 
3. ***Methods - Phương pháp***: Kỹ thuật chuyên môn - Ptich yc / Thiết kế / Lập trình / Kiểm thử
4. ***Tools - Công cụ***: Hỗ trợ cho quy trình và phương pháp (2 cái trên)

### Các hoạt động bao quát trong SE (Umbrella Activities)
*.eg Hoạt động bao trùm, không đứng ở giai đoạn cụ thể nào*
1. Theo dõi và kiểm soát dự án (Project tracking & control)
2. Quản lý rủi ro (Risk management)
3. Đảm bảo chất lượng phần mềm (SQA - *Software Quality Assurance?*)
4. Đánh giá kỹ thuật (Technical reviews)
5. Quản lý cấu hình phần mềm (SCM - *Software Configuration management*)

***Tại sao gọi là cái ô (Umbrella) kì cục vậy?***
- Về mặt không gian - Độ bao phủ toàn bộ vòng đời, diễn ra song song 
- Về mặt ý nghĩa - "Che mưa che nắng" - Bảo vệ khoi các yc thay đổi liên tục, bug phát sinh, trễ tiến độ
### Thách thức của SE
1. Mất quá thời gian để hoàn thành
2. Chi phí phát triển quá cao
3. Không thể tìm thấy tất cả các lỗi trc khi bàn giao
4. Khó đo lường tiến độ

### Đạo đức trong CNPM

Theo ACM / IEEE:
Tham khảo slide thuyết trình ở: [[Đạo đức trong công nghệ phần mềm 2026-03-17 14.44.00.excalidraw]]
![[3_Assets/Đạo đức trong công nghệ phần mềm 2026-03-17 14.44.00.excalidraw.md#^area=1AHgXHMX|1000]]

George Polya đã đưa ra 4 bước cốt lõi: **Hiểu vấn đề -> Lập kế hoạch -> Thực hiện kế hoạch -> Kiểm tra kết quả.**

Theo David Hooker
1. PM phải **mang giá trị** cho người dùng
2. **KISS** *(Keep It Simple, Stupid!)*: Càng đơn giản càng tốt
3. Duy trì tính **toàn vẹn của kiến trúc** *(tránh sửa quá đà làm vỡ kiến trúc ban đầu)*
4. Sản phẩm **cho người khác** nên hãy làm cẩn thận để ngkhac đọc và dùng đc, keep that in mind
5. Mở cửa cho những **thay đổi tương lai** 
6. Tái sử dụng - Giảm chi phí và tăng giá trị
7. Nghĩ kĩ trc khi làm

