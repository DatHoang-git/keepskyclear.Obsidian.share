---
created: 2026-05-05
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
\src:
[[TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw]]
[[Chapter_1_v8.2.pdf]]
# Cấu trúc mạng Internet
![[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=02|80%]]
***Internet***
Là mạng của các mạng *(của các ISPs)*

***Phương thức (Protocols)*** chính là cách giao tiếp của các thành phần bên trong Internet
### Cấu trúc của Internet
![[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=01|100%]]
Chia ra làm 2 phần: 
##### Network Edges
Là rìa của Internet
Bao gồm các client, hosts
##### Network Core
Là phần *ở giữa* các network edges
Bao gồm:
- Các *Routers*: Có chức năng *Forwarding* và *Routing*
- Các *Access Networks*: Là các phương tiện phát sóng, chính là "mạch máu", trạm trung chuyển của thông tin
##### Access Network
>*Làm sao để hòa mạng? Có những cách nào để kết nối, thông qua cái gì?*

![[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=03|100%]]
Sử dụng các công nghệ sau: 
1. ***Kết nối bằng cáp***:
	- Chia kênh theo tần số *(FDM - Phân kênh **Tần số)**): 
	  Chỉ *một* trục cáp, người dùng *đấu dây* vào cái trục cáp đó  --> Nối đến ISP --> Internet
	-  DSL - *Digital Subcriber Line*: 
	  Mỗi người dùng *một dây nối thẳng* tới ISPs, thường kết hợp với line điện thoại
2. ***Kết nối "Home Network"***:
	- Cũng sử dụng DSL, nhưng tiến hóa hơn ở chỗ dùng *Router* cho mỗi gói đăng kí  (or nhiều thiết bị + WiFi hơn (?)) 
3. ***Kết nối mạng tổ chức***
	- Cũng sử dụng DSL
	- Thường sẽ có cái *Switch* để phục vụ kết nối nhiều thiết bị

# Đo hiệu năng truyền tải

### Độ trễ truyền tải
![[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=04|100%]]
>[!important] Độ trễ truyền tải tính bởi
>$$d_{nodal} = d_{proc} + d_{queue} + d_{trans} + d_{prop}$$
>Trong đó:
>- $d_{proc}$: Độ trễ xử lý của từng router *(check bit error, output link, ...)*
>- $d_{queue}$: [[TỔNG QUAN VỀ MẠNG MÁY TÍNH#Đo packet queuing delay|Độ trễ chờ trong queue]]
>- $d_{trans} = L/R$: Độ trễ để đẩy data lên dây
>- $d_{prop} = d/s$: Độ trễ lan truyền *(trên đường dây)*

##### Đo packet (tran)mission delay
![[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=07|100%]]
*(Quá trình đẩy data lên Router)* Được thực hiên qua cơ chế ***Store and Forward***
Đủ số bit trong 1 packet rồi mới truyền

$$
\text{Packet Tranmission Delay} = \frac{L (bits)}{R(bits/\sec)}
$$

##### Đo packet queuing delay
![[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=05|100%]]
$$
I = \frac{{L\times a}}{R} = \frac{\text{Tốc độ bit đến}}{\text{Tốc độ phục vụ}}
$$
Trong đó:
- $a$: Rate trung bình mà các packet tới
- $L$: Độ lớn của packet
- $R$: Khả năng phục vụ

Đo cường độ lưu lượng *(hàm 1/x)*:
- $I \approx 0$: Ít lưu lượng
- $I \to 1$: Lưu lượng đông, xung đột rất nhiều, lưu lượng gần bằng tốc độ xử lý
- $I > 1$: Queue kéo dài vô hạn

### Thông lượng
![[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=06|100%]]
Là tốc độ các bit chuyển từ $A \to B$, là số bit hữu dụng được chuyển đi *(đã ko bao gồm các bit bị lỗi)*
$$
Thr= \frac{F}{t} (bit/\sec)
$$

***Phân biệt thông lượng, băng thông, tốc độ truyền***
- Thông lượng: Khả năng **thực tế** truyền **thành công** *(bỏ đi các yếu tố "bị hỏng" khác)*
- Băng thông: Khả năng **tối đa** của cái link đó, giới hạn **vật lý**
- Tốc độ: Là khả năng **đẩy** dữ liệu đi, *(aka Speed)*

***Thông lượng << Băng thông***
Do:
1. *Overhead*
2. Tắc nghẽn
3. Xử lí ... 
# Các tầng giao thức mạng
![[3_Assets/TỔNG QUAN VỀ MẠNG MÁY TÍNH 2026-05-05 14.51.19.excalidraw.md#^frame=08|100%]]
>Để máy tính giao tiếp được, không thể thực hiện bằng cách sử dụng một vài protocol đơn lẻ, mà cần sự phối hợp giữa các protocol khác nhau ở các độ sâu *(phần cứng, phần mềm)* khác nhau

Một cái theme xuyên suốt: ***"Encapsulates - Đóng gói***
- Tầng sau bọc tầng trước bằng phương thức của nó *(bên gửi)*
- Thông tin được lấy ra khi bóc vỏ bọc *("bóc hàng")* của bên nhận để lấy Data *(bên nhận)*

 Trong giáo trình này, sẽ học 5 tầng chính 
 1. [[TẦNG ỨNG DỤNG]]
 2. [[TẦNG GIAO VẬN]]
 3. [[TẦNG MẠNG (NETWORK) - DATA PLANE]] và [[TẦNG MẠNG (NETWORK) - CONTROL PLANE]]
 4. [[TẦNG LIÊN KẾT DỮ LIỆU VÀ MẠNG LAN - LINK LAYER]]
 5. TẦNG VẬT LÝ


*Ngoài ra, còn có 7 tầng OSI*