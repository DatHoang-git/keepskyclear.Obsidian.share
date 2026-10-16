---
created: 2026-06-07
tags:
  - summarized
category:
  - "[[Class]]"
subject:
  - "[[Class. Nguyên lý hệ điều hành - INT2214]]"
---
---
\src:
[[Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw]]
[[Phân trang, bảng trang.excalidraw]]
[[Phân đoạn.excalidraw]]


> [!NOTE] Cầu nối từ [[Quản lý Tiến trình (Processing)|Quản lý Tiến trình]]
> * Trong **Tiến trình**, ta đã học: Một tiến trình muốn chạy (`running`) thì trước hết nó phải được nạp vào **RAM** ở trạng thái `ready`.
> * Trong **[[Quản lý Tiến trình (Processing)#^dfa693|Lập lịch trung hạn]]**: Khi RAM quá tải, OS phải thực hiện `swap-out` để đẩy bớt tiến trình ra bộ nhớ phụ (Disk) và `swap-in` khi RAM trống trở lại.
> * Trong **[[Quản lý Tiến trình (Processing)#^0febd2|Lập lịch dài hạn]]**: Ta đã ghi chú rằng nó bị loại bỏ nhờ cơ chế **Bộ nhớ ảo (Virtual Memory)**.
> 
> *Câu hỏi đặt ra:* Làm sao để OS xếp hàng nghìn tiến trình vào RAM một cách ngăn nắp, bảo vệ vùng nhớ của chúng không bị xâm phạm lẫn nhau, và giải quyết bài toán "RAM nhỏ nhưng muốn chạy game to"? Chương này sẽ giải quyết điều đó!

![[Quản lý Bộ nhớ trong (Memory) 2026-06-07 14.09.23.excalidraw|10000]]
# Quản lý bộ nhớ (Slide 6)
## Giới thiệu chung
Chương trình sẽ đưa vào RAM -> Tạo tiến trình và thực hiện tại CPU
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=1sYe3SoC|800]]

***Quản lý bộ nhớ nằm ở đâu trong vòng đời tiến trình?***
Quản lý bộ nhớ đơn giản là bài toán đáp ứng nhu cầu tìm chỗ ở cho tiến trình *(môi giới BDS)*. Trong đó: 
- Nhu cầu: Địa chỉ logic - Logical address
- Chỗ ở: Địa chỉ vật lý - Physical address

![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=02|800]]
Việc quản lý diễn ra ở **execution time - thời điểm thực thi**, **dynamic linking *(phần mềm)*** tạo địa chỉ ảo khi hàm thư viện được gọi lần đầu, và **MMU *(phần cứng)*** giúp phiên dịch đống đó qua địa chỉ vật lý qua mỗi chu kì
*Làm việc thông qua đoạn mã stub*

> [!PDF|] [[NLHDH-Week06.pdf#page=6&selection=44,0,54,5|NLHDH-Week06, p.6]]
> > Địa chỉ thật và ảo giống nhau trong lược đồ ánh xạ địa chỉ “compile-time” và “load-time” và khác nhau trong “execution-time”
> 
>

>Static Loading: Load-time
>Static Linking: Link-time

> *Tại sao, lại nhấn mạnh vào Dynamic Linking / Loading?*
> Ta sẽ học ở phần sau, MMU đẻ ra nhiều kiến trúc phức tạp cũng để phục vụ cho cơ chế Dynamic được nhắc ở đây

##### MMU - Memory Management Unit
Đọc địa chỉ logic -> Cấp địa chỉ vật lý cho tiến trình
## Các chiến lược cấp phát
Có 2 chiến lược cấp phát cơ bản, cấp phát liên tục *(Mỗi một tiến trình một block)* và cấp phát rời rạc *(Mỗi một tiến trình có nhiều block)*
### Cấp phát liên tục (MFT, MVT)
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=03|1000]]
***MFT - "Multiprogramming with a Fixed number of Tasks"***: Phân vùng cố định từ trước
Khi khởi động chia ra làm các tier phân vùng với mức trần (100MB, 200MB,...)
Tiến trình nào $\leq$ Mức trần của tier $\to$ Vào tier phân vùng đó

**Siêu nhược điểm**: "Phân mảnh trong" - Cấp phát thừa, sử dụng ko hết 
*(VD: 200MB tiến trình đc cấp 120MB còn 80MB, tiến trình 120MB tiếp theo hết slot và ko sử dụng đc phần dôi ra đó)*

***MVT - "Multiprogramming with a Variable number of Task"***: Linh hoạt theo nhu cầu
Tiến trình cần bao nhiêu phát bấy nhiêu, khác cái trên ở điểm không chia tier nữa

**Nhược**: "Phân mảnh ngoài" - Khi mà tiến trình chết đi, nó để lại lỗ hổng
-> Cần Defragment: Xáo trộn, sắp xếp để khối rỗi được liên tục 
(*Thực ra Defragment tool trên window không chạy trên RAM mà chạy trên Disk, nhưng vì Disk cũng hoạt động giống MVT nên tham chiếu vào khái niệm này*)

*Có 3 chiến lược áp dụng MVT*: 
1. First-fit: Khối đầu tiên nhét vừa
2. Best-fit: Khối bé nhất nhét vừa
3. Worst-fit: Khối lớn nhất nhét vừa

### Cấp phát rời rạc (Paging)
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=04|1000]]
Để khắc phục được những điểm yếu do phân mảnh, ta sử dụng ***Paging - Phân trang***. Thay vì chỉ chia miếng đất, ta chia luôn cả lô hàng. Và lô hàng và miếng đất phải có size tương ứng.
- Frame: Là miếng đất đã được chia
- Page : Là lô hàng đã được chia, được đánh số như sau: 
	- Số hiệu trang (`p`): Làm index tới phần tử trong bảng trang
	- Offset trang (`d`): Địa chỉ tương đối trong trang

