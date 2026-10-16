---
created: 2026-09-17
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Học máy + Machine learning|ML]]"
---
---
# Statistics - Probality
KWs:
- *Random Variable* - Biến ngẫu nhiên
 >Thế nào là ngẫu nhiên?
 >chịu, thầy giảng trên lớp nma ko nghe

```python
import numpy as np
random = np.random.default_rng(42)

x = random.random()
print(x)
```

- *Probability Density Function* - Hàm mật độ xác suất
![[Buổi 2 - Các khái niệm cơ bản + Ôn tập XSTK .excalidraw]]
```python
# cho 1 phan phoi deu 0, 1
# x = np.linspace(0, 1, 1000)

# tao phan phoi chuan
v = np.sum((x - np.mean(x))**2)/(len(x) - 1) # variance
print(v)

def normal_dist(x):
	
	return (1 / (np.sqrt(2*np.pi*v))) * np.exp(-(x - np.mean(x)**2)/(2*(v**2))) 
```

```python
def pdf(a, b, g, dist=normal_dist):
	x = np.linspace(a, b, g)
	return np.sum(dist(i)*(np.abs(a-b)/(g-1)) for i in x)

print(pdf(0.1, 0.2, 100, normal_dist))
```



# Data distribution
# Measurements
### Entropy / Cross Entropy
### Mutual Information
### Kullback-leibler Divergence