---
created: 2026-04-17
tags:
  - summarized
  - excalidraw
category:
  - "[[Class]]"
subject:
  - "[[Class. Mạng máy tính - INT2213]]"
project:
  - "[[Ôn thi giữa kì II năm 2026]]"
---
---
/src:
[[Week 7 - Chương 3 TCP ở tầng giao vận 2026-04-10 17.07.14.excalidraw]]
[[Week 6 - Chương 3 - Tầng giao vận 2026-04-03 18.00.25.excalidraw]]
[[Chapter_3_v8.2.pdf]]
[[Tầng giao vận 2026-04-17 13.50.25.excalidraw]]
[[Nguyên lý truyền tin tin cậy]]

- Cung cấp dịch vụ giao tiếp giữa các tiến trình chạy ở khác host khác nhau
- Cụ thể: 
	- Người gửi: Chặt message của [[TẦNG ỨNG DỤNG]] ra thành các ***segments***, để truyền xuống [[TẦNG MẠNG (NETWORK) - DATA PLANE|tầng mạng]]
	- Người nhận: Gom các segments thành các *messages - thông điệp* rồi truyền lên [[TẦNG ỨNG DỤNG]]
- Hai giao thức chính: [[TẦNG GIAO VẬN#TCP|TCP]] và [[TẦNG GIAO VẬN#UDP|UDP]]  
![[3_Assets/Tầng giao vận 2026-04-17 13.50.25.excalidraw.md#^frame=A7NYZnnI|100%]]

# Các dịch vụ tầng giao vận
## Phân kênh / Dồn kênh 
### Dồn kênh - *Bên gửi*
![[3_Assets/Tầng giao vận 2026-04-17 13.50.25.excalidraw.md#^frame=02|100%]]
- Phân kênh nhận đầu vào là các gói messages nhả ra từ [[TẦNG ỨNG DỤNG#Socket|Socket]] từ tầng [[TẦNG ỨNG DỤNG]]
- Với mỗi *messages*, bộ ***Phân kênh*** chặt ra thành các ***segments***. Mỗi ***segments*** được gắn kèm thông tin `[src port | dest port]`
- Chặt xong rồi thì cho nó xếp hàng và gộp vào ***một kênh duy nhất***
### Phân kênh - *Bên nhận*
![[3_Assets/Tầng giao vận 2026-04-17 13.50.25.excalidraw.md#^frame=03|100%]]
- Sau khi truyền xong, đến bên nhận
- Với mỗi gói tin ***segments*** *(cái mà đã đc gắn `[src port | dest port]` ở bước trên)*. 
- Bộ phân kênh sẽ tra cứu và gửi về đúng `[dest port]` mà ***segment*** đã ghi

***Lưu ý***:
- UDP dùng 2-tuple: `[src port | dest port]`
- TCP dùng 4-tuple: `[src port | src IP | dest port | dest IP]`
*Lí do như trong hình*

***Xử lý khi bị trùng src port | dest port khi gửi từ các máy tính khác nhau***:
>Chỉ áp dụng cho TCP

 Với mỗi IP cấp cho một socket ***clone*** riêng biệt *(cùng số hiệu với port original)*, ủy quyền để nhận cho cái port original ^8a4030

>[!important] *Cơ chế phân kênh / dồn kênh được dùng trong **[[TỔNG QUAN VỀ MẠNG MÁY TÍNH#Các tầng giao thức mạng|gần như tất cả các tầng]]** trong mô hình mạng, chỉ là thay đổi ở cái header*
> |  Các tầng  |  Cơ chế Mux/Demux   |
> | --- | --- |
> |   Physical  |  FDM, TDM, WDM   |
> | [[TẦNG MẠNG (NETWORK) - DATA PLANE]] | Địa chỉ IP |
> | [[TẦNG LIÊN KẾT DỮ LIỆU VÀ MẠNG LAN - LINK LAYER]] | Địa chỉ MAC |
> | [[TẦNG GIAO VẬN]] | Port |

## Truyền tin tin cậy
![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=U33NN4De|100%]]
> *Làm sao để truyền tin tin cậy? Có những ý tưởng là gì?*
> - (Option 1) Tạo một kênh tin cậy, cái đường ống siêu xịn mà pass cái gì qua đó là yên tâm luôn *(nâng cấp tầng bên dưới)*
> - (Option 2)  Sử dụng **giao thức** để xử lí ở 2 đầu, nhằm đảm bảo tính tin cậy. Đường ống ở giữa cùi bắp
>   
>   *Nên chọn option nào?*
>   Ta luôn muốn ứng dụng cái Option 1, nhưng mà ko có cái gì thần kì như thế, nếu có thì phải **rất tốn kém**, phải cài đặt bằng Option 2 - Nguyên lý End-to-End
>   
>   Giao thức đó là ***rdt - reliable data transfer*** protocol

Các giao diện:
- **Bên gửi**: `rdt_send() --> udt_send()`
- **Bên nhận**: `rdt_rcv() --> deliver_data()`
Xem cụ thể: [[Chapter_3_v8.2.pdf#page=44&rect=30,72,815,446|Chapter_3_v8.2, p.44]]
### rdt 1.0 - *Đường truyền hoàn hảo*
![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=02|100%]]
- **Sender** cứ việc gửi, **Receiver** cứ việc nhận
- Không phản hồi hay giao tiếp j với nhau cả

### rdt 2.0 - *Sai lệch bit, KHÔNG mất gói*
Công cụ sử dụng: ==*Checksum* và ***ACK/NAK***==
- *Checksum* để xác định lỗi bit
- Để báo được cái lỗi đó, dùng 2 tín hiệu đặc biệt:
  *"Tao nhận được rồi! OK ko bị lỗi nhé!* - **ACK**
  *"Gói tin hỏng rồi! Bị lỗi nhé!!!"* - **NAK**
![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=03|100%]]
Hoạt động như sau:
- **Sender** gửi
- **Receiver** nhận được gói tin:
	- Tính *Checksum* thấy ok --> Gửi **ACK**
	- Tính *Checksum* thấy KHÔNG ok --> **NAK** --> **Sender** gửi lại gói tin

***Điểm yếu chí mạng:*** Hoạt động theo cơ chế ***Stop-and-wait*** 
Sender gửi xong phải **chờ** phản hồi ACK/NAK
Sender nhận được gói tin ACK/NACK bị lỗi
Sender không biết cái đấy là cái gì :v *(gói ACK/NAK)* --> ***Gửi lại*** --> Trùng gói tin
Ta giải quyết bằng [[TẦNG GIAO VẬN#rdt 2.1, 2.2|rdt 2.1, 2.2]]
#### rdt 2.1
> Sinh ra vì "*lỡ ACK/NAK cũng bị lỗi thì sao?*"
![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=04|100%]]

Y hệt [[TẦNG GIAO VẬN#rdt 2.0 - Sai lệch bit, KHÔNG mất gói|rdt 2.0]], nhưng gửi kèm ***sequence number*** *(0 và 1)* cùng data để ***tránh trùng lặp*** gây ra bởi cơ chế gửi lại:
- TH bình thường: Gửi xen kẽ bit 0 và 1 cùng với data
- TH lỗi: Bên **Receiver** có lưu trạng thái hiện tại của gói tin. 
  Nếu gói tin đến mang **seq number** mà **khác** với gói đang đợi --> **không cho truyền lên application**, gửi lại ACK

#### rdt 2.2
> Cũng như rdt 2.1 nhưng bỏ gói NAK
> Thế chỗ cái đó bằng ACK + seq number

ok, TH bình thường là 
sender : data 0
rcver: nhận ok, ack 0
sender : data 1
rcver: nhận ok, ack 1


không bình thường (data lỗi)
sender: data, 0
rcver: data lỗi, gửi lại ack 1
sender: ơ dm, đang chờ ack 0 cơ mà (coi như là nak). gửi lại data, 0
rcver: data ok, gửi ack 0 

không bình thường (ack lỗi)
sender: data, 0
rcver: data ok, gửi lại ack 0
sender: ??? cái tín hiệu gì đây, gửi lại data 0
rcver: data ok, check trạng thái đang chờ data 1 mà data 0 đến -> gửi lại ACK 0 + ko truyền data 0 lên

### rdt 3.0 - *Mất gói*
Công cụ sử dụng: *==Timer==*
![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=05|100%]]
*Kế thừa từ [[TẦNG GIAO VẬN#rdt 2.2|rdt 2.2]]  - Ko dùng NAK, sài seq number...*
Mất gói tin, vì chờ mãi ko đến, ta phải có bộ hẹn giờ ***Timer*** để kiểm soát:
- Mỗi lần gửi thì bấm giờ
- Quá giờ thì gửi lại, bấm lại giờ

| TH                | Img                                                                                                                                                                            |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| ***Mất data***    | ![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=06\|100%]]<br>Hết thời gian timeout thì gửi lại                                                                             |
| ***Mất ACK***     | ![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=07\|100%]]<br>Hết thời gian timeout thì gửi lại                                                                             |
| ***Timeout sớm*** | ![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=08\|100%]]<br><br>Cả 2 đều lưu trạng thái cái thằng mà nó đang **ngóng** --> Check được cái nào trùng cái nào không<br><br> |
> *rdt 3.0 có cái khác là nó xảy ra trùng lặp ở cả bên gửi và bên nhận
> còn rdt 1.0 và 2.0 chỉ có ở bên nhận*

### Cơ chế truyền tin Pipeline - *Nâng cao hiệu năng*
> *Làm sao để tối ưu khả năng sử dụng mạng (ultilization)?* 
> Tính bằng CT:
$$
U_{sender} = \frac{L/R}{RTT + L/R}
$$

Đây là thời gian mà bên gửi bận gửi
![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=09|100%]]
Ta sử dụng cơ chế Pipelining - Gửi đi nhiều gói tin cùng một lúc

##### Go-Back-N
![[3_Assets/Nguyên lý truyền tin tin cậy.md#^frame=10|100%]]
Trong hàng đợi các gói tin cbi gửi đi, ta chọn ra một ***cửa sổ N*** các segment sẽ được gửi vào pipeline *(N là số lượng segment liên tiếp gửi đi mà chưa nhận được ACK)*  ^283249

- Sử dụng ***ACK tích lũy*** - ACK để ứng với từng thằng trong cái window đó *(số lượng ACK = N)* ^05e3b3
- Chỉ dùng ==**MỘT TIMER**== duy nhất, tính từ gói tin CŨ NHẤT chưa nhận ACK

![[TẦNG GIAO VẬN 2026-06-15 12.14.34.excalidraw]]

>[!important] Chỉ cần 1 gói bị lỗi, GỬI LẠI TOÀN BỘ những gói sau KỂ TỪ NÓ
>Khá là tốn thời gian, nên ta có pp mới là [[TẦNG GIAO VẬN#Selective Repeat|selective repeat]]
##### Selective Repeat
> Khác ở GBN, mỗi gói tin lại có *==MỘT TIMER RIÊNG BIỆT==*

Mỗi lần ACK --> Tắt timer
Nếu bị rớt --> Nổ timer --> **CHỈ GỬI LẠI GÓI BỊ NỔ**

![[Chapter_3_v8.2.pdf#page=76&rect=154,100,769,460|Chapter_3_v8.2, p.76]]

## Kiểm soát luồng *(Flow Control)*
Xử lý làm sao khi data trào đến quá nhanh mà host không xử lý kịp? --> Xử lý để giảm tải cho host
Giải pháp: Gắn một cái ***buffer*** vào trước socket, gọi là ***TCP socket receiver buffers***, quá buffer thì bỏ
![[TẦNG GIAO VẬN 2026-06-15 17.27.08.excalidraw|800]]
***Các biến kiểm soát buffer:***
- `RcvBuffer`: Tổng độ lớn buffer
- `rwnd`: limit tối đa data nhận vào mà chưa ACK *(aka vùng trống còn lại)*

>[!important] Lưu ý
>Tuy mục đích đẻ ra buffer là để tránh quá tải, nhưng đồng thời, nó cũng NGĂN VIỆC QUÁ TẢI luôn *(đảm bảo KHÔNG BAO GIỜ bị tràn bể)*. Ta làm điều đó qua biến `rwnd`:
>- `rwnd` lớn: Sender đẩy đi thoải mái
>- `rwnd` nhỏ: Sender vặn nhỏ vòi
>- `rwnd` $\approx$ 0: Khóa van
## Kiểm soát tắc nghẽn - *Congestion control*
> *Nhiều người gửi đi cùng một lúc, cửa thì bé mà người chen vào thì đông -> Tắc nghẽn*

### Tắc nghẽn từ đâu mà tới? 
Thông lượng vào và ra ta kí hiệu là $\lambda_{in}$ và $\lambda_{out}$
Lý tưởng:  $\lambda_{in}$ =  $\lambda_{out}$ - Truyền ra bao nhiêu nhận về bấy nhiêu
1. ***Giới hạn vật lý*** của băng thông *(tràn buffer rồi thì ko gửi được nữa)*
2. Khi buffer tràn, phải tốn ***gửi lại***
3. Mạng thực chất không rớt, nó chỉ ***delay***
4. Trong môi trường định tuyến nhiều trạm, ***rớt ở một chỗ*** là đi tong công sức
==> Phải có cơ chế *=="rà phanh"==*, 

> Tránh bế tắc bằng các ***biết thêm thông tin*** về đường đi, chỗ nào đang nghẽn --> Tránh nó ra *(giống cái **ý tưởng** của [[Quản lý Tiến trình (Processing)#Tránh bế tắc|tránh bế tắc]] của môn OS*)
> 	Xem ở [[Chapter_3_v8.2.pdf#page=120&rect=68,80,812,514|Chapter_3_v8.2, p.120]], [[Chapter_3_v8.2.pdf#page=119&rect=61,169,805,495|Chapter_3_v8.2, p.119]]
> Đấy là các cơ chế hiện đại thì người ta làm thế, nhưng trong phạm vi môn này sẽ chủ yếu thi vào cái dưới đây



# Hai giao thức được sử dụng 
## UDP
![[3_Assets/Tầng giao vận 2026-04-17 13.50.25.excalidraw.md#^frame=04|100%]]
- Phương thức *siêu tối giản*
- "Cố gắng hết sức" để truyền đi, nhưng sai hoặc mất thì cũng chịu *(vì cố hết sức r mà :) )*
- Không kiểm soát tắc nghẽn, không thiết lập kết nối, không trạng thái kết nối
- Có kiểm tra lỗi gói tin bằng cơ chế [[TẦNG GIAO VẬN#UDP Checksum|checksum]] cơ bản
=> Siêu gọn nhẹ, tối giản => Mục đích: ***Tốc độ***

***Các dịch vụ sử dụng UDP***
- Video streaming, video games, calls...
- [[TẦNG ỨNG DỤNG#DNS - Domain Name System|DNS]]
- SNMP
- [[TẦNG ỨNG DỤNG#Web/HTTP|HTTP]]/3

#### Cấu trúc segment của UDP
![[3_Assets/Tầng giao vận 2026-04-17 13.50.25.excalidraw.md#^frame=06|100%]]

#### UDP Checksum
![[3_Assets/Tầng giao vận 2026-04-17 13.50.25.excalidraw.md#^frame=05|100%]]
Là một ***đoạn mã*** để ***kiểm tra lỗi*** của gói tin
Hoạt động như sau:
- **Bên gửi**: 
  Chặt segment *(data)* *(là dãy nhị phân)* thành các đoạn dài 16 bit
  Cộng hết chúng vào nhau, *nếu dôi ra bit nào thì cộng ngược lại bit đó*
- **Bên nhận**: 
  Cũng cộng toàn bộ gói được nhận lại thành chuỗi 16 bit *(data + checksum bên gửi)*
  Nếu ra dãy toàn 1 => Gói tin toàn vẹn *(do một số + bù 1 của nó = 1111...1)*

## TCP
Là phương thức:
- Kết nối ***một-một***
- [[TẦNG GIAO VẬN#Truyền tin tin cậy|Truyền tin tin cậy]]
- Truyền tin 2 chiều trong cùng 1 kết nối
- [[TẦNG GIAO VẬN#^05e3b3|ACK tích lũy]]
- Cơ chế [[TẦNG GIAO VẬN#Cơ chế truyền tin Pipeline - Nâng cao hiệu năng|Pipelining]]
- Connection-oriented: Hanshaking, khởi đầu bởi sender
- Kiểm soát luồng ([[TẦNG GIAO VẬN#Kiểm soát luồng (Flow Control)|flow control]])
- ***KHÔNG BẢO TỒN RANH GIỚI*** thông điệp, TCP coi data như là một luồng bytes *(no message boundary)*
### Header TCP
![[Chapter_3_v8.2.pdf#page=81&rect=19,81,814,461|Chapter_3_v8.2, p.81]]
Trong đó:
- Receive window: Là cơ chế để [[TẦNG GIAO VẬN#Kiểm soát luồng (Flow Control)|điều khiển luồng]], là số bytes tối đa mà cửa sổ có thể nhận, một vùng buffer
- Length: Độ dài của TCP header

### [[TẦNG GIAO VẬN#Truyền tin tin cậy|Truyền tin tin cậy]] trong TCP
![[TẦNG GIAO VẬN 2026-06-15 16.02.26.excalidraw|800]]
Như truyền tin tin cậy như ở rdt 3.0, nhưng cái khác là TCP coi người gửi và người nhận ***có vai trò như nhau***. có
Vậy nên để tiết kiệm băng thông, một lần gửi có thể:
- Yêu cầu dữ liệu gửi data tiếp theo *(seq number)*
- ACK để phản hồi lại data đó *(ACK number)*

**Người nhận**: Nếu thành công, dội về `ACK = Seq hiện tại + Số lượng byte vừa nhận` để báo chính xác vị trí index của **byte tiếp theo mà nó đang ngóng**

#### Tính toán trong TCP
>*Làm sao tính được RTT?*

Sử dụng RTT ước tính vào biểu đồ
$$
EstimatedRTT = \alpha \times SampleRTT + (1-\alpha) \times Estimated RTT
$$
Trong đó: *(hàm nay như **hàm cập nhật** giá trị RTT **theo thời gian thực***
- $EstimatedRTT$: Giá trị hiện tại
- $SampleRTT$: Giá trị tại thời điểm $t$ trả về (RTT thực tế đo được)
- $\alpha$: Hyperparam, trọng số cho việc cập nhật (EWMA) (hay bằng 0.125)

>*Làm sao biết được thời gian timeout?*
$$
TimeoutInterval = EstimatedRTT + 4*DevRTT
$$


#### Các kịch bản truyền tin trong TCP
![[TẦNG GIAO VẬN 2026-06-15 16.41.14.excalidraw|800]]
TCP fast retransmit
![[Chapter_3_v8.2.pdf#page=91&rect=62,86,748,463|Chapter_3_v8.2, p.91]]

### Kiểm soát luồng trong TCP
Xem phần [[TẦNG GIAO VẬN#Kiểm soát luồng (Flow Control)|Kiểm soát luồng]] ở trên
### Thiết lập kết nối *(TCP Handshake)*
#### 2-way handshake
![[TẦNG GIAO VẬN 2026-06-15 17.39.52.excalidraw|800]]
Say Hello, mình gửi data cho nhau nhé
Rep OK

Vấn đề xảy ra khi "Hello" về muộn xảy ra timeout, gửi lại nhưng kết nối lại đóng hết rồi *(xem trên hình)*
#### 3-way handshake
![[TẦNG GIAO VẬN 2026-06-15 17.41.41.excalidraw|800]]
Để tránh điểm yếu trên, phía Rcver hỏi lại lần nữa cho chắc ăn:
- **Sender** gửi **seq=x**, gửi thông điệp muốn kết nối. Gửi kèm ***SYNbit*** để biết rằng mục đích gói này là để bắt tay. Gửi xong nhớ lại rằng "mình đã lưu rồi" bằng state **SYNSENT**
- **Rcver** nhận được thì bật state **SYN RCVD**, rep lại với **ACK = x  + 1** và yc **seq = y**
- **Sender** nhận được từ **Rcver**, phản hồi đã nhận được nên rep lại với **ACK = y + 1**.
>*Tại sao có ACKbit rồi còn có ACKnum?*
>Vì ở lần gửi đầu tiên, có biết cái gì đâu mà ACK *(vì đã nhận cái gì đâu?)*. Khi nhận rồi thì mới lật *ACKbit* lên. ACKbit là 1 bit nằm trong các control bits ở header [[TẦNG GIAO VẬN#Header TCP|header]]

### Kiểm soát tắc nghẽn cho TCP bằng AIMD
![[Chapter_3_v8.2.pdf#page=122&rect=85,56,806,391|Chapter_3_v8.2, p.122]]
>*Khi áp dụng vào TCP, biểu đồ này có trục x là `RTT`, còn trục y là `cwnd`*

Vận hành theo cơ chế ***"Tăng cộng, Giảm nhân"***:
- "Tăng cộng": Tăng cái rate **lên 1 MSS** cho đến khi phát hiện lỗi
- "Giảm nhân":  Giảm cái rate **xuống nửa** cho mỗi lần bị loss

Ý tưởng là vậy, nhưng triển khai sang TCP như nào? 
Chia ra 2 loại lỗi tương ứng mức độ nghiêm trọng
- Loại 1: Nhận được 3 ACKs trùng lặp - Giảm 1 nửa ***(TCP Reno)***
- Loại 2: Bị timeout - Giảm về **1 MSS** khi phát hiện bị timeout ***(TCP Tahoe)***

> [!important] Đọc đến đây khá lú, đâu ra lắm loại cửa sổ thế?
> Cái cơ chế truyền [[TẦNG GIAO VẬN#Cơ chế truyền tin Pipeline - Nâng cao hiệu năng|pipelining]] chỉ là lý thuyết, áp dụng vào TCP thì nó thành 2 cái biến: 
> 1. `rwnd` - ***Cửa sổ nhận***: Là biến của buffer để [[TẦNG GIAO VẬN#Kiểm soát luồng trong TCP|kiểm soát luồng]], bảo vệ máy nhận
> 2. `cwnd` - ***Cửa sổ tắc nghẽn***: nằm trong phần [[TẦNG GIAO VẬN#Kiểm soát tắc nghẽn - Congestion control|kiểm soát tắc nghẽn]], bảo vệ đường truyền mạng. KHÔNG NẰM TRONG TCP HEADER, nó là tham số của hệ điều hành máy gửi 
>    
>Vậy tóm lại là chọn cái nào????? Cửa sổ của TCP là gì????
$$Actual\_Window = min(rwnd, cwnd)$$
> 

Đồ thị trên là đồ thị của biến `cwnd` *(congestion window)*, có đơn vị là MSS *(maximum segment size)* 

***Nhưng mà lúc đầu, cứ phải tăng tịnh tiến 1 lần thì hơi chậm, mình muốn tăng nhanh nó cơ để nhanh "hội tụ" đến sweet spot***
##### Cơ chế "Slow start" - *Nhưng thực ra rất nhanh*
- Tăng `cwnd` 2 lần ở khâu khởi động, khi nào vượt quá `ssthresh` thì tăng tịnh tiến như AIMD bình thường! 
![[Chapter_3_v8.2.pdf#page=126&rect=411,179,791,409|Chapter_3_v8.2, p.126]]

⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠ You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
%%
## Drawing
```compressed-json
N4KAkARALgngDgUwgLgAQQQDwMYEMA2AlgCYBOuA7hADTgQBuCpAzoQPYB2KqATLZMzYBXUtiRoIACyhQ4zZAHoFAc0JRJQgEYA6bGwC2CgF7N6hbEcK4OCtptbErHALRY8RMpWdx8Q1TdIEfARcZgRmBShcZQUebR4AVm0ABho6IIR9BA4oZm4AbQBdfghcODgAZSiocVRQMEh1TNqIImVpNIaGQgQKACFcbABrZVJhDmIAYTZ8NlJuCABiADNV

tc7IbBFAnIBJGv0qsaGEadn5iUWARgQbm42ILdIdqH3MgeHR8amZuYWocgcZhwXAvB5PF5vfQAMUI+HwVRgwQWgg84O22VeByObBOAHUSOoANIIGALLKOIT6dHPTFQnEnABqoKsmjhajJEj0QKiORpkOxANxCERyIkqJI/LpBwASsJ2hxwnk0Fd+JsMXsDgB5EHYDncK7JZJqx4arGZaGcKDQ3D6OGc1AAFhNEOlFqtFUIRlqPGN4HVtM1mQAKlg

oABBNpcCTBZZQKVBw5RUgR55sCiSELEbgcITwl1mqEAUQm4bTGazC1BYyoBcD5v0ZZrwfgLTGQgmCYb0PIWTlYtQufz/ogzGwY3hAA1uI6AOxxWeOgAcs9nAE4eGuAGwrhImscT/AATW4W63AGZtOeElueLffbPkuernwR0Y2AZuPUuvQCEJalc/oAL51gKmRyh2xCKswyroO2nYmqMJCet63C+ohpDITUcDcHuI5IcQACybDEAgJa4JowTZmgyw

EGEGEkGcfxoN+kB9DM1Fwcomi4AAFDwVyztQvCCcJAlCagyTaAkACUGyQDKCDKHmoILKQ3F8Tw57Grw2liXpknSXJwGgZiDIIDqUDsECOZ5vgJrLL2CCKRMTCEBwyhfv6kDZBRVHcAC/5qpsRA4WggUIMFEAcLatQRVFwhQEQioBaQQXeRA+igicpAAHKxal6UNJAWWkDl5GUQgnERSZI52AAVgg2C5BUMVwMRpEVf5NF0ZFI6DFZjDBh++BecV0

CtiiGTNdZ8mmswUAGC2iC2cO42zMMVWFX142OQYFTTVZnDcLR+D0Rl+ChBGM1DSNq34LVXSOMwfmnFaYaEdkQgnb1JpshM7nKAACoEyxMNkYgLL5lXZiahDMH07mOB5XVbT1Z07ZA8OESQcBsO5UCtWUcCA6j1VpZjECaGwmAHcEM2cB1LTclE7kQOAIF0MscLhF+QEgEBQA
```
%%
