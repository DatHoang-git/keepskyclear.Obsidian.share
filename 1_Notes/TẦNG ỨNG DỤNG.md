---
created: 2026-05-06
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Mạng máy tính - INT2213]]"
project:
  - "[[Ôn thi giữa kì II năm 2026]]"
---
---
/src:

[[Week 4 - Tiếp tục với chương 2 2026-03-20 16.51.36.excalidraw]]
[[Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw]]
[[Week 3 - Tầng ứng dụng 2026-03-13 16.37.58.excalidraw]]
[[Chapter_2_v8.2.pdf]]

# Kiến trúc Application

> *Trước khi đi vào thiết kế bất cứ cái gì, mạng Internet có những kiểu giao tiếp máy tính nào trước tiên?*
### Các mô hình mạng
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=01|100%]]
##### CLIENT-SERVER
Bên phục vụ - Bên còn lại hưởng
Server:
- (should be) Up 24/7
- Large computational capacity
- Fixed IP
Client: 
- Dynamic IP
- sending request to server
##### P2P - Peer to Peer
Mỗi người nắm một mẩu. Bẻ nhỏ mỗi nơi một tí.
Khi cần thì gom nhóm *(Swarming)*

Các client tự giao tiếp lẫn nhau, sử dụng computational capacity của nhau 

-> Khó kiểm soát

### Giao tiếp tiến trình và Socket
> *Muốn các máy tính giao tiếp được với nhau (cụ thể hơn là các **tiến trình**), để hoạt động được theo các mô hình trên thì cần **Giao tiếp tiến trình**, để làm được việc đó ta sử dụng **Socket***
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=02|100%]]
#### Tiến trình
Là PM đang chạy
- Tiến trình client: Là tiến trình **khởi tạo** giao tiếp 
- Tiến trình server: Là tiến trình **đáp lại** luồng yêu cầu tới
>*Chúng trao đổi **messages - tin nhắn** - Đơn vị thông tin ở tầng Application*

>[!important] *"Bản chất giao tiếp máy tính chính là giao tiếp tiến trình"*

#### Socket
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=03|100%]]
Nó chính là một cái "cánh cửa" *(nơi nhận / gửi hàng)*:
- Gửi tiến trình: *Đẩy ra socket*
- Cả 2 socket ở 2 bên sẽ tham gia vào quá trình nhận/gửi

Mỗi *socket* được định danh bởi 1 cặp ***IP + Port***

Có 2 kiểu socket *(Tương ứng với [[TẦNG GIAO VẬN]] phía dưới)*:
- *TCP*: 
	- Truyền tin tin cậy
	- Điều khiển luồng *(how to make receiver not overwhelmed)*
	- Điều khiển tắc nghẽn
	- Connection-oriented: "Hướng liên kết", nhấn mạnh vào việc setup liên kết giữa server-client
- *UDP*:
	- Truyển tin không tin cậy
	- Không bao gồm tất cả thứ mà TCP mang lại

> *Trong thực tế người ta còn dùng thêm TLS (Transport Layer Security) sử dụng TCP để đảm bảo bảo mật nhờ cơ chế mã hóa (mà socket TCP và UDP ko có)*
# Các ứng dụng tầng Application
### Web/HTTP
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=04|100%]] 
Web chứa các ***objects*** *(các HTML files, ảnh, audio,...)* chứa ở các ***Webserver***
Thanh địa chỉ ở trên web chỉ là *Hostname + Đường dẫn* tới object đó

>*Giao thức để người dùng cuối giao tiếp với ứng dụng web **chỉ có một**, đó là [[TẦNG ỨNG DỤNG#HTTP|HTTP]]*
##### HTTP - *HyperText Transfer Protocol*
Có các đặc điểm chính sau: 

###### ***HTTP sử dụng TCP***
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=05|100%]]
Các bước thực hiện: 
**B1**: Client gửi *SYN (flag của **TCP**)* tới server HTTP *(port 80)*
**B2**: Server chấp nhận request, gửi *SYN_ACK*, client rep lại *ACK*
**B3**: Client vs Server gửi HTTP messages qua lại với nhau 
...
**B4**: Đóng kết nối HTTP (TCP)

###### ***Header HTTP có gì? Có những Request Message nào của HTTP?***
![[TẦNG ỨNG DỤNG 2026-06-14 21.29.52.excalidraw|700]]
Các request message:
1. **POST method**: Gửi dữ liệu mới / tạo mới trong bụng gói HTTP "Entity Body" / Payload
2. **HEAD method**: Đúng như tên, chỉ lấy **headers** - nhãn
3. **GET method**: Xin chỉ lấy **dữ liệu**
4. **PUT method**: Cập nhật, ghi đè toàn bộ

###### ***HTTP có 2 loại***
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=06|100%]]

