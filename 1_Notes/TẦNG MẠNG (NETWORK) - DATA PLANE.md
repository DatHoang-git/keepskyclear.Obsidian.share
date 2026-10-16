---
created: 2026-05-15
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Mạng máy tính - INT2213]]"
---
---
\src: 
[[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-05-15 13.09.34.excalidraw]]
[[Chapter_4_v8.2.pdf]]

![[Chapter_4_v8.2.pdf#page=36&rect=92,96,733,390|Chapter_4_v8.2, p.36]]
# Tổng quan về Tầng Mạng - *(Network Layer Overview)*
![[3_Assets/TẦNG MẠNG (NETWORK) - DATA PLANE 2026-05-15 13.09.34.excalidraw.md#^frame=01|100%]]
## Các chức năng cốt lõi
![[3_Assets/TẦNG MẠNG (NETWORK) - DATA PLANE 2026-05-15 13.09.34.excalidraw.md#^frame=02|100%]]
   * **Chuyển tiếp (Forwarding):** Di chuyển gói tin từ cổng vào sang cổng ra của một router
   * **Định tuyến (Routing):** Quá trình tìm đường đi từ nguồn đến đích

Ta tách ra làm 2 phần, ***control plane*** và ***data plane*** theo cái chức năng của nó *(local vs global)*

>[!important] Internet sử dụng mô hình "Nỗ lực tối đa" (Best-effort service) 
>Không đảm bảo băng thông, độ trễ, hay thứ tự gói tin, đó là để đảm bảo:
>- Cơ chế đơn giản, dễ cài đặt
>- Cung cấp đủ băng thông *(không chèn thêm băng thông các tầng kia vì đã đủ nhiều r)* cho các ứng dụng cần nhanh

# Kiến trúc bên trong Router (What’s inside a router) 
![[3_Assets/TẦNG MẠNG (NETWORK) - DATA PLANE 2026-05-15 13.09.34.excalidraw.md#^frame=03|100%]]
### Kiến trúc tổng quan
![[3_Assets/TẦNG MẠNG (NETWORK) - DATA PLANE 2026-05-15 13.09.34.excalidraw.md#^frame=04|100%]]
Các thành phần chính của router:
- Các "làn đường", làn này lấy các input của các tầng thấp hơn *([[TẦNG LIÊN KẾT DỮ LIỆU VÀ MẠNG LAN - LINK LAYER|link layer]]*, *physical layer)*
- Ở mỗi làn, có một trạm soát vé thuộc dataplane:
	- Các gói từ tầng link xếp hàng *(queue)*
	- Người soát vé xem header của gói tin, và quyết định gửi nó đi đâu *([[TẦNG MẠNG (NETWORK) - DATA PLANE#Router forwarding như thế nào?|but how]]?)*
- Khi đã xác định xong số phận của nó, ta đẩy nó vào "vòng xuyến" ([[TẦNG MẠNG (NETWORK) - DATA PLANE#Các cấu trúc chuyển mạch (Switching Fabrics)|switching fabrics]])

### Router forwarding như thế nào?
Bằng 3 bước:
1. Router đọc IP đích
2. [[TẦNG MẠNG (NETWORK) - DATA PLANE#Tra cứu Bảng chuyển tiếp - Forwarding Table|Đối chiếu với bảng chuyển tiếp]] *(Forwarding Table)*
3. Nếu khớp, đẩy nó ra cổng đầu ra để đi tiếp

###### ***Tra cứu Bảng chuyển tiếp - Forwarding Table***
*Tra theo phương thức: Chuỗi khớp nhiều nhất đầu tiên*
![[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-06-15 23.35.23.excalidraw|800]]
Nó sẽ dựa vào địa chỉ, chuyển về cái link interface *(khái niệm của tầng [[TẦNG LIÊN KẾT DỮ LIỆU VÀ MẠNG LAN - LINK LAYER|liên kết]])*

**Xử lý tại Cổng vào (Input Port Functions):**
   * Quá trình tra cứu bảng chuyển tiếp.
   * Chuyển tiếp dựa trên đích đến (Destination-based forwarding).
   * Cơ chế **Khớp tiền tố dài nhất (Longest Prefix Matching - LPM)**.

####  Các cấu trúc chuyển mạch (Switching Fabrics)
![[3_Assets/TẦNG MẠNG (NETWORK) - DATA PLANE 2026-05-15 13.09.34.excalidraw.md#^frame=05|100%]]
>Nó chỉ đơn giản là cái "mạch máu", cái con đường, ko có gì đặc biệt. Và có các cách khác nhau để làm điều đó

###### Chuyển mạch qua Bộ nhớ (Memory)
Sài cho router đời đầu
Phó mặc cho [[Class. Nguyên lý hệ điều hành - INT2214|OS]] của Router để điều chuyển gói tin
Phụ thuộc vào băng thông mem và tốc độ xử lý của CPU
###### Chuyển mạch qua Bus
>*Khái niệm Bus khá thường gặp trong ngành IT, hay ẩn dụ nó với **"mạch máu"***

Một mạch máu dùng chung cho toàn bộ các link *(chỉ có ==**động mạch**==)*
###### Chuyển mạch qua Mạng kết nối chéo (Interconnection Network/Crossbar)
Cũng là bus, nhưng mà là ==***"mao mạch"***==
Ở mỗi nút giao lại có một cái switch nho nhỏ, là đóng hay mở cái nút đó

### Router quản lý các gói tin như thế nào? 
Quản lý hàng đợi và Bộ đệm (Queuing & Buffer Management):
Sẽ xảy ra hàng đợi ở 2 chỗ:
- Khi switch fabric < tốc độ đến: Xảy ra [[TẦNG MẠNG (NETWORK) - DATA PLANE#Tắc nghẽn tại cổng vào|tắc nghẽn ở input]]
- Khi switch fabric > tốc độ xử lý của link: Xảy ra [[TẦNG MẠNG (NETWORK) - DATA PLANE#Tắc nghẽn tại cổng ra|tắc nghẽn ở output]]
##### Tắc nghẽn tại cổng vào
Vấn đề Chặn đầu hàng đợi (Head-of-the-Line / HOL Blocking).
![[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-06-15 23.56.36.excalidraw|700]]

##### Tắc nghẽn tại cổng ra
Có buffer ở bên nhận, drop gói tin nếu đầy
![[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-06-16 00.12.07.excalidraw|800]]
Giải pháp cho vấn đề [[TẦNG MẠNG (NETWORK) - DATA PLANE#Tắc nghẽn tại cổng vào|HOL]]

# Giao thức IP (Internet Protocol) 
### Cấu trúc gói tin IP (Datagram format)
Phân tích các trường trong Header của IPv4 (Version, Length, TTL, Checksum, Source/Dest IP...).

![[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-06-16 08.58.03.excalidraw|700]]

###### ***Interface*** - Giao diện mạng
Là cầu nối giữa host/router và đường truyền vật lý *(là khái niệm của [[TẦNG LIÊN KẾT DỮ LIỆU VÀ MẠNG LAN - LINK LAYER|tầng link]])*. Một host/router có thể có một hoặc nhiều interface *(ảo và vật lý)*
>*Máy t có 3 interface?*
>2 ảo (1, 4) và 1 vật lý (3)
>![[Pasted image 20260616090656.png]]

Mạng có thể kết nối có dây và không dây, ở mỗi interface khác nhau đều có thể đc đánh IP
### Subnets
Subnet (Mạng con) là một **tập hợp các thiết bị** (hoặc các giao diện mạng) **chia sẻ chung một dải địa chỉ IP**, có thể giao tiếp trực tiếp với nhau ở tầng liên kết dữ liệu (Tầng 2) mà KHÔNG cần nhờ đến sự định tuyến của Router (Tầng 3).
![[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-06-16 09.10.45.excalidraw|600]]
Các bit đầu dành cho ***host*** *(tên họ)*, các bit sau dành cho ***subnets*** *(tên riêng)*

Vậy làm sao để một host có địa chỉ trong mạng của nó đây? 
- Cấu hình thủ công
- Sử dụng [[TẦNG MẠNG (NETWORK) - DATA PLANE#DHCP (Dynamic Host Configuration Protocol) - Cấp phát IP động|DHCP]] để cấp phát IP động khi join mạng

### DHCP (Dynamic Host Configuration Protocol) - *Cấp phát IP động*
![[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-06-16 09.22.45.excalidraw|800]]
Cách thiết bị xin cấp IP tự động bằng cơ chế ***broadcast***: 
1. Khi máy *client* mới vào mạng, nó gửi tín hiệu broadcast (255.255.255.255) cho ***toàn bộ máy*** trong mạng. Gào lên *"Có thằng DHCP server nào ở đây không!!?"*
2. CHỈ *DHCP server* đáp lại: *"Đây tao đây, tao thấy m rồi, địa chỉ của m đây có lấy ko?"*
3. *Client:* *"OK, t lấy luôn"*
4. *DHCP server*: *"OK, đã xác nhận, tao sẽ cho m vào sổ để ghi nhớ"*

### Dịch địa chỉ mạng - NAT (Network Address Translation)
> Giải pháp cho vấn đề cạn kiệt IPv4.
   Cách hoạt động của bảng dịch NAT (NAT Translation table) để ***giấu hàng loạt thiết bị*** sau một ***IP Public duy nhất.***
![[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-06-16 10.02.09.excalidraw|800]]

Thực chất ISP chỉ cung cấp cho mỗi thuê bao 1 IP, còn lại mọi điều kì diệu là do NAT hết!!

***Các tranh cãi xung quanh việc sử dụng NAT***
- Thiếu địa chỉ thì nên sài IPv6
- NAT can thiệp cả vào [[TẦNG GIAO VẬN#^8a4030|Port]] của [[TẦNG GIAO VẬN|tầng giao vận]] => Làm mất đi tính End-to-End

*Sài NAT thì thêm 1 lớp bảo mật?*

### (Đọc thêm (?)) Cơ chế phân mảnh, hợp nhất của IP
Do các links của mạng *(Là [[TẦNG MẠNG (NETWORK) - DATA PLANE#Interface - Giao diện mạng|interfaces]] đúng ko?)* có MTU *(max tranfer size)*, cái *frame* có cỡ lớn nhất
=> Ở tầng IP buộc phải chặt nó ra mới có thể nhét vừa frame của tầng link
![[TẦNG MẠNG (NETWORK) - DATA PLANE 2026-06-16 10.25.28.excalidraw|700]]
### Giao thức IPv6
Tại sao có: 
- Cạn kiệt IPv4

![[Chapter_4_v8.2.pdf#page=64&rect=52,53,828,521|Chapter_4_v8.2, p.64]]
Đặc điểm:
- ***128 bit***
- Lược bỏ [[TẦNG GIAO VẬN#UDP Checksum|checksum]]
- Không [[Chapter_4_v8.2.pdf#page=80&rect=40,101,832,528|phân mảnh / hợp nhất]] 
- Không có header options


##### Chuyển đổi từ IPv4 sang IPv6 - *Cơ chế Tunneling (Đường hầm)*
Cách mạng Internet vận hành song song 2 giao thức.
Cơ chế **Đường hầm (Tunneling):** Đóng gói IPv6 vào bên trong gói tin IPv4 để đi qua các router cũ.
![[Chapter_4_v8.2.pdf#page=65&rect=181,60,666,264|Chapter_4_v8.2, p.65]]