Đối với các tiến trình giống nhau *(nhiều instances)* thì cùng trỏ vào một vùng, data khác thì trỏ vào ô khác nhau

##### Các giải pháp cho các vấn đề của bảng trang
***Tiến trình trỏ vào vùng nhớ lung tung***
Do tiến trình blind với tình trạng của memory, nó chỉ biết đẩy lên bảng trang thôi. Vì vậy sẽ dẫn tới trường hợp đẩy vào ô đã có rồi.
Do đó, trong quá trình ánh xạ phải có thêm cột bit để check ánh xạ xem có valid không
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=05|600]]


***Giảm tốc độ khi truy cập bộ nhớ 2 lần***
Khi sử dụng bảng trang, mọi thao tác truy cập dữ liệu / lệnh cần 2 lần truy cập (1 vào bảng trang, 1 từ bảng trang vào ô nhớ)

Để giải quyết, ta sử dụng một bảng phụ có chức năng caching
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=06|70%]]
##### Cấu trúc bảng trang
***Bảng trang phân cấp***
Trên hệ thống lớn (32 / 64 bits), nếu chỉ sài 1 bảng trang, với mỗi tuple sẽ **tốn 8bytes để đánh index**
Giải pháp: Băm bảng trang thành **cấu trúc cây**
Với cơ chế **phân tách địa chỉ *(như hình dưới)***
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=07|80%]]
***Bảng trang băm***
Khi đã chặt thành bảng trang phân cấp rồi mà còn nhiều bit quá, nếu tạo thêm bảng phân cấp nữa sẽ gây ra nhiều nút thắt *(ko tiện nói)* Nên giải pháp đơn giản hơn là dùng hash ***(hiệu quả khi số bit >= 32)***
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=08|600]]
***Bảng trang ngược***
Một bảng duy nhất cho hệ thống:
- **Tấm gương phản chiếu** trạng thái RAM - RAM có bao nhiêu, bảng có bấy nhiêu
- Từ Frame vật lý có thể truy ngược ra tiến trình. 
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=09|800]]
Nhược: Thời gian tìm kiếm lâu 

![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=10|60%]]
## Phân đoạn
XẢY RA TRƯỚC PHÂN TRANG

Đây là layer bên trên phần cứng, giúp cho User có thể quản lý bộ nhớ theo cách "con người" hơn. 

