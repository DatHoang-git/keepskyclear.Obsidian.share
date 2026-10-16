---
created: 2026-06-02
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Nguyên lý hệ điều hành - INT2214]]"
---
---
\src:
[[Week 3 - Tiến trình 2026-03-11 07.51.36.excalidraw]]
[[Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw]]
[[Week 7 - Đồng bộ hóa tiến trình 2026-04-08 08.28.20.excalidraw]] (x)
[[Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw]]

# Tiến trình
![[3_Assets/Week 3 - Tiến trình 2026-03-11 07.51.36.excalidraw.md#^frame=01|400]]

### ***Nó là gì?***
***KN:*** Là một chương trình (bị động) đang thực hiện nhiệm vụ (chủ động)
> *Chương trình bao gồm:*
> - Đoạn src code
> - Dữ liệu
> *Tiến trình là sự hoạt động của chương trình, bao gồm:*
> - Ngăn xếp / heap
> - Các *hoạt động hiện tại* thể hiện bằng con trỏ và nội dung thanh ghi của bộ xl

***Nó được biểu hiện ra như thế nào?***
Qua khối PCB (Process Control Block)

### ***Nó có những trạng thái gì? (Trạng thái của tiến trình) và Làm sao để chuyển trạng thái? (Context Switching)***
![[3_Assets/Week 3 - Tiến trình 2026-03-11 07.51.36.excalidraw.md#^frame=07|100%]]
- new *(lúc mới đẻ, đang chờ vào guồng qay xã hội)*
- ready *(cái guồng đã nhận nó, chuẩn bị kiếm job cho nó)*
- running *(đang chạy job)*
- waiting *(chờ sự kiện để được thực thi)*
- terminated *(hẹo.)*

***Các bước để chuyển ~~trạng thái~~ "NGỮ CẢNH":*** (Trong TH B nhảy vào, A phải nhường chỗ) (4 steps)
1. Ghi A *(bảo toàn progress)*
2. Cho A vào Queue 
3. Load PCB B
4. Exec B

>[!bug] Lưu ý:
>Đoạn này rất dễ nhầm sang State (trạng thái - là các trạng thái của tiến trình). Trong khi Context (ngữ cảnh) là việc thay thế, thế chỗ chiếm dụng của tiến trình với CPU

### ***Mình có thể làm gì nó? (aka Thao tác với tiến trình)***
![[3_Assets/Week 3 - Tiến trình 2026-03-11 07.51.36.excalidraw.md#^frame=04|100%]]
![[3_Assets/Week 3 - Tiến trình 2026-03-11 07.51.36.excalidraw.md#^frame=05|100%]]
1. **Tạo tiến trình** ^fa650a
	1. Tạo cha
	2. Tạo con: Là con của tiến trình cha khi Cha gọi hàm `create_process`
2. **Kết thúc tiến trình:**
   Chạy lệnh `abort` or `kill`
3. **Giao tiếp với nhau**:
   Khi cần sd chung ttin hoặc nhiệm vụ
   -> Tăng tốc độ tính toán


![[3_Assets/Week 3 - Tiến trình 2026-03-11 07.51.36.excalidraw.md#^frame=06|100%]]

# Lập lịch tiến trình (Lập lịch CPU)
>*Phần này sẽ bao gồm cả một số khái niệm ở bài đầu. Cụ thể là khái niệm Lập lịch tiến trình. Vì kn sêm sêm nên đặt cùng subsection*
>Lập lịch CPU là một khái niệm con của lập lịch tiến trình

### Tại sao phải lập lịch? 
![[3_Assets/Week 3 - Tiến trình 2026-03-11 07.51.36.excalidraw.md#^frame=03|100%]]
- Tài nguyên có hạn, nhà đông con mà gạo ít nên phải xếp hàng (queue)

### Có những kiểu lập lịch nào?
![[Pasted image 20260602153119.png]]
1. **Ngắn hạn** *(aka [[Quản lý Tiến trình (Processing)#Lập lịch CPU|Lập lịch CPU]])* ==liên tục và vĩnh viễn (most important)== : Tiến trình ready queue trong RAM -> Ném cho CPU xử lý
2. **Trung hạn:** ==chỉ chạy khi cần thiết==  Khi RAM đầy -> Ném tiến trình ra ổ cứng (Cơ chế swapout/swapin) -> Chờ RAM rảnh để ném vào lại ^dfa693
3. **Dài hạn***(đã bị loại bỏ do cơ chế [[Quản lý Bộ nhớ trong (Memory)|virtual memory]])*: Chọn tiến trình trong ổ đĩa *(khác với swap in, cái này đã được xác định từ trước)* -> Ném vào RAM -> Cho vào CPU
***=> Không phải là chọn cái nào, mà là dùng khi nào*** ^0febd2

## Lập lịch CPU
Trong suốt vòng đời, một tiến trình thực hiện chủ yếu 2 loại công việc:
- Trạng thái running (CPU)
- Thực hiện tạo tác I/O (I/O devices)
![[3_Assets/Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw.md#^frame=4hJGzDME|100%]]


### ***Khi nào thì cần phải lập lịch?***
![[3_Assets/Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw.md#^frame=02|100%]]
Khi có một event xảy ra (timeout hoặc I/O events) -> Tiến trình chuyển state -> Bộ lập lịch sử dụng [[Quản lý Tiến trình (Processing)#Các thuật toán lập lịch CPU|các thuật toán lập lịch]] đi vào hoạt động
Hai loại triggerr:
- *Running -> Waiting*
- *Running -> Ready*
>*Bản chất của nó là: Khi ở trạng thái Running tiến trình đang sử dụng CPU -> Khi tiến trình chuyển trạng thái (nghĩa là việc sd CPU có thay đổi) -> Việc lập lịch lại là chuyện đương nhiên*


### ***Khi lập xong lịch rồi, thì làm sao để thực hiện?***
![[3_Assets/Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw.md#^frame=06|100%]]
Module này được thực hiện khi chốt được danh sách ở bước trên, và bắt đầu thực hiện:
- [[Quản lý Tiến trình (Processing)#***Nó có những trạng thái gì? (Trạng thái của tiến trình) và Làm sao để chuyển trạng thái? (Context Switching)***|Context Switching]]
- Chuyển về user-mode
- Thực hiện tiến trình theo trạng thái đã lưu


### ***Các thuật toán lập lịch CPU***
> *Phần này chỉ đơn giản là Priority Queue với các tham số được sử dụng khác nhau*

##### Làm sao để đánh giá thuật toán lập lịch?
![[3_Assets/Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw.md#^frame=07|100%]]
Dựa vào các tiêu chí trên:
- CPU Utilization
- Throughput
- Turnaround time: $t_{out} - t_{in}$ *(từ khi bắt đầu vào cho đến khi kết thúc $t_{out} = t_{in} + t_{queue} + t_{exec}$)*
- Waiting time: $t_{avg\_waiting} = t_{queue} / n$ (thời gian trong queue / n)
- Response time: $t_{res} = t_s – t_r$, trong đó $t_r$ là thời điểm nhận yêu cầu, $t_s$ là thời điểm bắt đầu đáp ứng yêu cầu


##### ==FCFS - First Come First Serve==
![[3_Assets/Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw.md#^frame=03|100%]]
***Hàng đợi ưu tiên*** - Tham số là Arrival Time

Đứa nào vào trước thì phục vụ trước
Nhược: Convoy effect (Tiến trình phải chờ quá lâu để đc phục vụ)
##### SJF - Shortest Job First
![[3_Assets/Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw.md#^frame=08|100%]]
***Hàng đợi ưu tiên*** - Tham số là Burst Time
- Burst Time bằng nhau thì FCFS
- Sài cho lập lịch dài hạn. Không tối ưu cho lập lịch ngắn hạn

Ủa, nhưng làm sao mà biết trước tương lai để tính Burst Time? -> Dùng thuật toán dự báo (cthuc Exponential Average)

##### Priority Scheduling
![[3_Assets/Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw.md#^frame=04|100%]]
Cho mỗi một tiến trình một tham số $p$ gắn với độ ưu tiên:
- ĐƯT trong: Tính dựa trên mức sd tài nguyên
- ĐƯT ngoài: Dựa vào con người, lựa chọn của người dùng...

>*???? Phần này slide nó chả nói cái thuật toán nó hoạt động như nào (xác định $p$, black box nên ko đi sâu vào thêm)*
##### ==Round Robin==
![[3_Assets/Week 4 - Lập lịch CPU 2026-03-18 07.41.48.excalidraw.md#^frame=05|100%]]
IDEA: 
- Cho một cái "Serving box" mà giới hạn thời gian phục vụ cho mỗi "phiên" ($t_{quantum}$)
- Cho các tiến trình xoay vòng nhau để được phục vụ cho đến khi nó phục vụ hết nhu cầu

Biểu diễn dưới dạng Gantt chart cho bài tập trên:
![[Pasted image 20260602180203.png|467]]
##### Multi queue scheduling (Hàng chờ đa mức)
***Ý tưởng***:
- Sử dụng nhiều queue
- Phân loại các process (dựa vào một criteria nào đó) -> Đẩy nó vào queue tương ứng
![[Quản lý Tiến trình (Processing) 2026-06-02 18.15.19.excalidraw|500]]

Nhược: Tính *Không mềm dẻo* Khi mà đã xếp vào một loại hàng chờ thì không có cách nào chuyển nó sang hàng chờ khác -> *Starvation*
##### Multi-level feedback-queue 
Giải quyết tính *Không mềm dẻo* của hàng chờ đa mức bình thường:
- Nếu tiến trình ôm CPU quá lâu -> OS đẩy nó xuống queue priority thấp
- Nếu tiến trình bị chết đói *(Starvation)* -> Dựa vào cơ chế Aging, đẩy nó lên queue có ưu tiên cao hơn

# Đồng bộ hóa tiến trình

### ***Tại sao cần đồng bộ hóa?***
##### ***Race condition*** - Hiện tượng Tương tranh: 
Hai tiến trình cùng sửa đổi,  dùng chung một nguồn tài nguyên đồng thời -> KQ cuối cùng sẽ phụ thuộc vào thứ tự thực hiện các lệnh
![[3_Assets/Quản lý Tiến trình (Processing) 2026-06-02 22.13.02.excalidraw.md#^frame=0bIdeger|100%]]
Để khắc phục điều đó, phải có cái gì để đồng bộ hóa các tiến trình *(là việc KHÔNG ĐƯỢC CHẠY cùng lúc khi CHẠM TỚI TÀI NGUYÊN DÙNG CHUNG - aka TUẦN TỰ HÓA)*

##### *Mã găng* - Critical section ($CS_i$)
> *aka. Đoạn găng / Miền găng*
> *Từ "Găng" hiểu là "Critical" / nguy cấp / then chốt*
![[3_Assets/Quản lý Tiến trình (Processing) 2026-06-02 22.13.02.excalidraw.md#^frame=y8GdM2RH|100%]]

- Là đoạn mã nằm bên trong vòng đời của tiến trình, THÔNG QUA NÓ có thể thao tác lên các tài nguyên dùng chung để TRÁNH TƯƠNG TRANH
- Tiến trình nào cũng có
- Một đoạn mã luôn có 4 mục như dưới đây:
```c++
do { 
	ENTRYi; // Entry section - Là cái khiên năng lượng màu cam - aka cái "khóa": Nếu rảnh - Bật lên / Nếu có người sài - Block cho đến khi nó rảnh
	Thực hiện CSi; // Critical section - Thực hiện thao tác với Resource - aka cái đoạn tăng lên 6 cái hột và trả về 
	EXITi; // Exit section - Giải phóng cái điểm kết nối, mở khóa
	REMAINi; // Remainder section 
} while (TRUE);
```
*Lưu ý: Cả đoạn này ko phải mã găng , mã găng chỉ là `CS_i` mà thôi!*

>*Toàn bộ tinh hoa của bài toán Synchronization thực chất chỉ là thiết kế ra đoạn code `ENTRY` và `EXIT` sao cho hiệu quả nhất để bảo vệ cái core `CS_i` bên trong*

##### ***Các điều kiện của đoạn mã găng:***
1. **Loại trừ lẫn nhau**: Tại cùng một thời điểm, chỉ duy nhất một tiến trình được thực thi bên trong mã găng
2. **Tiến triển**: Nếu mã găng đang trống, **CHỈ NHỮNG** tiến trình đang thực sự muốn vào (đang đứng ở cửa ENTRY, không làm việc riêng ở REMAIN) mới được quyền tham gia tranh giành. VÀ quyết định chọn ai phải được đưa ra trong một **thời gian hữu hạn** (không được phép nhường qua nhường lại khiến mã găng bỏ trống vô ích).
3. **Chờ có giới hạn:** Từ lúc một tiến trình gửi yêu cầu xin vào, phải có một **giới hạn số lần** các tiến trình khác được phép chen ngang vào trước nó *(chen ngang TRƯỚC KHI vào mã găng - xảy ra hiện tượng chen ngang là do sự sắp xếp priority động)*
### Semaphore
Chính là "thể xác vật lý" của thằng `ENTRY_i` và `EXIT_i`
```c++
do {
    wait(S);       // <--- ĐÂY CHÍNH LÀ ENTRY_i (Xin phép, đập cửa, bật khiên khóa, S--)
    // THỰC HIỆN MÃ GĂNG (CS_i)
    signal(S);     // <--- ĐÂY CHÍNH LÀ EXIT_i (Trả tài nguyên, tắt khiên, đánh thức, S++)
    // REMAIN_i (Làm việc riêng)
} while (TRUE);
```

> *Trước đó, ta dùng biến **Mutex** (Khóa nhị phân) cho mỗi tài nguyên*
> Context là khi có các tài nguyên GIỐNG Y HỆT NHAU, bất kì cái nào cũng có thể thỏa mãn được nhu cầu của tiến trình
> Nếu sử dụng Mutex (binary), tiến trình sẽ phải loop liên tục để tìm cái cửa đang mở *(chạy gõ cửa hỏi thăm từng nhà)* -> Rất phí

 Giải pháp: Hệ điều hành nhả về biến $S$ mang thông tin số tài nguyên rỗi. 
 - Nếu tiến trình thấy `S > 0` -> Cho phép vào và thực hiện `S--`
 - Nếu tiến trình thấy `S <= 0` -> Vẫn tiếp tục trừ, số âm thể hiện số request đang chờ ở queue *(thực ra mà thấy số âm nó vẫn trừ rồi ném vào queue luôn)*
 - Khi tiến trình xong mã găng -> Thực hiện `S++`, gọi `wakeup()` để nhúp tiến trình trong queue ra

***Semaphore cổ điển:***
- Sử dụng toán tử *chờ bận* (busy waiting - chờ wait kết thúc nhưng CPU vẫn hoạt động)
- Đây gọi là ***Spinlock*** *Hét lên "Mở chưa, Mở chưa liên tục*

***Cài Semaphore theo cấu trúc***:
- Sử dụng toán tử *chặn* (block - tạm dừng hoạt động của tiến trình luôn). Đi song hành với toán tử *wakeup*
![[NLHDH-Week04.pdf#page=24&rect=8,48,719,417|NLHDH-Week04, p.24]]

***Semaphore nhị phân***
- `S` chỉ nhận giá trị 0 và 1
- **Mutex:** Là cái ổ khóa (Lock). Dùng để **BẢO VỆ** vùng nhớ chung. Kẻ nào khóa, kẻ đó phải mở.
- **Binary Semaphore:** Là cột đèn tín hiệu (Signal). Dùng để **ĐIỀU PHỐI** luồng chạy trước/sau. Tiến trình này đứng chờ, tiến trình khác phát tín hiệu đánh thức.

#### Hạn chế của semaphore
- Có thể dẫn tới lỗi bế tắc do sử dụng không đúng cách *(Gây ra bởi lỗi lập trình & Người lập trình ko cộng tác)*
### Một số bài toán đồng bộ hóa
##### Vùng đệm có giới hạn
> *Context:* Khi sử dụng khái niệm vùng đệm, ta sẽ gặp phải các trường hợp:
> - *Overflow*: Buffer đầy mà cứ nhét thêm vào -> Dữ liệu bị ghi đè và hỏng
> - *Underflow*: Không có gì mà cứ nhúp ra
> - *Race condition*: $P_A$ và $P_B$ đều thò tay vào cùng một ô trong buffer, hoặc có thằng nó đang đẩy vào mà thằng khác lại nhúp ra 
>   
>   Các vấn đề trên đều xảy ra khi tiến trình mù quáng, không biết bên trong buffer có bao nhiêu
> 
> First intuition: 
> - Sử dụng một biến đếm để theo dõi trạng thái của buffer
> - Sử dụng một biến binary để check trạng thái chiếm dụng

Ta sẽ sử dụng 3 biến semaphore: 
- `Full` (Khởi tạo = 0): Biến đếm HÀNG HÓA. Dành cho thằng lấy (Consumer). Trước khi lấy phải gọi `wait(Full)`. Nếu `Full <= 0` (hết đồ ăn) $\rightarrow$ **Bị Block (Đi ngủ chờ Đầu bếp làm thêm).**
- `Empty` (Khởi tạo = N): Biến đếm CHỖ TRỐNG. Dành cho thằng nhét (Producer). Trước khi nhét phải gọi `wait(Empty)`. Nếu `Empty <= 0` (hết chỗ trống) $\rightarrow$ **Bị Block (Đi ngủ chờ Khách ăn bớt).**
- `Mutex`: Biến nhận giá trị binary, là trạng thái chiếm dụng

![[NLHDH-Week04.pdf#page=28&rect=24,46,707,421|NLHDH-Week04, p.28]]

> *Tại sao lại phải dùng 2 biến đếm?*
> Do Semaphore là cái hộp đen, không thể biết được giá trị bên trong là bao nhiêu
> Do hàm `wait()` chỉ được hardcode để chặn lại khi giá trị $\leq 0$ *(Là cái trade-off cho tốc độ, xem lại kiến trúc máy tính)*
> $\implies$ Do đó ko thể check được khi nào đầy, dẫn tới hiện tượng overflow

##### Tiến trình đọc / ghi
Có 2 loại tiến trình cùng thao tác trên một CSDL: 
- Chỉ đọc
- Chỉ ghi

Bài toán: Thiên vị người đọc
1. Reader chỉ được phép ghi Writer đã ghi xong
2. Reader không được đọc khi Writer đang ghi

Sử dụng biến Semaphore: 
- `wrt`: Đảm bảo loại trừ lẫn nhau khi writer ghi
- `mutex`: Đảm bảo loại trừ lẫn nhau khi cập nhật rcount

![[NLHDH-Week04.pdf#page=31&rect=9,8,703,411|NLHDH-Week04, p.31]]
`rcount`: Đếm số người đọc. Thằng đầu là thằng tiên phong, một khi đã clear *(`wait(wrt)` thỏa mãn)* thì thằng 2, 3, 4 nối đuôi nhau vào mà đọc tiếp
> Thằng đầu bật điện, thằng sau tắt điện

##### Bữa ăn tối của triết gia
![[Quản lý Tiến trình (Processing) 2026-06-04 06.52.25.excalidraw|800]]



### Cơ chế monitor
Là một cơ chế đồng bộ hóa, cấu thành bởi 3 yếu tố:
- Shared Data: Những biến, trạng thái mà các luồng đều muốn đọc / ghi
- Mutex: Đảm bảo điều kiện loại trừ lẫn nhau
- *Condition Variables:* Thêm một lớp nữa so với semaphore, thêm các biến điều kiện, khi thỏa mãn mới cho đi - Gọi hàm `wait` trên biến điều kiện
	- Một số gỉa định bất biến nhằm tránh race condition

Monitor chuyển **gánh nặng** phải đặt lệnh `wait()` và `signal()` của semaphore sang **cho compiler**
*(e.g. `synchronized` trong Java*
![[Quản lý Tiến trình (Processing) 2026-06-04 07.14.24.excalidraw|900]]

***Biến condition trong Monitor:***
>*Tại sao lại cần condition nhỉ?*
>Do là mình xài `shared data` *(a dynamic entity)*
>-> Data này cũng sẽ bị ảnh hưởng bởi nhiều yếu tố khác nhau tác động vào (*e.g. tiến trình khác tác động vào*) 
>-> Khi các procedures trong monitor gọi, thì việc kiểm tra điều kiện của data là việc tất yếu
![[Quản lý Tiến trình (Processing) 2026-06-04 12.39.43.excalidraw|80%]]


# Giải quyết các vấn đề của lập lịch tiến trình (Xử lý deadlock)

## KN Bế tắc
Xảy ra khi 2 hay nhiều hành động phải chờ hành động khác để kết thúc, mà hành động đó ko baoh thực hiện được
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=X6M5IEhv|100%]] 




##### ***Các điều kiện để xảy ra bế tắc***
![[Pasted image 20260604155245.png|600]]
1. **Loại trừ lẫn nhau**: MỘT tài nguyên cho MỘT tiến trình, ko tiến nhìn nào sd được
2. **Giữ và chờ**: Mình cần tài nguyên A và B để done, mà B thằng khác dùng rồi, mình vừa *giữ* và *chờ*
3. **Không có đặc quyền**: Chỉ tiến trình đang giữ tài nguyên mới có quyền thả nó ra
4. **Chờ vòng**: Chờ theo vòng (mô tả hình trên)
##### ***Đồ thị cấp phát tài nguyên***
>*Làm sao để mô tả được bế tắc?*
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=PGusxeNe|100%]]

Sử dụng đồ thị cấp phát tài nguyên, đồ thị có hướng trong đó:
- $V = \{P, R\}$. 
	- $P$ - Tiến trình
	- $R$ - Tài nguyên
- $E = \{P_i\to R_{i} \ ; \ R_{i}\to P_{i}\}$.
	- $P_i\to R_{i}$ : Yêu cầu
	- $R_{i}\to P_{i}$ : Cấp phát

> Trong đó, bế tắc xuất hiện khi có chu trình trong [[Quản lý Tiến trình (Processing)#***Đồ thị cấp phát tài nguyên***|đồ thị cấp phát tài nguyên]]
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=03|90%]]

## Xử lý bế tắc
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=04|100%]]
Có 3 cách:
1. SD giao thức ko rơi vào bế tắc *([[Quản lý Tiến trình (Processing)#Tránh bế tắc|tránh]] và [[Quản lý Tiến trình (Processing)#Ngăn chặn bế tắc|chặn]]*)
2. Phát hiện và undo
3. Bỏ qua nó luôn! 
>*(do chi phí để tránh quá lớn, ko thể dự đoán trc đc lượng tài nguyên sd - do user. vì thế cho user quyền tự sinh tự diệt luôn)*

### Ngăn chặn bế tắc
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=05|1000]]
Ngăn chặn bế tắc chính là ngăn chặn [[Quản lý Tiến trình (Processing)#Ngăn chặn bế tắc|4 điều kiện xảy ra bế tắc]]:
- **C1**: Luôn có những tài nguyên ko dùng chung -> Khó
- **C2**: Chặn việc giữ và chờ bằng cách:
	- Chỉ được yêu cầu khi nó không giữ
	- Chỉ thực hiện khi có đủ tài nguyên
- **C3**: Để ngăn sự độc quyền trong giải phóng
	- Đưa ra rule để áp đặt, buộc phải giải phóng tất cả số tài nguyên đang giữ nếu thiếu tài nguyên cần *(aka chỉ thực hiện khi đủ, như cái trên)*
- **C4**: Ngăn chặn chờ vòng -> Đánh số tài nguyên, cấp tài nguyên theo stt

***Nhược khi  sử dụng chiến lược ngăn chặn***:
- Không mềm dẻo
- Giảm khả năng tận dụng tài nguyên (ultility), giảm thông lượng

### Tránh bế tắc
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=06|80%]]

***Trạng thái an toàn***
Là trạng thái có thể cấp phát tài nguyên theo **một trình tự** nào đó mà vẫn **né được bế tắc**
Trạng thái an toàn $\leftrightarrow$ khi có **Thứ tự an toàn**

***Thứ tự an toàn***
Là một **thứ tự tiến trình** thỏa mãn được yêu cầu cấp phát tài nguyên của **tất cả tiến trình** căn cứ bởi tài nguyên **rỗi** và tài nguyên **đang bị chiếm giữ** hiện tại

Mẹo giải dạng bài này của tôi: 
*Bên phải là tracing table, để tìm thứ tự an toàn, bên trái là kiểm tra thứ tự có an toàn hay ko*
![[Quản lý Tiến trình (Processing) 2026-06-04 16.59.08.excalidraw|1000]]
##### ***Thuật toán đồ thị cấp phát tài nguyên***
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=07|100%]]
Có 2 bước:
- Bước "đặt thử": Tạo cạnh giữa P và R (giả vờ cấp phát), từ đây tạo được cây đệ quy DFS
- Bước tìm chu trình: Với mỗi depth của cây quyết định ta lại chạy để tìm chu trình

##### ***Thuật toán Banker***
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=08|100%]]
##### Thuật toán trạng thái an toàn
![[3_Assets/Week 8 - Cơ chế monitor, Bế tắc 2026-04-22 08.03.54.excalidraw.md#^frame=09|100%]]
##### Thuật toán yêu cầu tài nguyên

### Phát hiện bế tắc
- Nếu không [[Quản lý Tiến trình (Processing)#Tránh bế tắc|tránh]] hay [[Quản lý Tiến trình (Processing)#Ngăn chặn bế tắc|chặn]] bế tắc thì chỉ còn nước phát hiện bế tắc -> **Khôi phục** nếu xảy ra

##### ***Thuật toán đồ thị chờ***
Thuật toán này áp dụng cho cả tài nguyên có một thể hiện và tài nguyên có nhiều thể hiện

![[Quản lý Tiến trình (Processing) 2026-06-04 22.25.38.excalidraw|1000]]