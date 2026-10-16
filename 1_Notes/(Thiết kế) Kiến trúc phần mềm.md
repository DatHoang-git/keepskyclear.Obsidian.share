---
created: 2026-04-21
tags:
category:
  - "[[Class]]"
subject:
  - "[[Class. Công nghệ phần mềm - INT2208]]"
---
---
\src:
Lecture notes: [[Buổi 8 - Thiết kế kiến trúc phần mềm 2026-04-21 17.17.42.excalidraw]]
Slide: [[08-Thiet ke kien truc.pptx]]

![[(Thiết kế) Kiến trúc phần mềm 2026-06-13 13.15.02.excalidraw|700]]
# Khái niệm

Có nhiều định nghĩa khác nhau về kiến trúc phần mềm:
- "là một **tập hợp các quyết định dựa nguyên tắc thiết kế** của hệ thống" *-Richard N. Taylor*
- "là **CÁC kiến trúc** mà làm nên hệ thống, bao gồm các **phần mềm**, **quan hệ giữa chúng** và thuộc tính của 2 đứa nó" *- Len Bass (Học cái này)* 
=> ***Cấu trúc (structure):** tập các phần tử (element) và cách tổ chức*

VD về một kiến trúc:
![[Pasted Image 20260421175004_283.png|417]]

##### Vai trò của KTPM
![[3_Assets/Buổi 8 - Thiết kế kiến trúc phần mềm 2026-04-21 17.17.42.excalidraw.md#^frame=Vai trò cuả KTPM|60%]]
- Hỗ trợ giao tiếp giữa các bên 
- Xác định các ràng bộc để thực hiện hóa
- Dự đoán chất lượng hệ thống -> Cung cấp các insights -> Đưa ra hành động trong lúc thực hiện dự án

# Thiết kế kiến trúc PM
Là một hoạt động:
- Input: Yêu cầu chức năng / phi chức năng
- Output: Bản thiết kế kiến trúc

### Quy trình thiết kế kiến trúc
![[Pasted image 20260601154936.png|268]]

##### 1. Xác định mục tiêu kiến trúc *(What? - Xây để làm gì)*
Cho ai, làm gì, ràng buộc gì?

##### 2. Các trường hợp / Bối cảnh sử dụng chính *(aka "Hoạt cảnh" trong slide)*
Một "Hoạt cảnh" (Scenarios) là tổng tổng quát hóa của nhiều [[Tổng quan về phân tích và đặc tả yêu cầu#Thu thập yêu cầu|usecase (ca sử dụng)]] tương tự

==Chú ý chỗ này: Scenario trong ngữ cảnh này thường được tạo với ý nghĩa là một "kịch bản thuộc tính chất lượng - đo lường khả năng của nó với yc phi chức năng"==

*VD:*
- *Usecase: User đăng nhập*
- *Scenario: 1 Triệu người đăng nhập cùng lúc, hệ thống không được sập quá 3s*

Để tạo scenario chuẩn, cần đảm bảo:
1. **Nguồn kích thích (Source):** Ai/Cái gì tạo ra sự kiện? (VD: Hacker, User, Hệ thống nội bộ).
2. **Kích thích (Stimulus):** Chuyện gì xảy ra? (VD: Tấn công DDOS, Lỗi ổ cứng, Gửi 100k request/giây). 
3. **Môi trường (Environment):** Xảy ra khi nào? (VD: Trong lúc cao điểm, lúc đang bảo trì, lúc bình thường).
4. **Tác nhân chịu ảnh hưởng (Artifact):** Phần nào của hệ thống bị tác động? (VD: Database, Web server).
5. **Phản hồi (Response):** Hệ thống phải làm gì? (VD: Block IP, Chuyển sang server dự phòng).
6. **Đo lường phản hồi (Response Measure):** Tiêu chuẩn đánh giá là gì? (VD: Phải block IP trong dưới 1 giây, Không được mất data).
##### 3. Tạo tổng quan (overview) về ứng dụng
- Kiểu ứng dụng là gì?
- Xác định các ràng buộc (constraints)
- Các kiểu kiến trúc có thể sử dụng
- Các công nghệ liên quan

*Ở bước này còn có bước phác thảo của kiến trúc, sài hình vẽ, đồ thị ... để mô tả*
![[Pasted image 20260601155918.png|229]]
##### 4. Xác định các vấn đề chính
*Câu hỏi: Các vấn đề sẽ gặp phải khi implement cái kiến trúc này là gì, sẽ phải xử lí cái gì...*
- Đảm bảo các thuộc tính chất lượng
  ![[Pasted image 20260601163732.png|408]]
- Hiệu năng và an ninh ![[Pasted image 20260601163723.png]]

VD: Ở trạng thái này thì cần xử lí cái gì, login cho ai quyền sudo, kết nối và lưu trữ database như nào...
![[Pasted image 20260601160224.png|344]]
##### 5. Các giải pháp dự kiến cho các vấn đề trên
Đi được đến bước này đã là bản thiết kế đầy đủ (Bản thiết kế mức cao)
Bao gồm: 
- Kiến trúc triển khai
- Công nghệ lựa chọn,
- Các thuộc tính chất lượng
- Yêu cầu, ràng buộc hệ thống...

*=> NCL một tài liệu yêu cầu hoàn chỉnh* 
### Nguyên lý thiết kế kiến trúc
![[Pasted image 20260601163322.png|271]]
1. ***Phân tách khía cạnh quan tâm***
   Nói cách khác là module hóa, đảm bảo:
	   - Ít sự chồng chéo và phụ thuộc với nhau
	   - Tăng kết nối trong từng module
2. ***Trách nhiệm đơn***: Mỗi module chỉ thực hiện một / tập hợp chức năng được gắn kết
3. ***Các module khác nhau ko cần biết ttin của nhau***
4. ***Không lặp lại***: Mỗi chức năng 1 TP
5. ***Hạn chế thiết kế trước***: Khi chưa đầy đủ thông tin

%% ### Một số tiêu chuẩn trong thiết kế kiến trúc và các đạt được chúng (Không có trong slide) %%

# Một số kiến trúc phổ biến 
### Server - Client
Hệ thống phân tán theo chức năng: Người cung cấp - Người phục vụ
Cấu hình: 1-1, 1-n, n-1

Biến thể
- **Client-Queue-Client**: Server chỉ là hàng đợi để chứa dữ liệu
- **P2P**
- **Application server**: 

### Kiểu phân lớp
![[Pasted image 20260601164214.png|303]]
Nhóm các components có chức năng liên quan vào 1 lớp
Xếp chồng lên nhau, lớp trên được sử dụng chức năng của lớp dưới nó

### Kiểu ống dẫn và bộ lọc

### Kiểu thành phần (Components)
- Chia thành các thành phần độc lập, tương tác qua giao diện

### Kiểu bus thông điệp
Các thành phần trong hệ thống tương tác qua Bus trung gian

### Kiểu hướng dịch vụ
Chức năng cng cấp dưới dạng dịch vụ? 