Nó khá là giống [[Quản lý Bộ nhớ trong (Memory)#Cấp phát rời rạc (Paging)|Paging]] ở đoạn cấp phát bộ nhớ, khác ở chỗ thay vì chặt module thành vô vàn ô nhớ nhỏ *(khó để user quản lý)* thì nó gom bộ nhớ lại thành một khối *(giống [[Quản lý Bộ nhớ trong (Memory)#Cấp phát liên tục (MFT, MVT)|cấp phát liên tục]])* nhằm mục đích **bảo quản ý nghĩa của dữ liệu**

|**Tiêu chí**|**Paging (Phân trang)**|**Segmentation (Phân đoạn)**|
|---|---|---|
|**Bản chất chia nhỏ**|Chia mù quáng thành các Trang (Page) có **kích thước cố định** (thường là 4KB).|Chia theo logic (Code, Data, Stack) thành các Đoạn (Segment) có **kích thước biến đổi**.|
|**Góc nhìn**|Phục vụ Phần cứng (RAM vật lý).|Phục vụ Lập trình viên (Không gian logic).|
|**Bệnh Phân mảnh**|Gây ra **Phân mảnh trong** (Trang cuối cùng có thể không xài hết 4KB). Giải quyết triệt để Phân mảnh ngoài.|Gây ra **Phân mảnh ngoài** (RAM bị lủng lỗ chỗ lộn xộn). Không bị Phân mảnh trong.|
|**Kiểm soát ranh giới**|Không có Limit. Một trang có thể chứa nửa hàm `main()` và nửa mảng `Data`.|Quản lý bằng thanh ghi **Limit** chính xác đến từng byte. Tránh lỗi truy cập chéo cực tốt.|
|**Bảo mật / Quyền**|Khó thiết lập quyền. Vì 1 trang trộn lẫn cả Code (chỉ đọc) và Data (đọc/ghi).|Dễ dàng. Cấp quyền Chỉ đọc cho nguyên Đoạn Code, Quyền Đọc/Ghi cho nguyên Đoạn Data.|

![[Phân đoạn.excalidraw|7000]]
# Bộ nhớ ảo (Slide 7)

## Giới thiệu tổng quan về bộ nhớ ảo
> ***Cái ý tưởng (Trước kỷ nguyên Paging, đây chỉ đơn thuần gọi là Swapping):*** Khi bộ nhớ đầy (RAM), mà không có chỗ chứa thì ta đẩy các tiến trình ưu tiên ít hơn ra ổ đĩa *(swap out)* để ưu tiên các tiến trình quan trọn hơn chiếm dụng bộ nhớ. Khi nào tiến trình đó xong rồi thì ta lại lấy từ ổ cứng vào mem *(swap in)*
> 
> -> Khắc phục giới hạn của bộ nhớ. Nhưng ở thời chưa có bảng trang, nó sẽ xúc toàn bộ khối tiến trình liền mạch ra ổ cứng, gây ra nghẽn I/O. Thêm nữa, nếu tiến trình lớn hơn dung lượng bộ nhớ *(game 50GB chạy trên RAM 16GB)* thì sẽ không bao giờ thực hiện được
> 
>Để khắc phục điều đó, ta sử dụng **Virtual Memory với cơ chế của bảng trang** ==*(Virtual Memory chính là Swapping nhưng với Page)*==

---
***Cơ chế:*** Trigger bằng Page Fault -> Thực hiện 4 bước
1. ***Tìm trang `p` đang cần thay trên disk***
2. ***Tìm một frame rỗi `f`:***
	1. ***Nếu có: Chọn frame đó***
	2. ***Nếu không: Sử dụng thuật toán Thay thế trang***
3. ***Đặt trang `p` từ trong disk vào frame `f` mới tìm được. Cập nhật bảng trang***
4. ***Repeat***
---
=> Lúc RAM đang đầy thì mới kích hoạt Thay thế trang

![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 08.15.27.excalidraw|800]]

Có thể cài đặt thông qua
### ***Yêu cầu phân đoạn - Demand segmentation***:
OS nạp module logic (Cả một segment data) từ Disk lên RAM chỉ **khi nó được gọi**

Cơ chế yêu cầu: 
1. Chương trình gọi hàm logic A *(yêu cầu)*
2. OS check không thấy hàm A trên RAM -> Lỗi **Segment Fault**
3. OS chạy xuống Disk bốc hàm A lên RAM

*Nhược điểm*: Y hệt như [[Quản lý Bộ nhớ trong (Memory)#Cấp phát liên tục (MFT, MVT)|cấp phát liên tục]], vì là bốc lên cả khối vào RAM nên dễ bị dính phân mảnh ngoài, yêu cầu cần có sự thu gom (Compaction) để tạo ra khối rỗng

### ***Yêu cầu phân trang - Demand paging ⭐***:
OS nạp cái Page tương ứng với tiến trình từ ổ cứng lên **khi nó được gọi**
![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 09.27.47.excalidraw|650]]

Cơ chế yêu cầu:
1. Khi bắt đầu tiến trình, nó dựng lên bảng trang *(khởi tạo tất cả là invalid)*
2. OS bắt đầu thực hiện và tìm kiếm trong RAM
3. OS tìm kiếm không thấy -> Lỗi **Page Fault**
4. OS tạm dừng tiến trình, bốc đúng các phần bị Page Fault đó lên RAM
5. Sửa biến thành `Valid`, rồi từ đó quay ngược lại chạy ở những chỗ bị fault
=> Chạy đến đâu, cơ chế yêu cầu nổ ra đến đó *(bằng cơ chế Page Fault)*

>Page-fault, Segment-fault đóng vai trò là **một cơ chế yêu cầu**.
>Hay nói cách khác để Virtual Memory có thể hoạt động được thì việc để xảy ra các Fault là rất quan trọng
>
>Vậy nếu như không có frame nào rỗi thì sao *(RAM đầy)*? Ta sẽ sử dụng [[Quản lý Bộ nhớ trong (Memory)#Thay thế trang (Page replacement)|thuật toán thay thế trang]]. 

> [!PDF|] [[NLHDH-Week07-edit.pdf#page=12&selection=2,0,64,18|NLHDH-Week07-edit, p.12]]
> > Hiệu năng của yêu cầu trang ⚫ Tỷ lệ page-fault là p: 0  p  1.0 ⚫ nếu p = 0: Không có page-fault ⚫ nếu p = 1, mọi yêu cầu truy cập đến trang đều gây ra page-fault ⚫ Effective Access Time (EAT) EAT = (1 – p) x memory access + p (page fault overhead + [swap page out ] + swap page in + restart overhead
> 
> 

>[!important] Chốt lại: 
>- **Virtual Memory** hoạt động dựa trên cơ chế cốt lõi là [[Quản lý Bộ nhớ trong (Memory)#***Yêu cầu phân trang - Demand paging ⭐***|yêu cầu phân trang]]
>- Bản chất của Demand Paging là sử dụng **Page Fault** để báo hiệu việc thiếu dữ liệu. Khi Page Fault xảy ra, OS phải nạp trang từ Disk lên RAM.
> 
>[[Quản lý Bộ nhớ trong (Memory)#Thay thế trang (Page replacement)|Thuật toán thay thế trang]] KHÔNG PHẢI là một cách khác để làm Virtual Memory. Nó chỉ là một cơ chế "chữa cháy" được gọi đến ở bước cuối cùng của quy trình Page Fault, xảy ra **CHỈ KHI RAM ĐÃ ĐẦY** và OS bắt buộc phải tìm một nạn nhân để đá ra ngoài.

### Dựa vào Virtual Memory, ta có thể cải thiện trong việc [[Quản lý Tiến trình (Processing)#^fa650a|tạo tiến trình]]:
##### Copy-on-Write
>Khi gọi tiến trình con `fork()`, OS phải copy toàn bộ cục RAM của Cha sang vùng mới của Con
>-> Siêu lãng phí RAM
>
>Khi dùng bảng trang, nó chỉ tạo một bảng trang mới cho Con, và trỏ toàn bộ các trang dùng chung vào vùng RAM Cha đang dùng

Cho phép cha và con **dùng chung trang trong bộ** nhớ khi mới khởi tạo tiến trình con.
Khi nào có sự khác biệt *(bằng cơ chế Page Fault, gọi là **Protection Fault**, nổ ra khi đụng chạm, tác động vào biến Read-only để nổ Fault)* mới cho phép copy sang Frame mới bằng cơ chế yêu cầu như ở Virtual Memory
![[3_Assets/Quản lý Bộ nhớ trong 2026-05-21 14.33.56.excalidraw.md#^frame=11|70%]]
##### Memory-Mapped Files - Các file ánh xạ bộ nhớ
Xài disk như memory bằng cơ chế Demand Paging
![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 10.24.04.excalidraw]]
## Các vấn đề của bộ nhớ ảo và cách giải quyết

#### Thay thế trang (Page replacement)
>Bây giờ ta không chỉ là swap-in, swap-out đơn thuần, mà là thứ tự ưu tiên / chọn cái nào ra, cái nào vào bộ nhớ ảo. Ta sử dụng các thuật toán sau: 

Đây là cốt lõi xóa đi khác biệt của bộ nhớ ảo và thật

![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 10.46.58.excalidraw]]
Cách thức đánh giá thuật toán: 
- Cần tỉ lệ Page-fault thấp nhất 
  *(một cú Page-fault là 1 lần CPU bị đóng băng để chờ ổ cứng, và nếu thuật toán ngu nó còn bốc những thằng chuẩn bị dùng tới -> lại trigger thêm)*
- Test bằng mô phỏng *(giả sử RAM có 3 frame, xem thuật toán nhiều fault hơn)*. Sử dụng chuỗi tham chiếu
> [!PDF|] [[NLHDH-Week07-edit.pdf#page=20&selection=26,0,26,35|NLHDH-Week07-edit, p.20]]
> > 1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5.
> 
> 
##### FIFO
Đây là các tiếp cận ban đầu
![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 11.08.17.excalidraw|700]]
![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 11.12.37.excalidraw|800]]
Hoạt động theo QUEUE, thằng cũ nhất thì swap-out, thằng mới thì swap-in
##### Optimal
Optimal sẽ nhìn chuỗi sequence tiếp theo *(nhìn về tương lai)*
Mỗi page có một biến đếm **khoảng cách tới khi nó được gọi lần nữa** trong tương lai
Thằng nào có số lớn nhất sẽ bị kick

>Đơn giản là Priority queue (Max-heap) với biến khoảng cách 
##### LRU - Least Recently Used
Nếu [[Quản lý Bộ nhớ trong (Memory)#Optimal|OPT]] là nhìn về tương lai, LRU lại nhìn về quá khứ 
Tìm thằng bị hắt hủi lâu nhất để lôi ra trảm

Mỗi page có một biến đếm. Liên tục cập nhật từ lần cuối cùng nó được gọi
Khi được gọi, nó ngoi lên head

Cài đặt bằng double linked-list ***(bài toán đưa một phần tử thứ i trong linked list lên head) - thao tác cần thay đổi 6 con trỏ***
Khi cần thay thế chỉ cần lấy head, ko cần tìm kiếm

![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 12.12.13.excalidraw]]

***Nhược:*** Overhead (chi phí) khá tốn khi phải cập nhật con trỏ ở mọi nhịp gọi

##### Second-Chance (Thuật toán xấp xỉ LRU)
>aka thuật toán đồng hồ

Vì LRU khá tốn, nên ta sài cái này để bắt chước kq của LRU

Sử dụng bit tham chiếu, đánh số các trang được sử dụng (1) / chưa sử dụng (0)
![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 12.16.36.excalidraw]]
*Nối hết khung RAM vào thành vòng tròn. 
Và có con trỏ "kim đồng hồ" trỏ vòng quanh cái đồng hồ:*
- *Nếu bit 1 (gần đây có sử dụng, CPU sẽ có trách nhiệm lật bit này từ 0->1) thì gạt về 0 **(cho cơ hội thứ 2)***
- *Nếu bit 0 (lâu rồi không dùng) -> Trảm*

>[!question] Cấp phát và thay thế?
>Giờ chúng ta đã biết đá ai và cho ai vào rồi. 
>Nhưng cấp phát cho mỗi đứa bao nhiêu thì sao? Có những chiến lược cấp phát gì?
#### Cấp phát frame
***Cấp phát cố định***: 
- Cào bằng - Mỗi đứa nhận $m/n$ frame với ($m$ khung và $n$ tiến trình)
- Cấp phát theo tỉ lệ - Thằng to thì ăn nhiều hơn và ngược lại. Nhân với trọng số size ${\frac{s_{i}}{\text{Tổng size}}} \times m$
***Cấp phát ưu tiên***: Dựa vào độ ưu tiên (đã được định sẵn do người xác định)
***Cấp phát tổng thể và cục bộ***: 
- Cấp phát tổng thể: A thiếu, A cướp của B *(để tăng ultility)* - Không ổn định, cướp B thì B lấy gì mà ăn -> Treo
- Cấp phát cục bộ: A chỉ được phép đá chính các trang của mình *(cách ly tốt, ko ảnh hưởng đến ng khác)* - Kém hiệu quả, có thể A thừa B đói nhưng ko cho nhau mượn đc
### Thrashing
Là một vấn đề khi không có đủ trang -> Luôn dẫn tới Page-fault để giúp kéo bớt frame cho nó -> Nhưng tài nguyên quá hạn hẹp, ko thể kéo thêm *(kéo Page-fault này lại gây ra Page-fault khác)* 
=> Gây ra hiện tượng Thrashing

![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 12.40.26.excalidraw]]
*Làm sao biết được cái điểm hài hòa kia - CPU Ultility cao nhưng nhích thêm chút là rớt*
Ta tính công thức:
$$
\begin{cases}
	D > m: \text{Vỡ nợ} \\
	D \leq m: \text{Ai cũng có phần}
\end{cases}
$$
Trong đó: 
- $D$ (Demand): Mức độ đa nhiệm *(số tiến trình)*. Tính bởi công thức $D = \sum WSS_{i}\text{ (WSS - Working Set Size)}$
- $m$ (Memory): Tổng số frame vật lý

![[Quản lý Bộ nhớ trong (Memory) 2026-06-08 12.53.09.excalidraw|700]]
Chỉ cấp cho những thằng nào trong khoảng $\Delta$ này, khoảng $\Delta$ là working set. 
Đây là **số lượng khung trang cần thiết để tiến trình chạy được mà ko bị page-fault liên tục**