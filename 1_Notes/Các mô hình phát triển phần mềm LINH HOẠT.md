---
created: "2026-04-20"
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
[[Buổi 5 - Một số tiến trình phần mềm 2026-03-24 16.55.13.excalidraw]]
# Agile method
*aka Agility - sự linh hoạt, nhạy bén, nhanh nhẹn*
Là tập các nguyên tắc thực hành cho phát triển phần mềm

![[3_Assets/Buổi 5 - Một số tiến trình phần mềm 2026-03-24 16.55.13.excalidraw.md#^frame=TTTTblbU|1000]]

### Tại sao cần Agile?
- Doanh nghiệp thay đổi nhanh chóng / toàn cầu hóa
- Phần mềm phải nhanh mới đáp ứng được cơ hội kinh doanh
- Định nghĩa yêu cầu cố định từ đầu LÀ KHÔNG THỂ
- Vì ycau chắc chắn thay đổi -> Cần một tiến trình phát triển nhanh để thích nghi

### Đặc trưng Agile
1. Đan xen giữa các tiến trình: Đặc tả, thiết kế, cài đặt
2. Tối giản tài liệu
3. Phát triển tăng dần
4. KH là trọng tâm
### Các nguyên tắc của Agile
1. Tương tác cá nhân > Quy trình và công cụ
2. PM hoạt động được > Tài liệu kỹ càng
3. Hợp tác (cộng tác) KH > Thương lượng cứng (đàm phán)
4. Tiếp nhận thay đổi > Làm theo kế hoạch 

# Scrum
![[3_Assets/Buổi 5 - Một số tiến trình phần mềm 2026-03-24 16.55.13.excalidraw.md#^frame=04|100%]]
Là một ~~mô hình~~ KHUNG LÀM VIỆC *(Framework, not process model)* triển khai theo các triết lý của Agile.
Nhấn mạnh vào **3 Vai trò, 3 Tạo tác, 5 Hoạt động**

### 3 vai trò:
1. Product Owner: Đại diện cho KH và doanh nghiệp - Định nghĩa tính năng và độ ưu tiên
2. Development Team: Đội ngũ phát triển
3. Scrum master: Người giám sát, quản lý, đảm bảo quy trình này

### 3 tạo tác
1. Product Backlog: Mô tả sản phẩm PM (Do PO làm)
2. Sprint Backlog: Mô tả công việc, các tính năng,... mà sprint đó sẽ giải quyết (Được chọn từ Product Backlog)
3. Product Increment (Final / Snapshot) - SP có được sau mỗi sprint

### 5 sự kiện
1. Sprint: Nhịp tim của Scrum (2-4 tuần), khoảng tgian để tạo ra pm chạy đc
2. Sprint Planning: Lên kế hoạch cho mỗi sprint (Để tạo ra Sprint backlog)
3. Daily standup (Daily scrum): Họp hàng ngày - Đồng bộ hóa công việc, hôm qua làm gì, hôm nay làm gì, cập nhật về trạng thái / progress của sprint
4. Sprint review: Đánh giá sản phẩm qua mỗi sprint, xem đạt chuẩn chưa
5. Sprint retrospective: Đánh giá, nhìn lại cách vận hành sprint này có ổn k, cần thay đổi chỗ nào k

# Lập trình cực đoan - XP
- Khách hàng tham gia toàn bộ thời gian với nhà phát triển
- ***Lập trình đôi*** (Đặc trưng cốt lõi)
	- Lập trình viên làm theo cặp, có thể luân phiên
	- Cùng nhau ngồi một máy
- Chấp nhận sự thay đổi của các phiên bản

### Những điểm cần chú ý
- **Khách hàng/Người dùng**: Được coi là thành phần **chính thức** của đội phát triển 
- Sự tham gia: KH Toàn bộ thời gian với dev team
- Sinh ra các thẻ yêu cầu. Định dạng yêu cầu:
	- Scenarios - Kịch bản
	- User stories - Câu chuyện người dùng
		- Mẫu hay dùng: `"As a <role>, I want <goal/desire> so that <benefit>`
- Từ thẻ yêu cầu, triển khai thành các nhiệm vụ có thể triển khai được -> Là cơ sở để code

### Vòng đời
![[Các mô hình phát triển phần mềm LINH HOẠT 2026-04-21 07.58.42.excalidraw|800]]

### VD về thẻ yêu cầu
1. Scenarios:
	![[Pasted image 20260421080443.png]]
	VD: Musikbox - KH tới đăng kí phòng
	
	Kịch bản: Tìm phòng trống theo nhu cầu của khách
		Given: Hệ thống đang có các phòng trống thuộc các loại 2, 3, 5, 8 người
		Wheycn: Nhân viên nhập loại phòng = 5 người, thời gian thuê = 2 tiếng vào form tìm kiếm
		And: Nhân viên bấm nút kiểm tra phòng
		Then: Hệ thống hiển thị danh sách phòng trống sức chứa 5 người
2. User Story:
	Mẫu hay dùng: `"As a <role>, I want <goal/desire> so that <benefit>`
	VD:
	As a: Khách hàng tại phòng hát
	I want to: Được tự động phát ngẫu nhiên hoặc nhận các đề xuất bài hát dựa trên thể loại mà tôi đã chọn (Pop, USUK, Indie,...)
	So that: rTôi không bị ngắt cuộc vui để suy nghĩ xem bài hát tiếp theo là gì, tiết kiệm thời gian thao tác trên máy



# Appendix

| Agile | ![[Pasted Image 20260324174056_855.png\|494]] |
| ----- | --------------------------------------------- |
| Scrum | ![[Pasted Image 20260324151238_940.png\|618]] |
