---
created: 2026-09-16
tags:
category:
  - "[[Class]]"
  - "[[Skill]]"
subject:
  - "[[Class. Học máy + Machine learning|ML]]"
---
---
# Giới thiệu về ML
> [!PDF|] [[Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk).pdf#page=30&selection=18,0,22,4|Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk), p.4]]
> > [Machine Learning is the] field of study that gives computers the ability to learn without being explicitly programmed. —Arthur Samuel, 1959

> [!PDF|] [[Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk).pdf#page=30&selection=26,0,31,4|Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk), p.4]]
> > A computer program is said to learn from experience E with respect to some task T and some performance measure P, if its performance on T, as measured by P, improves with experience E. —Tom Mitchell, 1997

ML basiclly là một kiểu lập trình mới. 
- Lập trình truyền thống: Vấn đề A -> Tạo thuật toán / phần mềm -> Đánh giá -> Sai / Sửa
- ML: Thêm Data, rồi để máy tự học

ML shines in: 
- problems need a lot of hand-tuning / long lists of rules
- Problems that complex / no known algorithm
- Help human learn? 
  ![[Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk).pdf#page=33&rect=64,273,435,483|Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk), p.7]]
  > *the light bulb indicates insights -> Data mining*
- adapting to new data

> [!question] Attribute với feature khác gì nhau? 
> *attribute* mang nghĩa là kiểu data
> *feature* tùy context, thường dc hiểu là attribute + value

> [!tip] Về việc giảm chiều dữ liệu
> > [!PDF|] [[Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk).pdf#page=38&selection=21,0,26,12|Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk), p.12]]
> > It is often a good idea to try to reduce the dimension of your train‐ ing data using a dimensionality reduction algorithm before you feed it to another Machine Learning algorithm (such as a super‐ vised learning algorithm). It will run much faster, the data will take up less disk and memory space, and in some cases it may also per‐ form better.

SemiSupervised learning: mix 2 loại

### Giới thiệu về các tác vụ / thuật toán
Set các features đc gọi là *predictors*
Supervised learning:
- Classification
- Regression

Unsupervised learning:
- ==Clustering==:
	- K-Means
	- *DBSCAN*
	- *Hierarchical Cluster Analysis (HCA)*
- Anomaly detection and novelty detection: Phát hiện outlier, that's it
- ==Visualization==:
	- *PCA / Kernel PCA*
	- *LLE (Locally-Linear Embedding)*
	- *t-SNE*
- Association rule learning
	- Apriori
	- Eclat

##### Batch learning / Online learning
- Batch learning (offline learning): Feed data theo data có sẵn (Hệ thống đc train trước --> Mang đi triển khai và ko train nữa). Ko cập nhật param khi data mới đến
- Online learning *("incremental learning", vì cái này có thể chạy đc offline)*: Feed data mới từng chút một (mini-batch). Cập nhật param khi data mới đến

>[!bug] Chú ý
>mini-batch $\neq$ online learning
>- Batch learning hoàn toàn có thể sài mini-batch
>- Online learning cũng vậy.
>
>khác ở phần sự available của data và cập nhật param

Loại hệ thống ko fit được toàn bộ data vào mem --> **out-of-core learning** --> sài online learning
![[Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk).pdf#page=43&rect=60,234,439,430|Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow (Aurélien Géron) (z-library.sk, 1lib.sk, z-lib.sk), p.17]]

##### Instance-Based VS Model-Based Learning
- *Instance-base learning*: Learn by heart - Học thuộc --> Đo *similarity* (KNN)
- *Model-based learning*: 

# Các vấn đề lớn trong ML

# Kiểm chứng và kiểm thử (testing / validating)
