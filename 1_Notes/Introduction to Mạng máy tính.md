---
created: 2026-02-25
tags:
  - lecture_note
category: "[[Class]]"
subject:
  - "[[Class. Mạng máy tính - INT2213]]"
---
---
Mạng được định tuyến bằng ***cấu trúc CÂY***
SĐT cũng được định tuyến bằng cây

Một mạng máy tính tốt được tổ chức để có thể ***sustainable*** - tránh một "single failure point", không để phụ thuộc quá nhiều vào một node *(nếu có thì sẽ gây ra outage hàng loạt)*

-> Kết nối mạng mesh 

Connected component

![[Introduction to Mạng máy tính .excalidraw]]
Internet là mạng của các mạng

Protocols là cách nó giao tiếp với nhau 

Chuẩn internet:
- RFC: Request for comments
- IETF: Internet Engineering Task Force 
-> Rất mở, ai cũng có thể tham gia

==Trên cùng một cáp quang, phân chia các request như thế nào?==
![[Chapter_1_Introduction to Computer Network.pdf#page=14&rect=97,25,838,447|Chapter_1_Introduction to Computer Network, p.14]]

![[Chapter_1_Introduction to Computer Network.pdf#page=34&rect=52,7,940,444|Chapter_1_Introduction to Computer Network, p.34]]

![[Chapter_1_Introduction to Computer Network.pdf#page=32&rect=124,224,865,450|Chapter_1_Introduction to Computer Network, p.32]]

- Chia tần số - Nhanh / Chậm theo nhu cầu của từng gói tin
- Chia theo thời gian: Các gói tin xếp hàng để được kết nối

## <mark class="hltr-yellow">Understanding the internet</mark>
Internet is built on cooperation and rules
![[Full Stack for Front-End Engineers, v3.pdf#page=8&rect=46,114,541,406|Full Stack for Front-End Engineers, v3, p.8]]

Chia làm 3 thành phần:
![[Pasted image 20260227180207.png|500]]

- Access network - aka client

==Server==
- serve content + respond to requests 
- using specialized hardware (for handling large amount of request) 
- 100% availability (to other devices) 
- chạy server trên lap cá nhân có bị làm sao không? (thì gập laptop server sập chứ sao -.-

![[Chapter_1_Introduction to Computer Network.pdf#page=10&rect=50,31,929,434|Chapter_1_Introduction to Computer Network, p.10]]
Network edge - aka "Thiết bị đầu cuối" - aka serves, provider

==Packet transmission time accumulation==
$t_P  + L/R$
- $t_P$: Thời gian để truyền hết 1 gói
- $L$: Kích thước gói tin (bits) 
- $R$: Tranmission rate (tốc độ truyền)


<mark class="hltr-blue">Terminology</mark>


ISP: Nhà cung cấp mạng? 
Internet: a network of networks
intranet: private network
IP: internet protocol
![[Pasted image 20260119093109.png]]
- TCP - *Transmission Control Protocol*: Một protocol để giao tiếp mạng. Kiểu bro tôi gửi file cho ông (server), ông có nhận được không thì bảo tôi (thiếu chỗ nào để tôi gửi lại (ACK stands for acknowledge)). *Chậm hơn nhưng reliable* 
	(HANDSHAKE là điểm khác biệt - aka có sự giao tiếp)
- UDP - *User Datagram Protocol*: Kiểu tao ném này, mày bắt nhé, ném tùm lum kiểu gì mà chả hết ~~ (thường dùng trong streaming videos, các thứ cần phải nhanh, nhiều frame, realtime) 
- ICMP: internet control message protocol. Chir check server, kiểu điều hành check xem mọi thứ còn sống k (ping of death - ping cho đến chết, server k thể nhận thêm request nữa (or DDOs))
- Packet: unit of data transmitted over a network
- DNS: domain name system, cái chuyên map các ip với các domain
	![[Pasted image 20260119094521.png]]
- DNS records:
	- A record: maps name to IP
	- CNAME: maps name to name
- URL: uniform resource locator 
	![[Pasted image 20260119094928.png]]
	
