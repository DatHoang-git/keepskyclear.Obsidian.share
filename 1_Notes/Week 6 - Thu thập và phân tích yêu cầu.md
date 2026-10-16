---
created: 2026-03-31
tags:
  - lecture_note
category:
  - "[[Class]]"
subject:
  - "[[Class. Công nghệ phần mềm - INT2208]]"
---
---
![[Week 6 - Thu thập và phân tích yêu cầu 2026-03-31 16.53.12.excalidraw]]

## 1. Tổng quan về Service as Software (SAS)

### 1.1 SAS là gì?

**SAS** là viết tắt của **Service as Software**, được hiểu là “**dịch vụ được triển khai dưới dạng phần mềm**”.

Nếu như [Software as a Service (SaaS)](https://base.vn/blog/saas-la-gi/) cung cấp công cụ để người dùng tự thao tác, thì SAS tập trung vào việc tạo ra kết quả cuối cùng. Điều này nghĩa là, doanh nghiệp không chỉ “sử dụng phần mềm” mà còn giao cho phần mềm “làm việc thay”.

Khái niệm SAS xuất hiện cùng với sự bùng nổ của [trí tuệ nhân tạo (AI)](https://base.vn/blog/cong-nghe-ai/) và học máy (machine learning) vào đầu những năm 2020. Khi đó, nhiều doanh nghiệp nhận ra rằng chỉ cung cấp phần mềm là chưa đủ. Họ cần các hệ thống có thể tự động hóa và xử lý những công việc phức tạp mà trước đây là do con người đảm nhiệm. Theo các nghiên cứu của [HFS Research](https://www.hfsresearch.com/) và nhiều quỹ đầu tư công nghệ, SAS đang làm mờ ranh giới giữa phần mềm và dịch vụ, hình thành một mô hình lai giữa nền tảng đám mây và khả năng thực thi thông minh của AI.

Một nhầm lẫn thường gặp là coi SAS giống với SaaS, hoặc nhầm với SAS Analytics (phần mềm phân tích dữ liệu). Thực tế, SaaS chủ yếu cung cấp quyền truy cập phần mềm qua đám mây, còn SAS tiến xa hơn bằng cách tích hợp các [AI Agents](https://base.vn/blog/ai-agent-la-gi/) có khả năng tự động hóa quy trình, tạo giao diện linh hoạt theo nhu cầu người dùng và điều chỉnh cách vận hành theo thời gian thực.

_SAS là gì?_

### 1.2 Sự khác biệt cơ bản giữa SAS và SaaS truyền thống

Để phân biệt SAS và SaaS, chúng ta cần nhìn từ nhiều khía cạnh như cách thiết kế hệ thống, mô hình vận hành và cách doanh nghiệp sử dụng.

|   |   |   |
|---|---|---|
|**Tiêu chí phân biệt**|**SaaS Truyền thống**|**Service as Software (SAS)**|
|Mô hình kinh doanh|Cung cấp công cụ để người dùng tự vận hành|Cung cấp kết quả và giải pháp hoàn chỉnh thông qua AI|
|Kiến trúc|Multi-tenant (đa thuê bao) chuẩn với tùy chỉnh hạn chế|Multi-tenant tùy chỉnh động với AI Agents tích hợp sâu|
|Mức độ tùy chỉnh|Giới hạn ở cấu hình và tham số do nhà cung cấp định sẵn|Tùy chỉnh linh động theo từng quy trình nghiệp vụ, giao diện tự động điều chỉnh|
|Vai trò của người dùng|Vận hành và quản lý hệ thống|Giám sát kết quả và xác nhận các quyết định của AI|
|Phương thức triển khai|Truy cập qua trình duyệt, cập nhật đồng loạt cho tất cả người dùng|Triển khai có định hướng (contextual deployment), AI điều chỉnh theo bối cảnh sử dụng|
|Tích hợp AI|AI là tính năng bổ sung (add-on features)|AI là thành phần cốt lõi điều khiển toàn bộ hệ thống|
|Vai trò nhà cung cấp|Cung cấp phần mềm và hỗ trợ kỹ thuật|Như một CTO thuê ngoài, tư vấn chiến lược và tối ưu quy trình liên tục|

Ưu điểm nổi bật nhất của SAS là khả năng tạo giao diện và quy trình làm việc động (dynamically generated). Thay vì sử dụng các màn hình cố định như trong SaaS, hệ thống SAS có thể tự điều chỉnh giao diện, chức năng và luồng công việc dựa trên tình huống cụ thể, lịch sử sử dụng và mục tiêu kinh doanh của từng doanh nghiệp. Vì vậy, hai công ty dùng cùng một nền tảng SAS vẫn có trải nghiệm rất khác nhau, phù hợp với nhu cầu riêng của mỗi bên.

Một khác biệt đáng chú ý khác là vai trò của fractional CTO (giám đốc công nghệ thuê ngoài). Với SaaS, doanh nghiệp thường cần đội ngũ CNTT nội bộ để triển khai, tùy chỉnh và vận hành hệ thống. Trong mô hình SAS, nhà cung cấp đóng vai trò như một CTO bán thời gian, hỗ trợ xây dựng chiến lược công nghệ, tối ưu quy trình và đảm bảo hệ thống luôn bám sát mục tiêu kinh doanh. Cách tiếp cận này giúp các doanh nghiệp vừa và nhỏ giảm đáng kể chi phí và áp lực về nhân sự công nghệ.



---
SAS (Statistical Analysis System) là một bộ phần mềm được sử dụng thực hiện **phân tích thống kê, quản lý dữ liệu**, và thực hiện các tác vụ liên quan đến **khai thác dữ liệu và phân tích số liệu**. SAS có thể được sử dụng trong nhiều lĩnh vực khác nhau như kinh doanh, tài chính, y tế, khoa học xã hội, và nhiều lĩnh vực khác.

### **Khai thác và quản lý dữ liệu**

Với khả năng nhập và xuất dữ liệu linh hoạt, SAS cho phép kết nối trực tiếp với nhiều nguồn dữ liệu khác nhau như SQL, Excel, file txt,... giúp tiết kiệm thời gian xử lý dữ liệu.

### **Phân tích thống kê**

### **Mô hình hóa dữ liệu**

SAS hỗ trợ xây dựng và kiểm tra các mô hình dữ liệu, bao gồm cả mô hình hồi quy tuyến tính và phi tuyến tính, mô hình học máy và khai thác dữ liệu đồng thời cung cấp khả năng tối ưu hóa mô hình và đánh giá hiệu suất của chúng.

## **Ứng dụng của phần mềm SAS**

Với các tính năng vượt trội về phân tích và quản lý dữ liệu, SAS được ứng dụng rộng rãi trong nhiều lĩnh vực khác nhau như:

- Ngân hàng và tài chính: với nhu cầu quản trị rủi ro, đầu tư, cho vay lớn, SAS là công cụ giúp tối ưu hóa hoạt động, dự đoán xu hướng và rủi ro tốt hơn.
- Các cơ quan chính phủ: nhằm phục vụ các hoạt động quản lý dân cư, an ninh, tình báo, phòng chống tội phạm. SAS hỗ trợ phân tích dữ liệu dân cư và an ninh.