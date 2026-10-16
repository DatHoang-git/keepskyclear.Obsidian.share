---
created: 2026-05-19
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Công nghệ phần mềm - INT2208]]"
---
---
\src:
[[12_Tong quan Testing.pptx]]
[[Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw]]

![[Tổng quan Kiểm thử và đảm bảo chất lượng phần mềm 2026-06-14 09.16.17.excalidraw|600]]
# Giới thiệu
![[3_Assets/Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw.md#^frame=02|100%]]
Đây là bước quan trọng, nhằm đảm bảo đầu ra sao cho đúng với yêu cầu của KH nhằm ***Đảm bảo chất lượng PM*** để làm đợc điều đó, ta cần ***Kiểm thử***

*Thất bại = PM không đúng với đặc tả*

Tại bước này *(Kiểm định - Testing)*, sẽ có 2 trụ cột / hoạt động chính:
- Kiểm chứng: Đảm bảo đúng kiến trúc và cài đặt so với đặc tả *(cực kì **technical**)*
- Thẩm định: Xem có đáp ứng đúng nhu cầu KH ko *([[Tổng quan về phân tích và đặc tả yêu cầu#Có những dạng yêu cầu nào?|yêu cầu chức năng và phi chức năng]])*

> *Do Kiểm chứng và Thẩm định có rất nhiều sự đan xen, cho nên về sau ta gọi chung là Testing - Kiểm thử* 
> *Why? VD: Bạn vừa phải check module login có mã hóa đúng mk ko (Kiểm chứng), vừa phải đối chiếu xem có đúng yc dưới 2s của KH ko (Thẩm định) => Ngta gộp chung vào thành 1 bộ phận*

>[!important] Có thể chỉ ra lỗi, nhưng không thể nói là hết lỗi
>*Kiểm thử mà không tìm ra gì = Ko kiểm thử / Loser*
>*Kiểm thử thành công là tìm được lỗi chưa từng được phát hiện*
### Kiểm chứng & Thẩm định (V&V)
![[3_Assets/Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw.md#^frame=01|80%]]
***Kiểm chứng (Verification)***: Kiểm tra xem cài đặt, kiến trúc *(code, các thiết kế)* có đúng đặc tả ko
***Thẩm định (Validation)***: Kiểm tra xem thỏa mãn được YC của KH ko
# Kiểm thử
### Quy trình kiểm thử
![[3_Assets/Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw.md#^frame=03|80%]]
Các bước:
1. **Xác định**: Kiểm thử cái gì, một module / event...
2. **Thiết kế**: (Làm thế nào) Xây dựng ca kiểm thử
3. **Xây dựng**: (Build) Tạo testcase cho các ca kiểm thử, bộ kiểm thử
4. **Chạy**: Chạy các ca kiểm thử
5. **Đánh giá**: So sánh, phân tích giữa KQ có và KQ muốn

>[!note] Bài toán của người kiểm thử
>Nằm ở ***Bước 1, 2***: Làm sao để xác định được kiểm thử cái gì? 
>![[3_Assets/Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw.md#^frame=07|100%]]
### Phân loại kiểm thử
##### Kiểm thử hộp đen
![[3_Assets/Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw.md#^frame=08|100%]]
AKA kiểm thử hàm, kiểm thử chức năng
Tập trung hành vi vào ra. Với đầu vào đã biết -> So KQ đầu ra với dự đoán

Không gian vô hạn
Giải quyết bằng việc chia ra thành các tập có hành vi giống nhau ("miền tương đương") 
=> Chọn thằng đại diện cho miền đó -> Đảm bảo tính bao phủ

##### Kiểm thử hộp trắng
![[3_Assets/Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw.md#^frame=09|100%]]
Thay vì blind box như [[Tổng quan Kiểm thử và đảm bảo chất lượng phần mềm#Kiểm thử hộp đen|kiểm thử hộp đen]], hộp trắng yêu cầu ***đào sâu*** vào cấu trúc code. Bao gồm:
- Cấu trúc code như thế nào? *(if/else, for, while,...)*: Biểu diễn bằng đồ thị CFG *(Control Flow Graph)*
- Đường đi của Data như thế nào?: Biểu diễn bằng đồ thị DFG *(Data Flow Graph - theo dõi vòng đời của **biến, tập tin, files, object,...** xem nó có bị móp/méo mó, thay đổi như thế nào)*

Cần đảm bảo tiêu chuẩn bao phủ:
1. **Dòng lệnh:** Mọi lệnh được chạy
2. **Nhánh:** Tất cả nhánh được chạy *(atleast 1)*
3. **Đường đi:** Tất cả đường đi được chạy 
4. **Vòng lặp:** Ít nhất 1 *(chạy càng nhiều thì HI VỌNG bắt càng nhiều)*

>*Nhánh khác gì đường đi vậy?*
>Giống việc so sánh [[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=l4yY3ibm|routing và forwading trong mạng máy tính]], *bao phủ nhánh chưa chắc bao phủ được đường*
##### So sánh
![[3_Assets/Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw.md#^frame=06|80%]]

### Các mức kiểm thử
![[3_Assets/Buổi 13 - Kiểm thử và đảm bảo chất lượng phần mềm 2026-05-19 16.23.25.excalidraw.md#^frame=10|100%]]

### Kiểm thử hồi qui
Khi cứ một lần **chỉnh sửa**, chạy lại **kiểm thử toàn bộ**

### Tài liệu kiểm thử
Bao gồm:
1. Kế hoạch kiểm thử
2. Kịch bản kiểm thử
3. Báo cáo lỗi
4. Nhật kí kiểm thử (log)
5. Báo cáo tổng kết kiểm thử
