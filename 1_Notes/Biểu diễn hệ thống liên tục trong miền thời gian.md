---
created: 2026-04-23
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Tín hiệu và hệ thống - ELT2035]]"
---
---
\src
[[Biểu diễn hệ thống liên tục trong miền thời gian 2026-04-23 20.34.59.excalidraw]]

>[!important] !
>Các khái niệm về hệ thống LTI, tích chập, và các ý nghĩa xung quanh nó đã được viết ở [[Biểu diễn hệ thống rời rạc trong miền thời gian|đây]], bài này chỉ tập trung vào các cách biểu diễn *LTI liên tục* trên *miền thời gian*

## Xác định tính chất của hệ thống LTI liên tục
> Y hệt [[Biểu diễn hệ thống rời rạc trong miền thời gian#Xác định tính chất hệ thống LTI rời rạc|xác định tính chất của hệ rời rạc]]


| Tính chất                | Điều kiện                                     | Diễn giải                                                                          |
| ------------------------ | --------------------------------------------- | ---------------------------------------------------------------------------------- |
| Không nhớ *(memoryless)* | $h(t) = c \cdot \delta(t)$                    | Xung *Dirac* tồn tại **duy nhất ở $t=0$**<br>Nếu xuất hiện $h(t-2), ..$ thì có nhớ |
| Nhân quả *(casual)*      | $h(t) = 0, \forall t<0$                       | Toàn bộ **bên trái bằng 0**                                                        |
| Ổn định *(stable)*       | $\int_{-\infty}^{\infty} \|h(t)\|dt < \infty$ | Bounded input - bounded output                                                     |

## Biểu diễn dưới dạng đáp ứng xung
$$
\begin{align}
x[n] = \sum_{k=-\infty}^{+\infty} x[k]\delta[n-k] \\
y[n] = x[n] * h[n] = \sum_{k=-\infty}^{+\infty} x[k]h[n-k]
\end{align}
$$

## Biểu diễn dưới dạng phương trình vi phân
> Cũng giống giải [[Biểu diễn hệ thống rời rạc trong miền thời gian#Biểu diễn dưới dạng PT sai phân|PT sai phân]] 
![[3_Assets/Biểu diễn hệ thống liên tục trong miền thời gian 2026-04-23 20.34.59.excalidraw.md#^frame=01|80%]]
$$
\begin{align}
	& y(n) = -\sum_{k=1}^N a_{x} \frac{{d^ky(t)}}{d(t)^k} + \sum_{k=0}^M b_{x} \frac{{d^kx(t)}}{d(t)^k} \\
	& aka. \ \sum_{k=0}^N a_{k} \frac{{d^kx(t)}}{d(t)^k} = y(n-k)\sum_{k=0}^Mb_{k}\frac{{d^kx(t)}}{d(t)^k}, a_{0}=1
\end{align}
$$


# Bài tập
