---
created: 2026-03-13
tags:
  - summarized
category: "[[Class]]"
subject:
  - "[[Class. Tín hiệu và hệ thống - ELT2035]]"
---
---
\src:
[[Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw]]
[[3Slide_3_VI_Full.pdf]]
[[4_Slide4_VI.pdf]]

>[!important] !
>Ở chương này ta sẽ học về cách để biểu diễn một [[Giới thiệu về hệ thống|hệ thống]] như thế nào
>Như ta đã biết thì hệ thống được coi như là một hàm toán học
>Nhưng làm sao để tìm được chính xác hàm đó được? Nhất là trong môi trường thực tế, rất khó để để "đoán" một cái hàm mà có thể mô tả được hệ thống
>Ta cần có **phương pháp**. Là thứ ta học ngày hôm nay.
# Các khái niệm cơ bản của biểu diễn hệ thống
![[3_Assets/Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw.md#^frame=01|100%]]
## Hệ thống LTI *- Linear Time-Invariant*
>*Thực ra có rất nhiều loại hệ thống khác nữa (phi tuyến, thay đổi theo thời gian,...) nhưng trong phạm vi môn học này ta chỉ học hệ thống LTI vì lời giải nó "đẹp", không phức tạp. Nếu học các hệ thống khác thì có lẽ bên đtvt sẽ học*

Do tính chất của hệ LTI *(tính tuyến tính)*, ta có thể dễ dàng phân tích các tín hiệu đầu vào thành ***tổng của vô số tín hiệu*** đơn giản *(theo nguyên lý xếp chồng)*, ta chỉ việc tính toán hệ thống phản ứng thế nào với một xung lực duy nhất *(xung **Delta**)*, nó được gọi là *[[Biểu diễn hệ thống rời rạc trong miền thời gian#Đáp ứng xung|đáp ứng xung]]* 

## Đáp ứng xung
![[3_Assets/Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw.md#^frame=09|100%]]
>[!important] Ý nghĩa của đáp ứng xung
>Nó ***mô tả*** cách biến đổi từ đầu vào $\to$ đầu ra
>Vì vậy, ta có thể formulate nó thành công thức
>$$y = x * h$$
>Trong đó:
>- $y$: Đầu ra
>- $x$: Đầu vào
>- $h$: Đáp ứng xung
>- $x * h$: Là hành động *"$x$ [[Biểu diễn hệ thống rời rạc trong miền thời gian#Tích chập|tích chập]] $h$"* *(có thể hiểu nó như một phép toán)*

Là đầu ra của hệ thống khi đầu vào là ***xung Delta***
###### *Vậy làm sao để biểu diễn được tín hiệu đầu vào?*
Ta sử dụng phép dịch delta ra một khoảng $k$, và scale nó theo biên độ của đầu vào
Từ đó, ta biểu diễn được đầu vào *(rời rạc)* như sau:
$$
\begin{align}
x[n] = \sum_{k=-\infty}^{+\infty} x[k]\delta[n-k] \\
y[n] = x[n] * h[n] = \sum_{k=-\infty}^{+\infty} x[k]h[n-k]	
\end{align}
$$

### Tích chập
![[3_Assets/Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw.md#^frame=04|100%]]
#### Tính chất và cách tính tích chập
![[3_Assets/Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw.md#^frame=02|100%]]

***Cách tính***
![[Biểu diễn hệ thống rời rạc trong miền thời gian 2026-06-23 10.41.06.excalidraw|400]]


# Biểu diễn hệ thống rời rạc
## Xác định tính chất hệ thống LTI rời rạc
![[3_Assets/Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw.md#^frame=05|100%]]
***Các tính chất cần xét:***
1. ***Tính nhớ***: Hệ LTI là **không nhớ** khi đáp ứng xung của nó **chỉ là một xung duy nhất** tại gốc tg$$\begin{align}
	h[n] &= c \cdot{\delta[n]} \\
	h[n] &= 0 ,\forall n \neq 0
   \end{align}$$
2. ***Tính nhân quả***: Là khi $h[n] = 0, \forall n<0$
3. ***Tính ổn định***: Là khi $\sum_{n=-\infty}^{\infty} |h[n]|<\infty$
![[3_Assets/Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw.md#^frame=10|100%]]

## Biểu diễn dưới dạng PT sai phân
![[3_Assets/Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw.md#^frame=06|100%]]
$$
\begin{align}
	& y(n) = -\sum_{k=1}^N a_{x}y({n-k}) + \sum_{k=0}^M b_{x} x(n-k) \\
	& aka. \ \sum_{k=0}^N a_{k} y(n-k) = \sum_{k=0}^Mb_{k}x(n-k), a_{0}=1
\end{align}
$$


Ví dụ:
![[3_Assets/Week 3 - Biểu diễn hệ thống tuyến tính bất biến 2026-03-13 09.57.16.excalidraw.md#^frame=07|100%]]

## Biểu diễn dưới dạng Đáp ứng xung
> *Đã viết ở phần [[Biểu diễn hệ thống rời rạc trong miền thời gian#Đáp ứng xung|đáp ứng xung]]*

$$
\begin{align}
x[n] = \sum_{k=-\infty}^{+\infty} x[k]\delta[n-k] \\
y[n] = x[n] * h[n] = \sum_{k=-\infty}^{+\infty} x[k]h[n-k]	
\end{align}
$$


![[Biểu diễn hệ thống rời rạc trong miền thời gian 2026-06-26 08.17.41.excalidraw]]
# Bài tập
[[Biểu diễn hệ thống rời rạc trong miền thời gian 2026-04-04 15.50.06.excalidraw]]
[[Week 3 - Biểu diễn hệ thống tuyến tính bất biến rời rạc 2026-04-23 12.23.32.excalidraw]]

[docs.google.com/document/d/1QfS9dVPYs9kSecAmsAx4lwIk5UBbCB7j/edit](https://docs.google.com/document/d/1QfS9dVPYs9kSecAmsAx4lwIk5UBbCB7j/edit)

![[Biểu diễn hệ thống rời rạc trong miền thời gian 2026-06-26 07.32.10.excalidraw]]
![[Biểu diễn hệ thống rời rạc trong miền thời gian 2026-06-26 08.08.59.excalidraw]]