| Non-persistent HTTP<br>*(HTTP ko liên tục)*                                                                                                                                                                                                                                               | Persistant HTTP<br>*(HTTP liên tục)*                                                                                                                                                                                                                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1. Mở TCP<br>2. **Nhiều nhất** 1 object được gửi đi<br>3. Đóng TCP<br><br>=> Muốn tải nhiều objects thì thiết lập nhiều kết nối<br><br>==**Cho 1 object**==<br>$2RTT +\text{ Thời gian truyền file}$<br>**Cho n objects**<br>$n \times (2RTT + \text{Thời gian truyền của 1 object})$<br> | 1. Mở TCP<br>2. Nhiều object được gửi đi trong **1 connection**<br>3. Đóng TCP<br><br><br><br>==**Cho 1 object**==<br>$RTT +\text{ Thời gian truyền file}$ <br>**Cho n objects**<br>$2RTT + T_{\text{HTML}} + n \times (1RTT + T_{\text{object}})$<br><br>*nếu có pipeline, thời gian cho n object sẽ là:*<br>$3RTT +\text{Tổng tg truyền file}$ |

###### ***HTTP không lưu trạng thái***
Lí do: Để giảm overhead -> Request cho mỗi lần ko đc lưu lại -> Bất tiện
Giải pháp:  ***[[TẦNG ỨNG DỤNG#Cookies|Cookies]]***

###### Cookies
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=07|100%]]
- Là cặp **key-value tạo ở web client** *(và lưu ở đây)*. 
- Cặp này được truy vấn trong *Database* của Webserver *(nếu có)* được lưu trữ **trong một khoảng thời gian** khi người dùng truy cập vào. 
- Với mục tiêu **giảm bớt thao tác lặp lại** ko cần thiết cho ng dùng

Khi web client gửi request, nó sẽ gửi kèm cookies

Nó lưu các thông tin mà người dùng muốn lưu *(mk đăng nhập, phiên, thông tin ng dùng, shopping carts,...)*

###### Cơ chế giảm stress cho server
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=08|100%]]
Gỡ tải cho origin server bằng cách tạo thêm clone của nó để làm ***cache*** *(ở đây mình thấy nó giống "Proxy" (ủy quyển) + Cache hơn, "Cache ủy quyền???")*

>*Đoạn này hoạt động giống KTMT/OS: cache miss, cache hit, tra record...*

### Email
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=09|100%]]

Có 3 thành phần chính trong giao thức này:
1. User: Đọc / Gửi email
2. Mail server: Đóng vai trò là *"Hộp thư"* cho user, bao gồm việc *trữ thư được gửi đến*, và *trữ thư được gửi đi*
3. Phương thức truyền mail - SMTP
##### SMTP - *Simple Mail Transfer Protocol*
>[!attention] Đây là giao thức để ĐẨY message đi, không phải để NHẬN ([[TẦNG ỨNG DỤNG#IMAP/POP3|IMAP/POP3]] or [[TẦNG ỨNG DỤNG#HTTP - *HyperText Transfer Protocol*|HTTP]])

3 pha truyền:
1. **SMTP Hanshaking** *(Bên cạnh thiết lập TCP, nó còn có riêng cơ chế handshake của mình: 220 - HELO - 250 Hello)*
2. **SMTP truyền messages** 
3. **Đóng SMTP**

##### IMAP/POP3
>*Phần này có vẻ ko chú trọng lắm:v*

### DNS *- Domain Name System*
>*Giống tra SĐT với tên: 0353xxx - Đạt*

TRA CỨU từ tên miền sang IP và ngược lại
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=10|100%]]
Là **cơ sở dữ liệu phân tán** theo kiến trúc phân tầng, các tầng bao gồm:
- **Root**: Tên miền thủy tổ, do ICANN đã định *(13 tên miền)*
- **Top Level Domain**: `.com .org .edu`
- **Authoritative**: `.vnu.edu.vn`
![[TẦNG ỨNG DỤNG 2026-06-14 21.57.13.excalidraw|200]]
###### ***Có 2 cách duyệt DNS***
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=11|100%]]
- ***Tuần tự***: Đi từ ROOT -> TLD -> Authoritative
- ***Đệ quy***: Giống gọi hàm

###### ***Bản ghi DNS***
![[3_Assets/Tổng kết chương 2 MMT - Tầng ứng dụng 2026-03-20 14.37.08.excalidraw.md#^frame=12|100%]]
Các loại bản ghi: *Theo format (name, value, type, ttl)*
- **Type A**: `hostname - IP address`
- **Type CNAME**: Dành cho tên alias `tên thật - tên giả`
- **Type NS**: Bản ghi ủy quyền, *(với tên như này thì tao đẩy về thằng nào?)*
- **Type MX**: Dành cho mail server




# To be solved? 
> [!PDF|] [[Chapter_2_v8.2.pdf#page=8&selection=34,0,40,16|Chapter_2_v8.2, p.8]]
> > note: applications with P2P architectures have client processes & server processes
> 
> 