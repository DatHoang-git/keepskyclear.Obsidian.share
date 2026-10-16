---
created: 2026-10-13
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Khai phá dữ liệu - INT3209E 3|Data Mining]]"
---
---
/src: 
[[5. Phan cum.pdf]]

# Tổng quan
**Objectives:** Gom các đối tượng dữ liệu thành từng nhóm / cụm sao cho chúng tương đồng theo một tiêu chí nào đó

**Đặc điểm**:
- Số cụm ko được biết trước chính xác
- Nhiều cách tiếp cận, tùy thuộc vào bài toán. Tiếp cận khác nhau cho kq khác nhau

**Các kiểu phân cụm**:
- Phân cụm cứng: Một điểm chỉ thuộc vào 1 cụm
- Phân cụm mềm: Một điểm data thuộc về nhiều cụm

# Các phương pháp
### Các độ đo khoảng cách
![[5. Phan cum.pdf#page=12&rect=59,353,630,441|5. Phan cum, p.12]]

Các độ đo khoảng cách:
##### ***Euclid***:
   ![[5. Phan cum.pdf#page=13&rect=319,314,557,383|5. Phan cum, p.13]]
##### Manhattan (Euclide *r = 1*)
##### ***Cosine***:
   ![[5. Phan cum.pdf#page=14&rect=283,243,581,333|5. Phan cum, p.14]]
   Nếu muốn tính khoảng cách --> $d(x, y) = 1-sim(x,y)$
##### ***Hamming***:
   Đếm xem có mấy vị trí khác nhau, cho vector dạng logic $0/1$
##### ***Jaccard***:
   Sử dụng cho 2 tập hợp. Tính bằng 2 cái giao nhau / 2 cái hợp nhau
   ![[5. Phan cum.pdf#page=16&rect=166,215,708,392|5. Phan cum, p.16]]
   VD:
   [ 1 1 0 1 0 1 ]
   [ 1 0 0 1 1 0 ]
   Giao: 2 *(Cả 2 đều 1)*
   Hợp: 5 *(Ít nhất 1 cái là 1)*
   
##### ***Kullback - Leibler*** (KL divergence)
   Thiên về hướng phân cụm mềm. Đo cái entropy. Y hệt [[Buổi 5 - Cây quyết định#Node Impurity|entropy của lý thuyết thông tin]]
   ![[5. Phan cum.pdf#page=17&rect=154,89,718,451&color=yellow|5. Phan cum, p.17]]
   Khoảng cách ***về phân phối***

### Các phương pháp quan trọng
##### Phân cụm phân cấp (Hierachical clustering)
*Phương pháp Bottom-up*
Khởi đầu mỗi điểm là một cụm, sát nhập các cụm gần nhau nhất thành một cụm lớn hơn
>Sát nhau như thế nào? Làm sao biết được 2 cụm gần nhau nhất?
>- Tính theo centroid *(cơ bản / thông thường nhất)*
>- Tính theo 2 điểm gần nhau nhất của 2 cụm
>- Tính theo 2 điểm xa nhất ...
>- Tính dựa trên radius / diameter của cụm tạo thành. Cụm tạo thành có bán kính nhỏ hơn thì lấy, ko lấy thằng to hơn

![[5. Phan cum.pdf#page=30&rect=67,99,731,470&color=yellow|5. Phan cum, p.30]]
Cây này được gọi là ***dendrogram***, mang thông tin về dữ liệu để có insights về xử lý sau

>[!question]- (cho buổi sau) Khi đi theo pp top down, thì làm kiểu gì? Chia ra kiểu gì
>My answer: 
>Dựa vào phân phối của nó
##### Phân cụm phân hoạch (K-means)
Xem thêm ở [[K-means clustering]]
Khởi đầu với k tâm điểm của k cụm. 
Lặp đi lặp lại việc gán các điểm vào các cụm có tâm cụm gần nhất, tính toán lại cho đến khi hội tụ (khi sự thay đổi nhỏ quá nhỏ, k dịch đáng kể)

Làm sao tìm được k? 
- PP thử sai (trial and error). Xem slide [[5. Phan cum.pdf#page=46&rect=26,56,723,496&color=yellow|5. Phan cum, p.46]].
  Một cụm đủ tốt thì bán kính nó sẽ bán kính vừa vừa thoi, ta plot nó với x = số cụm ra biểu đồ khuỷu tay

Mục tiêu tối ưu:
![[5. Phan cum.pdf#page=39&rect=145,64,721,458&color=yellow|5. Phan cum, p.39]]

***Thuật toán:***
Khởi tạo tâm K
1. Assignment step: Gán điểm dl cho cụm gần nhất S nào đó. 
2. Update step: Tính toán lại tâm cụm
Thỏa mãn đk dừng thì dừng, ko thì lặp

#### Ưu nhược của K-means
Ưu:
- Dễ thi hành, triển khai
- Dễ hiểu
- Độ phức tạp là $O(tknm)$: t là số vòng lặp, k là số cụm, n là đối tượng dl cần phân cụm, m là số chiều kg biểu diễn

Nhược:
Ko phù hợp với các dạng dữ liệu phân tán, mang hình dáng kì dị
##### Phân cụm dựa trên mật độ (DBSCAN)
