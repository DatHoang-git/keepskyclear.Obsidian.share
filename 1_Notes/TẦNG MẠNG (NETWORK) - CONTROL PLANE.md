---
created: 2026-05-22
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Mạng máy tính - INT2213]]"
---
---
\src:
[[Chapter_5_v8.2.pdf]]

# Tổng quan về Mặt phẳng điều khiển (Control Plane)
![[Chapter_5_v8.2.pdf#page=7&rect=60,104,786,476|Chapter_5_v8.2, p.7]]
2 cách tiếp cận chính:
- Xử lý TRÊN router *(truyền thống)*
- Xử lý TẬP TRUNG *(software defined networking)*
# Các giao thức định tuyến (Routing Protocols)
>[!objective]
>Xác định ĐƯỜNG ĐI TỐT từ bên gửi đến bên nhận. "TỐT" là thế nào?
>- Chi phí ít nhát
>- Nhanh nhất
>- Ít tắc nghẽn nhất

Để MÔ HÌNH HÓA được bài toán, ta biểu diễn dưới dạng ***đồ thị có trọng số***
Ta phân loại thuật toán theo mức độ thông tin *(toàn cục / phân tán)*
![[TẦNG MẠNG (NETWORK) - CONTROL PLANE 2026-06-17 16.35.35.excalidraw|700]]
**Phân loại thuật toán:** Phân chia theo mức độ thông tin (Toàn cục vs. Phân tán) và tốc độ thay đổi (Tĩnh vs. Động).

### Thuật toán Trạng thái liên kết (Link State - Thuật toán Dijkstra)
Mô hình hóa cái ***topology của mạng thành graph***
Mọi node có ***thông tin như nhau***
Biết được thông tin link bằng cách ***[[TẦNG MẠNG (NETWORK) - CONTROL PLANE#^97a9d4|link state broadcasting]]***

Thuật toán này đã được học trong môn DSA
![[TẦNG MẠNG (NETWORK) - CONTROL PLANE 2026-06-17 16.42.04.excalidraw|800]]
Độ phức tạp thuật toán: Với $n$ nodes
$$
O(n^2)
$$
Độ phức tạp tốt nhất $O(n\log{n})$

> *Thuật toán này thì hay đấy, nhưng **làm thế nào để dựng graph** thì mới là vấn đề.*

Để *biết được* cái trọng số của đường đi thì router phải ***broadcast*** cái trạng thái của nó cho ***n routers*** còn lại trong mạng. 
Quá trình ***broadcasting*** cho ***mỗi*** router tốn $O(n)$ => Tổng số "bản tin" truyền trong mạng là  ^97a9d4
$$
n \times O(n) = O(n^2)
$$
> *Không chỉ có trở ngại về độ phức tạp thuật toán mà còn trở ngại về vấn đề [[TẦNG MẠNG (NETWORK) - CONTROL PLANE#Vấn đề dao động tuyến đường trong việc áp dụng Dijikstra vào "đồ thị Router"|giao động tuyến đường]] khi xây dựng đồ thị*

###### ***Vấn đề dao động tuyến đường trong việc áp dụng Dijikstra vào "đồ thị Router"***
Vì vốn mạng là một ***thực thể ĐỘNG***, do đó các trọng số của đường đi ***luôn luôn có sự thay đổi***
=> Điều này dẫn đến thuật toán bị ***confused do thay đổi trọng số***. Mỗi lần thay đổi lại phải ***tính toán lại*** tuyến đường ===> Gây ra VÒNG LẶP VÔ TẬN *([[Chapter_5_v8.2.pdf#page=29&rect=18,101,828,504|ping pong]])*

>*Sai lầm gây ra điều này do áp dụng LƯU LƯỢNG làm trọng số (cái mà luôn thay đổi)*
>*Nếu muốn thực sự áp dụng thì phải sử dụng các biến TĨNH (e.g. BĂNG THÔNG)*

### Thuật toán Distance Vector - *Vector khoảng cách*
Distance Vector là chính là thuật toán *Bellman-Ford* được *áp dụng* trong mạng. Phương trình:
$$d_x(y) = \min_v \{c(x,v) + d_v(y)\}$$
Trong đó:
- $d_{x}(y)$: "Distance" từ $x$ -> $y$
- $v$: Bất kì router LÁNG GIỀNG nào nối trực tiếp với $x$
- $c(x, v)$: Chi phí đi từ $x$ tới $v$
- $d_{v}(y)$: KC từ $v$ tới $y$

Tóm lại thuật toán này nó hoạt động như sau:
Các khoảng cách từ $x\to y, d_{x}(y)$ là một VECTOR, còn $c(x,v)$ là SCALAR *(số bth)*. Theo các bước như sau:

| Bước                                                                                                      | Minh họa                                  |
| --------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| 1. Khởi tạo vector tại các node<br>	- Nếu là hàng xóm, điền trọng số đó vào<br>	- Nếu ko, thì là $\infty$ | ![[Pasted image 20260617202737.png]]      |
| 2. Tính toán với các vector của node hàng xóm với trọng số đường đi đi tới node đó                        | ![[Pasted image 20260617203231.png\|200]] |
| 3. Từ kết quả trên, ***CẬP NHẬT*** vector node hiện tại bằng cái công thức min                            | ![[Pasted image 20260617203228.png]]      |

>là có bao nhiêu kết nối (hàng xóm) thì có bấy nhiêu cái phải lấy min! ví dụ có 4 kết nối thì có 5 phần tử phải lấy min

> Áp dụng với ***toàn bộ các node***:![[TẦNG MẠNG (NETWORK) - CONTROL PLANE 2026-06-17 20.34.12.excalidraw]]

Nhược điểm: Phụ thuộc vào góc nhìn CỤC BỘ, "định tuyến theo lời đồn"
> Đại khái là đi từ A->B->C bình thường thì rất rẻ
> Xong đùng một cái kết nối từ A->B hỏng, đội chi phí lên
> Xong thuật toán lại thấy đi một đường nào đó khác tới C lúc đó lại ngon hơn, bỏ mất đường B
> Nhưng thực chất đường đi tới C qua node khác đã là ***từ quá khứ*** rồi! Nó không còn đúng với hiện tại nữa!
> 
> *Đó là "lời đồn"*

| **Tiêu chí phân tích**             | **Link State (Dijkstra)**                                                                                                                               | **Distance Vector (Bellman-Ford)**                                                                                                                                                                  |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Độ phức tạp thông điệp**         | Lớn. Phải gửi $O(n^2)$ tin nhắn phát sóng (broadcast) cho toàn bộ $n$ routers trong mạng.                                                               | Nhỏ. Chỉ trao đổi thông tin cục bộ với láng giềng sát vách.                                                                                                                                         |
| **Tốc độ hội tụ**                  | Nhanh ($O(n^2)$ thời gian). Tuy nhiên, có thể bị **dao động định tuyến** (oscillations) như tôi đã giải thích ở hình trước.                             | Chậm và biến thiên. Mắc kẹt trong các vòng lặp (routing loops) và thảm họa **đếm đến vô cực**.                                                                                                      |
| **Độ chống chịu lỗi (Robustness)** | **Mạnh mẽ.** Nếu một router bị lỗi/hack, nó chỉ phát sai thông tin của chính đoạn cáp nối với nó. Mỗi router tự cầm bản đồ tự tính toán, lỗi bị cô lập. | **Mong manh.** Nếu một router bị lỗi và quảng cáo dối trá: _"Tôi có đường rẻ nhất đến mọi nơi"_, toàn bộ mạng sẽ mù quáng tin theo và đẩy dữ liệu về hố đen (black-holing). Lỗi lây lan dây chuyền. |
# Định tuyến nội bộ / nội miền trong ISP (Intra-ISP Routing: OSPF)
Nếu coi internet như một *đồ thị phẳng*, nơi mọi router bằng nhau -> Bủng nổ quy mô, và mất sự tự quản trị
Vì vậy mà người ta mới thiết kế ra mô hình ***mạng của các mạng***
Nhét mỗi cái *"miền quản lý"* đó vào trong một [[TẦNG MẠNG (NETWORK) - CONTROL PLANE#AS - Autonomous System (Hệ thống tự trị)|Hệ thống tự trị]]
### AS - Autonomous System *(Hệ thống tự trị)*
Người ta gom hàng nghìn router thuộc quyền quản lý và sở hữu của một tổ chức duy nhất (như một nhà mạng ISP, hoặc các tập đoàn công nghệ lớn như Google, Microsoft) vào một khu vực khép kín gọi là **Hệ thống tự trị**

### Định tuyến trong ISP *(Intra-AS Routing)*
Định tuyến này có mục đích phải *cho tất cả các router trong AS của A* biết được từ A có thể đi được đến đâu

Ta sử dụng các thuật toán:
- ***RIP*** *- Routing Information Protocol* *(Sử dụng [[TẦNG MẠNG (NETWORK) - CONTROL PLANE#Thuật toán Distance Vector - Vector khoảng cách|DV]])*
- ***EIGRP*** - *Enhanced Interior Gateway Routing Protocol* *(Sử dụng [[TẦNG MẠNG (NETWORK) - CONTROL PLANE#Thuật toán Distance Vector - Vector khoảng cách|DV]])*
- ***OSPF*** - *Open Shortest Path First* *(Sử dụng [[TẦNG MẠNG (NETWORK) - CONTROL PLANE#Thuật toán Trạng thái liên kết (Link State - Thuật toán Dijkstra)|link state]])*


##### OSPF - Open Shortest Path First
> *Biết được một người sẽ biết được cái vòng tròn xã hội của người đó như nào*

![[Chapter_5_v8.2.pdf#page=59&rect=27,82,828,446|Chapter_5_v8.2, p.59]]
***Bước 1: Kết bạn*** - Gửi các gói tin broadcast để tìm kiếm hàng xóm. Tìm xong sẽ set bộ tham số chung để **thiết lập quan hệ láng giềng - Adjacency**
***Bước 2: Trao đổi*** - Mỗi router chỉ tạo bản tin nhỏ là **LSA**, kêu **nhà tao ở gần những ai**, lan truyền ra tất rồi lưu vào một kho ***LSDB (Link State Database)***
***Bước 3: Tính toán*** - Sử dụng Dijisktra để tính

# Định tuyến giữa các ISP - Định tuyến ngoại miền 
Được xem là "chất keo gắn kết Internet", giúp các AS quảng bá sự tồn tại và khả năng tiếp cận của chúng.

### BGP - Border Gateway Protocol
![[TẦNG MẠNG (NETWORK) - CONTROL PLANE 2026-06-17 21.28.24.excalidraw|700]]
- **Cơ chế hoạt động:** Sử dụng eBGP (lấy thông tin từ AS hàng xóm) và iBGP (truyền thông tin nội bộ trong AS).

>[!important] Hình dung nó như là ***CỬA KHẨU***
>Tất cả gói tin muốn ra khỏi đất VN phải đi qua các *cửa khẩu khác nhau*, **tùy nơi nó muốn**
>Cửa khẩu đó là một thằng *router đại diện* cho tất cả thằng còn lại. Muốn tiếp bọn bên trong phải *đi qua xác thằng cửa khẩu* đã

>Ngoài ra, ở trong bảng forwarding ở mỗi router còn có cả địa chỉ nước ngoài!!! Nhưng nó được forward đến cửa khẩu xyz gì đó để xử lý!!
>
>=> Nghĩa là bản thân trong forwarding tablet trong các router nó đã chứa thông tin để đi tới Mỹ, Ba Lan, Úc thì phải đi cửa khẩu X, Y, Z rồi!!
>***Rất Inter-ISP mà rất Intra-ISP***



##### Các bản tin BGP
**OPEN:** Mở kết nối TCP tới các BGP đồng trang lứa
**UPDATE:** QUẢNG BÁ đường đi mới
**KEEPALIVE**: Giữ kết nối khi chưa được UPDATE, ACK những request OPEN
**NOTIFICATION**: BÁO LỖI, và cũng dùng để đóng kết nối


- **Các thuộc tính đường đi (Path Attributes):** Giới thiệu AS-PATH và NEXT-HOP.
- **Chiến lược và Chính sách định tuyến:**
    - Định tuyến Hot potato (Hot potato routing): Chọn cổng cục bộ có chi phí nội bộ thấp nhất mà không quan tâm đến chi phí liên miền.
    - Định tuyến dựa trên chính sách (Policy-based routing): Cách các ISP quyết định quảng bá đường đi để tránh trở thành tuyến trung chuyển (transit) không mong muốn.
# Internet Control Message Protocol (ICMP)
DÙNG ĐỂ BÁO CÁO SỰ CỐ


- **Tổng quan:** Giao thức được máy chủ và router sử dụng để giao tiếp các thông tin cấp mạng (chủ yếu là báo lỗi mạng, host, cổng). 
- **Ứng dụng thực tiễn:** Cách ICMP hoạt động đằng sau lệnh `ping` (echo request/reply) và `traceroute` (dựa trên việc thao tác với TTL).