---
share_link: https://share.note.sx/qxjykves#S0Tk/KQY6HUC3I5a9/MEb0+vo4oU3ytMkL3TdkHtS5s
share_updated: 2025-08-12T19:07:31+07:00
jupyter:
  jupytext:
    cell_metadata_filter: -all
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.17.2
  kernelspec:
    display_name: Python (jupy)
    language: python
    name: jupy
---

2025-08-12 08:47

Tags: 

-----------------------
> [!PDF|] [[Basic_ML_colored.pdf#page=122&selection=20,0,25,38|Basic_ML_colored, p.110]]
> > Trong K-means clustering, chúng ta không biết nhãn của từng điểm dữ liệu. Mục đích là làm thể nào để phân dữ liệu thành các cụm (cluster) khác nhau sao cho dữ liệu trong cùng một cụm có những tính chất giống nhau.

##### ***What?***
Đây là một mô hình thuật toán [[ML Overview#***--- Unsupervised ---***|unsupervised]] đơn giản 

![[3-Material/Basic_ML_colored 7.png]]
	*[[Basic_ML_colored.pdf#page=123&rect=97,503,525,715|Basic_ML_colored, p.111]]*
Thuật toán này nhằm xác định đâu là **ranh giới giữa các "đảo"** như ở trên

Trong toán học, nó là bài toán [Voronoi diagram - Wikipedia](https://en.wikipedia.org/wiki/Voronoi_diagram): Phân chia dựa trên khoảng cách tới 1 điểm

>[!tldr]
>Tóm lại mục tiêu thuật toán này như sau
>- Tìm centroid (điểm ở giữa)
>- Phân loại các data point vào các nhóm tương ứng

##### Phân tích toán học
- Ta có training set $X=[x_{1}, x_{2},\dots ,x_{N}] \in \mathbb{R}^{d \times N}$, cần tìm centroid $m_{1}, m_{2}, \dots, m_{k} \in \mathbb{R}^{d \times 1}$
- Vấn đề đặt ra là đánh label kiểu gì *(vốn dĩ đã k có label)*?
	Kỹ thuật *one-hot coding*: Label được biểu diễn bằng vector hàng có k phần tử *(số số cụm)*, phần tử ở vị trí đang duyệt bằng 1, tất cả k-1 phần tử còn lại bằng 0
	>  VD: Mỗi vector label sẽ có **3 phần tử**.
		- Một điểm dữ liệu thuộc Cụm 1 sẽ có vector label là \[1, 0, 0\].
		- Một điểm dữ liệu thuộc Cụm 2 sẽ có vector label là \[0, 1, 0\].
		- Một điểm dữ liệu thuộc Cụm 3 sẽ có vector label là \[0, 0, 1\].
$$
y_{ij} \in \{0, 1\} , \forall i, j; \sum_{j=1}^K y_{ij}=1, \forall i
$$

##### ***K-means clustering in practice***
***Import dữ liệu***
```python
import numpy as np
import matplotlib.pyplot as plt

# Dữ liệu điểm thi (Toán, Lý) của 15 học sinh
# Chỉ cần copy toàn bộ khối này
X = np.array([
    [2.0, 3.0],   # Học sinh 1
    [2.5, 4.0],   # Học sinh 2
    [1.0, 2.0],   # Học sinh 3
    [3.0, 2.5],   # Học sinh 4
    [8.0, 9.0],   # Học sinh 5
    [9.5, 8.5],   # Học sinh 6
    [10.0, 7.5],  # Học sinh 7
    [9.0, 9.5],   # Học sinh 8
    [5.0, 4.0],   # Học sinh 9
    [6.0, 6.0],   # Học sinh 10
    [4.5, 5.5],   # Học sinh 11
    [7.0, 5.0],   # Học sinh 12
    [1.5, 1.0],   # Học sinh 13
    [9.0, 7.0],   # Học sinh 14
    [5.5, 7.0]    # Học sinh 15
])

# In ra để kiểm tra
#print("Ma trận dữ liệu X:")
#print(X)
#print("\nKích thước của X:", X.shape) # Kết quả sẽ là (15, 2)

 
# Bạn có thể vẽ nó lên để xem
plt.figure(figsize=(8, 6))
# X[:, 0] là cột đầu tiên (Điểm Toán)
# X[:, 1] là cột thứ hai (Điểm Lý)
plt.scatter(X[:, 0], X[:, 1], s=50, edgecolors='k') # s là kích thước điểm, edgecolors là viền đen
plt.title("Dữ liệu điểm thi của 15 học sinh")
plt.xlabel("Điểm Toán")
plt.ylabel("Điểm Lý")
plt.grid(True)
plt.show()
```

***Khởi tạo tâm cụm***
```python
k = 3
m = X[np.random.choice(X.shape[0], size=k, replace=False)] # lay random 3 data point tu X
plt.scatter(X[:, 0], X[:, 1], color='blue')  # toàn bộ dữ liệu
plt.scatter(m[:, 0], m[:, 1], color='red', marker='x')
plt.show()
```
>Cú pháp m[:, 0] là slicing, nghĩa là lấy tất cả giá trị cột 0 thành mảng 1D


###### Sai số của K-means clustering
$$
||x_i-m_{k}||_{2}^2 = y_{ij}||x_{i}-m_{k}||_{2}^2 = \sum_{j=1}^Ky_{ij}||x_{i}-m_{j}||_{2}^2
$$
Sai số được đo bằng khoảng cách của từng điểm $x_i$ đến tâm $m_j$ 
> Tại sao lại lôi được $y_{ij}$ ra, vì là do cách đánh label $y_{ij} \in \{0, 1\} , \forall i, j; \sum_{j=1}^K y_{ij}=1, \forall i$ .
> $y_{ij}$ bằng 1 nếu $x_i$ thuộc cụm $j$, bằng 0 nếu trong trường hợp khác 

```python
def euclide_distance(X, m):
	X_temp = np.sum(X*X, axis = 1, keepdims=True)
	m_temp = np.sum(m*m, 1)
	cross = X @ m.T
	return X_temp + m_temp - 2*cross # cho nay da bao gom broadcasting roi
print(euclide_distance(X, m))
#print(X.shape, m.shape)
```
> *Hàm trên đã tính được khoảng cách từ một điểm đến k điểm centroid*

> *cần phân biệt @ và np.dot()*

> *ở trên ta đã áp dụng ![[K-nearest neighbors#^567068|công thức tối ưu của khoảng cách Euclide]]

###### Loss function cho K-means clustering
$$
\begin{array} \\
\mathcal{L}(Y,M) = \frac{1}{N} \sum_{i=1}^N \sum_{j=1}^K y_{ij}||x_{i}-m_{j}||_{2}^2 \\ \\

\text{satisfied: } y_{ij} \in \{0,1\}, \forall i,j; \sum_{j=1}^K=1, \forall i
\end{array}
$$
> Lấy sai số từng điểm, cộng và chia trung bình

Trong đó: 
- $M$ : ma trận tạo mở $K$ centroid
- $Y$ : ma trận gán nhãn *(chứa $y_{ij}$)*
-> Tìm Y, M sao cho $\mathcal{L}$ đạt min

có 2 cách để làm:
1. Giữ nguyên M, gán nhãn Y
2. Giữ nguyên Y, M thay đổi theo


###### Giữ M, gán Y

```python
Y_label = np.zeros((15,k), dtype=int)

# duyet cac data points
#for i in range(X.shape[0]):
#	min_dist_idx = np.argmin(euclide_distance(X[i], m))
#	Y_label[0, :] = 0
#	Y_label[i][min_dist_idx] = 1

dist = euclide_distance(X, m)
labels = np.argmin(dist, 1)

#---- this down here is fineonger
#for i in range(X.shape[0]):
#	Y_label[i][labels[i]] = 1

# ---- dis is better
Y_label[np.arange(X.shape[0]), labels] = 1
	
print(f'Label index:{labels}')
print(f'Y label :{Y_label}')
```

``np.arange(<number>): tao mang so nguyen tu 0 -> <number> - 1``

```python
h = 0.05  # độ mịn
x_min, x_max = X[:,0].min() - 1, X[:,0].max() + 1
y_min, y_max = X[:,1].min() - 1, X[:,1].max() + 1
xx, yy = np.meshgrid(np.arange(x_min, x_max, h),
                     np.arange(y_min, y_max, h))

# 2. Gán label cho từng điểm trên grid
grid_points = np.c_[xx.ravel(), yy.ravel()]
dist_grid = euclide_distance(grid_points, m)
labels_grid = np.argmin(dist_grid, axis=1)

# 3. Vẽ nền
plt.contourf(xx, yy, labels_grid.reshape(xx.shape), alpha=0.3, cmap=plt.cm.Paired)

# Vẽ dữ liệu và centroid
plt.scatter(X[:, 0], X[:, 1], c=labels, edgecolor='k', cmap=plt.cm.Paired)
plt.scatter(m[:, 0], m[:, 1], marker='x', color='red', s=200)

plt.show()
```

###### Giữ Y, gán M

```python
import numpy as np

# 1. DỮ LIỆU GỐC (X)
X = np.array([
    [2.0, 3.0], [2.5, 4.0], [1.0, 2.0], [3.0, 2.5], [8.0, 9.0],
    [9.5, 8.5], [10.0, 7.5], [9.0, 9.5], [5.0, 4.0], [6.0, 6.0],
    [4.5, 5.5], [7.0, 5.0], [1.5, 1.0], [9.0, 7.0], [5.5, 7.0]
])

# 2. TÂM CỤM HIỆN TẠI (M cũ)
# Giả sử đây là các tâm cụm sau một bước khởi tạo cố định
m_cu = X[np.random.choice(X.shape[0], size=3, replace=False)]

# 3. NHÃN ĐÃ ĐƯỢC GÁN (Y, biểu diễn bằng vector `labels`)
# Dựa trên m_cu ở trên, mỗi điểm đã được gán vào cụm gần nhất
# 0 nghĩa là thuộc cụm 0, 1 là thuộc cụm 1, v.v.
labels = np.array([0, 0, 0, 0, 2, 2, 2, 2, 1, 1, 1, 1, 0, 2, 1])

# In ra để kiểm tra
plt.scatter(X[:, 0], X[:, 1], color='blue')  # toàn bộ dữ liệu
plt.scatter(m_cu[:, 0], m_cu[:, 1], color='red', marker='x')
plt.show()
```

```python
# Số cụm
k = 3

# Tạo một ma trận rỗng để chứa kết quả tâm mới
m_moi = np.zeros((k, X.shape[1]))

print("\n--- BẮT ĐẦU TÍNH M MỚI ---")

# Lặp qua từng cụm từ 0 đến k-1
for j in range(k):
    # 1. Lấy tất cả các điểm dữ liệu có nhãn là j
    points_in_cluster = X[labels == j]
    print(f"\nCác điểm trong cụm {j}:\n{points_in_cluster}")
    
    # 2. Tính trung bình cộng của các điểm này để ra tâm mới
    # axis=0 nghĩa là tính trung bình theo cột (tính trung bình cho điểm Toán, và trung bình cho điểm Lý)
    if len(points_in_cluster) > 0:
        m_moi[j, :] = np.mean(points_in_cluster, axis=0)
    else:
        # Trường hợp hiếm gặp: một cụm không có điểm nào
        # Giữ nguyên tâm cũ hoặc chọn lại một tâm ngẫu nhiên
        m_moi[j, :] = m_cu[j, :]

print("\n--- KẾT QUẢ ---")
print("Tâm cụm mới đã được cập nhật (M mới):\n", m_moi)
```

>[!tldr]
>![[3-Material/Basic_ML_colored 8.png]]
>[[Basic_ML_colored.pdf#page=126&rect=58,273,562,718|Basic_ML_colored, p.114]]

###### Ví dụ trong sách
```python
from __future__ import print_function 
import numpy as np 
import matplotlib.pyplot as plt 
from scipy.spatial.distance import cdist 
import random 
# np.random.seed(18) 

means = [[2, 2], [8, 3], [3, 6]] # tao seed cho random generator, tai 3 points
cov = [[1, 0], [0, 1]] # covariance matrix
N = 100
X0 = np.random.multivariate_normal(means[0], cov, N) #doan nay la sinh data points xung quanh cac seed, theo phan phoi chuan da bien
X1 = np.random.multivariate_normal(means[1], cov, N) 
X2 = np.random.multivariate_normal(means[2], cov, N) 
X = np.concatenate((X0, X1, X2), 0) # noi vao mot mang 
K = 3 # 3 clusters 
original_label = np.asarray([0]*N + [1]*N + [2]*N).T

#print(X, original_label)
plt.scatter(X[:, 0], X[:,1], edgecolor='k')
```

> Ta dùng ``c_dist`` để tính khoảng cách

```python
def kmeans_init_centroids(X, k): 
	# randomly pick k rows of X as initial centroids 
	return X[np.random.choice(X.shape[0], k, replace=False)] 

def kmeans_assign_labels(X, centroids): 
	# calculate pairwise distances btw data and centroids 
	D = cdist(X, centroids) 
	# return index of the closest centroid 
	return np.argmin(D, axis = 1) 
	
def has_converged(centroids, new_centroids): 
	# return True if two sets of centroids are the same 
	return (set([tuple(a) for a in centroids]) == 
		set([tuple(a) for a in new_centroids])) 
		
def kmeans_update_centroids(X, labels, K): 
	centroids = np.zeros((K, X.shape[1])) 
	for k in range(K): 
		# collect all points that are assigned to the k-th cluster 
		Xk = X[labels == k, :] 
		centroids[k,:] = np.mean(Xk, axis = 0) # then take average 
	return centroids
```

> [!PDF|] [[Basic_ML_colored.pdf#page=127&selection=146,0,165,42|Basic_ML_colored, p.115]]
> > 1. kmeans_init_centroids để khởi tạo các centroids ban đầu. 
> > 2. kmeans_asign_labels để tìm label mới cho các điểm khi cố định các centroid. 
> > 3. kmeans_update_centroids để cập nhật các centroid khi biết label của mỗi điểm dữ liệu. 
> > 4. has_converged để kiểm tra điều kiện dừng của thuật toán.
> 
> 

```python
def kmeans(X, K): 
	centroids = [kmeans_init_centroids(X, K)] 
	labels = [] 
	it = 0 
	while True: 
		labels.append(kmeans_assign_labels(X, centroids[-1])) 
		new_centroids = kmeans_update_centroids(X, labels[-1], K) 
		if has_converged(centroids[-1], new_centroids): 
			break 
		centroids.append(new_centroids) 
		it += 1 
	return (centroids, labels, it)
```

```python

def kmeans_display(X, label, centroids):
    K = np.amax(label) + 1
    X0 = X[label == 0, :]
    X1 = X[label == 1, :]
    X2 = X[label == 2, :]
    
    plt.figure(figsize=(10, 8))
    
    # Vẽ các điểm dữ liệu
    plt.plot(X0[:, 0], X0[:, 1], 'b^', markersize = 4, alpha = .8, label='Cụm 0')
    plt.plot(X1[:, 0], X1[:, 1], 'go', markersize = 4, alpha = .8, label='Cụm 1')
    plt.plot(X2[:, 0], X2[:, 1], 'rs', markersize = 4, alpha = .8, label='Cụm 2')

    # Vẽ các tâm cụm
    plt.plot(centroids[:, 0], centroids[:, 1], 'y*', markersize = 15, markeredgecolor='k', label='Tâm cụm')
    
    plt.title('Kết quả phân cụm K-Means', fontsize=16)
    plt.xlabel('Đặc trưng 1', fontsize=12)
    plt.ylabel('Đặc trưng 2', fontsize=12)
    plt.legend()
    plt.grid(True)
    plt.show()


(centroids_history, labels_history, iterations) = kmeans(X, K) 

# Lấy kết quả cuối cùng từ lịch sử
final_centroids = centroids_history[-1]
final_labels = labels_history[-1]

print('Các tâm cụm tìm được bởi thuật toán:\n', final_centroids)
print('Số vòng lặp để hội tụ:', iterations)

# Gọi hàm vẽ đồ thị với kết quả cuối cùng
kmeans_display(X, final_labels, final_centroids)
```


##### Các hạn chế của K-means clustering
- Số lượng cluster cần xác định trước
- Nghiệm cuối cùng phụ thuộc vào centroid khởi tạo
- Các cluster cần có số lượng điểm gần bằng nhau
  ![[Pasted image 20250812154855.png|500]]
- Cluster cần có hình cầu/tròn
  ![[Pasted image 20250812154950.png|500]]
- Các cluster này bao bọc cluster khác
  ![[Pasted image 20250812155001.png|500]]
-> Đưa ra các dự đoán sa

##### Các ứng dụng khác của K-means clustering (?th)
![[3-Material/Basic_ML_colored 9.png]]
	*[[Basic_ML_colored.pdf#page=137&rect=60,136,553,190|Basic_ML_colored, p.125]]*

