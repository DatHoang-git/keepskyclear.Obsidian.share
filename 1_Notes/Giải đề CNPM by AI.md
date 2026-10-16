[[de_thi_cong_nghe_phan_mem]]
[[dap_an_de_1]]
[[dap_an_de_2]]
[[dap_an_de_3]]
# Đề 1

**Câu 1:**
a)
Phần mềm là là một sản phẩm bao gồm: 
- Mã nguồn, mã cài đặt
- Tài liệu
	- Tài liệu dành cho user, hướng dẫn sử dụng
	- Tài liệu dành cho kỹ thuật viên, quản trị viên hệ thống

- Cấu trúc dữ liệu của phần mềm, cách mà PM được tổ chức, cài đặt, database,...

Phần mềm có các đặc tính khác biệt sau: 
- Sản xuất: Phần mềm được sản xuất theo đội nhóm, phục vụ cho nhu cầu của khách hàng
- PM không hao mòn nhưng thoái hóa: Qua thời gian, môi trường dần thay đổi, từ đó dẫn theo các yếu tố mới tác động vào phần mềm khiến chúng phát sinh ra lỗi. Hay chỉ đơn giản qua thời gian, yêu cầu của khách hàng lại thay đổi để phù hợp hơn với môi trường.
- PM thay thế linh kiện: PM thường được đo may sẵn, trường hợp thay thế linh kiện chính là việc thêm, sửa, xóa các module đang có trong phần mềm, thường tốn nhiều công sức. Trong khi với phần cứng đã sẵn có, và chỉ cần lắp vào là có thể thay thế được.

b)
Các giai đoạn chính của vòng đời PTPM:
1. Lên kế hoạch: Hoạt động chính là lên kế hoạch để phát triển phần mềm theo từng giai đoạn, chi phí, dự trù, ... thiên về quản lý. Sản phẩm đầu ra của bước này là bản kế hoạch hoàn chỉnh cho phát triển PM.
2. Thu thập và phân tích, đặc tả yêu cầu: Bước này sẽ là bước thu thập các yêu cầu của người dùng, từ đó mang về phân tích và đặc tả thành tài liệu đặc tả yêu cầu (SRS). Từ đó có cơ sở để phát triển phần mềm cũng và cũng là cơ sở để đấu thầu / làm hợp đồng. Đầu ra của bước này là SRS - Tài liệu đặc tả yêu cầu
3. Thiết kế: Là khâu sẽ thiết kế các kiến trúc phần mềm, các chi tiết dựa vào tài liệu đặc tả yêu câu ở bước trên. Kỹ sư sẽ đọc tài liệu đặc tả và mô hình hóa doanh nghiệp của khách hàng, từ đó thiết kế các kiến trúc phần mềm phù hợp theo yêu cầu, cùng với các bản thiết kế chi tiết. Sau bước này ta sẽ có tài liệu thiết kế chi tiết. 
4. Cài đặt: Dựa vào thiết kế, ta triển khai thiết kế đó trên các môi trường mà KH yêu cầu. Sản phẩm đặc trưng của bước này là hệ thống hoàn chỉnh đã được cài đặt và mã nguồn.
5. Kiểm thử: Bao gồm kiểm chứng và thẩm định. Kiểm tra xem PM đã được cài đặt đúng với thiết kế chưa, và kiểm tra xem đã đúng yêu cầu của khách hàng chưa, KH có hài lòng không? Đầu ra của bước này là các tài liệu kiểm thử.
6. Vận hành và bảo trì: Là đưa PM vào hoạt động và đảm bảo mọi thứ hoạt động xuyên suốt, sửa các lỗi phát sinh. Cập nhật các thay đổi

***Câu 2:***
a)
- Mô hình thác nước: Theo luồng tuần tự từ trên xuống dưới, bao gồm các khâu
Thu thập và phân tích yêu cầu -> Thiết kế -> Cài đặt và kiểm thử -> Đánh giá -> Vận hành và bảo trì
- Mô hình spiral: Theo hình xoắn ốc phát triển tăng dần từ bé ra to. Với mỗi vòng sẽ đầu ra sẽ là một prototype

