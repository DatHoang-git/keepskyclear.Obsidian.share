---
created: 2026-04-04
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Tín hiệu và hệ thống - ELT2035]]"
---
---
\src:
[[Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-13 09.11.40.excalidraw]]
[[1_SnS_Ch1_P2.pdf]]

# Hệ thống
![[3_Assets/Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-13 09.11.40.excalidraw.md#^frame=01|70%]]
Hiểu đơn giản là một hàm toán học biến đổi tín hiệu vào $\to$ tín hiệu ra

###### Kết hợp các hệ thống
![[3_Assets/Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-13 09.11.40.excalidraw.md#^frame=07|500%]]

# Phân loại hệ thống và các thuộc tính
### Time-invariant - Bất biến với thời gian
![[3_Assets/Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-13 09.11.40.excalidraw.md#^frame=06|100%]]
Là hệ thống nếu đầu ra chỉ phụ thuộc vào đầu vào mà không phụ thuộc vào thời điểm
*"Dù thời điểm có dịch, thì đầu ra vẫn ra kq như lúc chưa dịch"*


### Memory - Hệ thống nhớ 
![[3_Assets/Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-13 09.11.40.excalidraw.md#^frame=02|100%]]
Nếu ***đầu ra của hệ thống*** tại thời điểm $t$ phụ thuộc vào ***các thời điểm khác $t$*** thì hệ thống nhớ

### Causual - Hệ thống nhân quả
![[3_Assets/Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-13 09.11.40.excalidraw.md#^frame=03|100%]]
Nếu ***đầu ra của hệ thống*** phụ thuộc vào thời điểm ***hiện tại và quá khứ*** $(t \  OR \ t-...)$ thì hệ thống nhân quả

Xảy ra khi đầu ra tại thời điểm $t$ phụ thuộc vào đầu vào $x(\tau)$ với:
$$
\tau \leq t
$$
Trong đó:
- $\tau = t$: Thời điểm hiện tại
- $\tau < t$: Thời điểm quá khứ $(t-...)$

### Linear - Hệ thống tuyến tính
![[3_Assets/Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-13 09.11.40.excalidraw.md#^frame=04|100%]]
Là hệ thống tuyến tính thì nó thỏa mãn dk sau:
$$
a_{1}x_{1} + a_{2}x_{2} \implies F(a_{1}x_{1}+a_{2}x_{2}) = a_{1}F(x_{1}) + a_{2}F(x_{2})
$$
>Khi chứng minh trong bài, ta CM sao cho biến đổi được sang vế phải với đầu vào tương ứng
>![[Pasted image 20260623093213.png|300]]

### Stable - Hệ thống ổn định
![[3_Assets/Lấy gốc tín hiệu hệ thống tuần 1, 2 2026-03-13 09.11.40.excalidraw.md#^frame=05|100%]]
Hệ thống ổn định là hệ thống ***có đầu ra hữu hạn*** khi ***đầu vào hữu hạn***

> *Thường thì đi thi sẽ sử dụng 2 công thức ở bên trên kia, vì ta hiếm khi đưa thử mọi tín hiệu đầu vào để kiểm tra đầu ra*
> $$\int_{-\infty}^{\infty} |h(t)| dt < \infty \ OR \ \sum_{n = - \infty}^\infty |h[n]| < \infty  $$
# Bài tập
BT Cô Mai (src c Hành):[docs.google.com/document/d/1gy2I6rUoTwqwMioJFjfFjTARA1L2Xurf/edit](https://docs.google.com/document/d/1gy2I6rUoTwqwMioJFjfFjTARA1L2Xurf/edit)

![[Giới thiệu về hệ thống 2026-06-25 19.59.23.excalidraw|Bài 1.1]]


