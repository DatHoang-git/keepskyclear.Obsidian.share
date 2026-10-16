---
tags:
  - class
  - Kì_II
category: "[[Class]]"
Giảng viên:
  - "[[Đào Minh Thư]]"
  - "[[Nguyễn Hoài Sơn]]"
Mã LHP: INT2213
Điểm:
Số tín:
people:
---
---
```dataview
TABLE 
    created,
    category, 
    project, 
    tags
FROM "1_Notes"
WHERE contains(subject, this.file.link)
SORT created ASC, project ASC
```

[[Chapter_1_Introduction to Computer Network.pdf]]
[[Chapter_1_v8.2.pdf]]
[[Chapter_2_Application_Layer.pdf]]
[[Chapter_2_v8.2.pdf]]
[[Chapter_3_v8.2.pdf]]
[[Chapter_4_Network_Layer_Data_Plane.pdf]]
[[Chapter_4_v8.2.pdf]]
[[Chapter_5_Network_Layer_Control_Plane.pdf]]
[[Chapter_5_v8.2.pdf]]
[[Chapter_6_The Link Layer and LANs.pdf]]
[[Chapter_6_v8.2.pdf]]

Sách tham khảo:
 James Kurose, Keith Ross, "Computer Networking: A Top-Down Approach", Pearson, 2022
[[Computer-Networking_-A-Top-Down-Approach-Pearson-8th-Edition2021.pdf]]

# Syllabus
1. ***[[TỔNG QUAN VỀ MẠNG MÁY TÍNH]]***
    1.1. **Mạng Internet là gì? Giao thức mạng là gì?**
    1.2. **Kiến trúc mạng Internet: Phần biên và lõi của mạng**
    1.3. **Độ đo hiệu năng mạng**
    1.4. **Các tầng tương ứng trong mô hình Internet**
    1.5. **Ý nghĩa của việc phân tầng giao thức**

2. ***[[TẦNG ỨNG DỤNG]]***
    2.1. **Nguyên lý hoạt động của tầng Ứng dụng**
        2.1.1. Các mô hình tầng mạng
        2.1.2. Giao tiếp giữa các tiến trình
        2.1.3. Các dịch vụ tầng giao vận cung cấp cho tầng mạng
        2.1.4. Các dịch vụ được tầng giao vận cung cấp trong mạng Internet
        2.1.5. Các giao thức tầng mạng
    2.2. **Ứng dụng Web**
        2.2.1. Giao thức HTTP. Cơ chế kết nối HTTP
        2.2.2. Ý nghĩa thông điệp HTTP request và HTTP response.
        2.2.3. Cơ chế Cookies.
        2.3.4. Web cache, Web proxy.
        2.3.5. HTTP/2
    2.3. **Ứng dụng thư điện tử**
        2.3.1. Giao thức SMTP giữa các Mail Server
        2.3.2. Giao thức lấy thư POP3, IMAP
    2.4. **Ứng dụng phân giải tên miền - DNS**
    2.5. **Ứng dụng truyền tải tập tin ngang hàng**
    2.6. **Phát trực tuyến video và mạng phân phối nội dung**
    2.7. **Lập trình Socket**

3. ***[[TẦNG GIAO VẬN]]***
    3.1. **Các dịch vụ của tầng giao vận:**
    3.2. **Phân kênh/dồn kênh (Multiplexing / Demultiplexing)**
    3.3. **Giao thức UDP**
    3.3. **Cơ chế xây dựng đường truyền tin cậy**
        3.3.1. Kiểm tra lỗi (Checksum)
        3.3.2. Phản hồi ACK/NAK (Feedback)
        3.3.3. Đánh số thứ tự (Sequence number)
        3.3.4. Bộ định thời (Timer)
    3.4. **Cơ chế truyền tin kiểu đường ống (pipeline)**
        3.4.1. Cơ chế Go-Back-N
        3.4.2. Selective Repeat
    3.5. **Giao thức TCP**
    3.6. **Điều khiển luồng**
    3.7. **Cơ chế kiểm soát tắc nghẽn**
    3.8. **Cơ chế kiểm soát tắc nghẽn trong giao thức TCP**

4. ***[[TẦNG MẠNG (NETWORK) - DATA PLANE]]***
    4.1. **Tổng quan về tầng Mạng**
        4.1.1. Kiến trúc truyền thống
        4.1.2. Kiến trúc SDN
    4.2. **Cấu trúc router**
        4.2.1. Cổng vào
        4.2.1. Cổng ra
        4.2.3. Mạng chuyển mạch
    4.3. **Giao thức IP**
        4.3.1. Ý nghĩa các trường trong gói tin IP
        4.3.2. Quy ước địa chỉ IP
        4.3.3. Giao thức DHCP
        4.3.4. Chuyển đổi địa chỉ IP (NAT)
        4.3.5. Phân mảnh / Hợp nhất gói IP datagram.
    4.4. **Giao thức IPv6**
	~~4.5. **Giao thức OpenFlow**~~

5. ***[[TẦNG MẠNG (NETWORK) - CONTROL PLANE]]***
    5.1. **Các giải thuật định tuyến**
        5.1.1. Thuật toán định tuyến trạng thái liên kết (Link state routing)
        5.1.2. Thuật toán định tuyến vector khoảng cách (distance-vector routing)
    5.2. **Giao thức định tuyến nội vùng**
        5.2.1. Giao thức RIP
        5.2.2. Giao thức OSPF
    5.3. **Giao thức định tuyến liên vùng**
        5.3.1. Giao thức BGP
    5.4. **Mặt phẳng điều khiển trong kiến trúc SDN**

6. ***[[TẦNG LIÊN KẾT DỮ LIỆU VÀ MẠNG LAN - LINK LAYER]]***
    6.1. **Các dịch vụ của tầng liên kết dữ liệu**
    6.2. **Phát hiện lỗi, sửa lỗi**
    6.3. **Các cơ chế đa truy cập (multiple access)**
        6.3.1. Phân chia kênh truyền (channel portioning).
        6.3.2. Ngẫu nhiên (random access).
        6.3.3. Lần lượt (taking turn).
    6.4. **Các giao thức đa truy cập ngẫu nhiên**
        6.4.1. Slotted ALOHA
        6.4.2. ALOHA
        6.4.3. CSMA
        6.4.4. CSMA/CD
    6.5. **Mạng LAN**
        6.5.1. Địa chỉ MAC, giao thức ARP
        6.5.2. Giao thức Ethernet
        6.5.3. Các thiết bị Hub, Repeater, Bridge, Switch
        6.5.4. Mạng LAN ảo
    6.6. **Ví dụ tổng hợp về xử lý gói tin của các tầng giao thức**
    Ôn tập.


![[Class. Mạng máy tính - INT2213.canvas]]


# [[Ôn tập (made by Claude Opus 4.6)]]