b)
So sánh:

|                            | Waterfall                        | Spiral                          |
| -------------------------- | -------------------------------- | ------------------------------- |
| Khả năng thích ứng         | Kém                              | Tốt                             |
| Quản lý rủi ro             | Rủi ro bị tích lũy đến bước cuối | Rủi ro được chia đều ở mỗi loop |
| Phù hợp                    | Dự án nhỏ                        | Dự án lớn                       |
| Chi phí phát hiện lỗi muộn | Cực lớn                          | Nhỏ                             |

c)
Tôi sẽ chọn mô hình Spiral, vì mỗi khâu đều có bước đánh giá rủi ro, từ đó đảm bảo được độ tin cậy và chính xác cho hệ thống

***Câu 3:***
a)
Phân biệt yêu cầu chức năng và phi chức năng:

|     | Chức năng                                                                                                                                                                                                                            | Phi chức năng                                                                                                                                                    |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|     | Là yêu cầu căn bản, là các chức năng mà PM cần phải có                                                                                                                                                                               | Thường là yêu cầu về hệ thống, các yêu cầu đặc thù tới nghiệp vụ                                                                                                 |
| VD  | PM có chức năng mua hàng và thanh toán trực tiếp ngay trên hệ thống bằng TK ngân hàng<br><br>Khách hàng có thể lướt video ngắn trên nền tảng<br><br>Phần mềm sẽ tung mã giảm giá vào các ngày sinh nhật hoặc ngày đôi (3/3, 4/4,...) | PM có khả năng chịu tải 3 triệu người dùng truy cập cùng lúc<br><br>Hệ thống có thể chứa 1 tỷ bản ghi<br><br>Hệ thống khi tải bất kì trang mới không được quá 2s |

b)
Các bước trong quy trình kỹ nghệ yêu cầu:
1. Thu thập và khám phá yêu cầu
2. Đặc tả yêu cầu
3. Thẩm định yêu cầu
4. Quản lý yêu cầu

Thẩm định quan trọng vì nó đảm bảo cái yêu cầu nó hợp lý, không nhập nhằng, tránh sự sai lầm trong cách triển khai. Bằng cách đảm bảo:
1. YC phải chính xác, rõ ràng, tường minh
2. YC phải có thể truy vết được
3. YC phải kiểm chứng được
4. YC phải thích ứng được

c) Đặc tính của một bản đặc tả tốt:
CHỊU!


***Câu 4***:
a)
Các tác nhân: 
- Thủ thư
- Bạn đọc
- Hệ thống
- Quản trị viên

Các ca sử dụng:
- Thêm sách
- Đăng ký
- Hủy tài khoản
- Mượn sách
- Trả sách
- Đặt trước sách
- Xóa sách
- Cập nhật sách



b)
![[Giải đề CNPM by AI 2026-06-17 08.10.43.excalidraw]]

UC-07: Mượn sách
Tác nhân: Bạn đọc vào giao diện chính của phần mềm
Điều kiện tiên quyết:
- Bạn đọc đã đăng nhập vào hệ thống
- Bạn đọc không bị khóa thẻ
Luồng sự kiện chính:
1. Bạn đọc lướt tìm tài liệu mình muốn mượn 
2. Bạn đọc nhấn vào tài liệu mình muốn mượn
3. Hệ thống tải các thông tin liên quan (tên, năm xuất bản, số trang,...)
4. Bạn đọc xem các thông tin và nhấn nút "Mượn sách"
5. Hệ thống ghi nhận vào trong cơ sở dữ liệu
6. Hệ thống hiển thị lên màn hình thủ thư về thông tin người mượn sách mượn
7. Thủ thư chấp thuật và đưa tài liệu vật lý cho bạn đọc
