## 1. TÌM KIẾM MÙ (Uninformed Search)
Ký hiệu: **$b$** (Hệ số phân nhánh), **$d$** (Độ sâu nghiệm cạn nhất), **$m$** (Độ sâu tối đa), **$C^*$** (Chi phí nghiệm tối ưu), **$\epsilon$** (Chi phí bước nhỏ nhất).

| Thuật toán | Tính đầy đủ | Tính tối ưu | Thời gian | Không gian | Ưu / Nhược điểm chính |
|:---|:---:|:---:|:---|:---|:---|
| **BFS** (Theo chiều rộng) | **Có** (nếu $b$ hữu hạn) | **Có** (nếu chi phí bước = 1) | $O(b^d)$ | $O(b^d)$ | **Ưu:** Tìm được nghiệm cạn nhất.<br>**Nhược:** Tốn quá nhiều bộ nhớ. |
| **DFS** (Theo chiều sâu) | **Không** (kẹt vòng lặp) | **Không** | $O(b^m)$ | $O(bm)$ | **Ưu:** Tiết kiệm bộ nhớ.<br>**Nhược:** Dễ đi vào nhánh vô hạn/không tối ưu. |
| **UCS** (Chi phí đồng nhất) | **Có** (nếu $\epsilon > 0$) | **Có** | $O(b^{1+\lfloor C^*/\epsilon \rfloor})$ | $O(b^{1+\lfloor C^*/\epsilon \rfloor})$ | **Ưu:** Tối ưu mọi mức chi phí.<br>**Nhược:** Duyệt lan man mọi hướng, chậm. |
| **IDS** (Sâu dần lặp) | **Có** (nếu $b$ hữu hạn) | **Có** (nếu chi phí bước = 1) | $O(b^d)$ | $O(bd)$ | **Ưu:** Kết hợp ưu điểm bộ nhớ DFS + tối ưu BFS.<br>**Nhược:** Lặp lại việc xét đỉnh mức trên. |

---

## 2. TÌM KIẾM KINH NGHIỆM (Heuristic Search)
Công thức cốt lõi: **$f(n) = g(n) + h(n)$**
*   **$g(n)$**: Chi phí thực tế từ gốc tới $n$.
*   **$h(n)$**: Chi phí ước lượng (Heuristic) từ $n$ tới đích.

### Các thuật toán:
*   **Tham lam (Greedy Best-First Search)**: 
    *   Công thức: **$f(n) = h(n)$**.
    *   Dấu hiệu: Luôn chọn đỉnh có vẻ gần đích nhất, bỏ qua đường đã đi. Dễ lạc vào cực tiểu cục bộ, không tối ưu.
*   **A***:
    *   Công thức: **$f(n) = g(n) + h(n)$**.
    *   Dấu hiệu: Cân bằng giữa chi phí đã trả và chi phí ước lượng.

### Điều kiện của một hàm Heuristic:
*   **Chấp nhận được (Admissible)**: $0 \le h(n) \le h^*(n)$
    *   *Dấu hiệu:* **Không bao giờ đánh giá quá cao** chi phí thực tế ($h^*$). Cần thiết để A* tối ưu trên **Tree Search**.
*   **Nhất quán (Consistent/Monotonic)**: $h(n) \le c(n, a, n') + h(n')$
    *   *Dấu hiệu:* Thỏa mãn bất đẳng thức tam giác. Chi phí $f(n)$ không bao giờ giảm dọc theo mọi đường đi. Nhất quán $\Rightarrow$ Chấp nhận được. Cần thiết để A* tối ưu trên **Graph Search**.

---

## 3. TÌM KIẾM CỤC BỘ (Local Search)
Không lưu giữ đường đi, chỉ duy trì trạng thái hiện tại, dùng để giải bài toán tối ưu.

### Leo đồi (Hill Climbing)
*   **Bước 1:** Trạng thái hiện tại = Gốc.
*   **Bước 2:** Sinh các trạng thái kề.
*   **Bước 3:** Chuyển sang trạng thái kề **tốt nhất** (tăng giá trị hàm mục tiêu nhiều nhất).
*   **Bước 4:** Dừng khi không có trạng thái kề nào tốt hơn hiện tại (Kẹt tại cực đại cục bộ - **Local Maxima**).

### Luyện kim mô phỏng (Simulated Annealing)
*   **Bước 1:** Đặt nhiệt độ $T$ cao. Khởi tạo trạng thái hiện tại.
*   **Bước 2:** Lấy ngẫu nhiên một trạng thái kề.
*   **Bước 3:** Tính chênh lệch **$\Delta E = E_{kề} - E_{hiện tại}$**.
    *   Nếu **$\Delta E > 0$** (Tốt hơn): Luôn chấp nhận di chuyển.
    *   Nếu **$\Delta E \le 0$** (Tệ hơn): Chấp nhận với xác suất **$P = e^{\frac{\Delta E}{T}}$**.
*   **Bước 4:** Giảm dần $T$ theo lịch trình. Dừng khi $T \to 0$.

---

## 4. TRÒ CHƠI ĐỐI KHÁNG (Adversarial Search)

### Minimax (Các bước thực hiện)
*   **Bước 1:** Vẽ cây trò chơi từ trạng thái hiện tại đến các nút lá.
*   **Bước 2:** Áp dụng hàm lượng giá để tính điểm cho các nút lá.
*   **Bước 3:** Tính ngược từ dưới lên (Bottom-up):
    *   Tại tầng **MAX**: Chọn giá trị **lớn nhất** từ các nút con.
    *   Tại tầng **MIN**: Chọn giá trị **nhỏ nhất** từ các nút con.
*   **Bước 4:** Root (MAX) chọn nước đi dẫn tới nút có giá trị cao nhất.

### Cắt tỉa Alpha-Beta ($\alpha-\beta$)
*   **Định nghĩa**: 
    *   $\alpha$: Giá trị tốt nhất (cao nhất) đã tìm thấy của MAX trên đường đi (Khởi tạo: $-\infty$).
    *   $\beta$: Giá trị tốt nhất (nhỏ nhất) đã tìm thấy của MIN trên đường đi (Khởi tạo: $+\infty$).
*   **Điều kiện cắt tỉa**: 
    *   Tại bất kỳ node nào, nếu **$\alpha \ge \beta$** $\rightarrow$ Dừng duyệt toàn bộ các nhánh con còn lại của node đó.
    *   MAX cập nhật $\alpha$, MIN cập nhật $\beta$. Giá trị truyền từ cha xuống con, cập nhật từ con lên cha.

---

## 5. HƯỚNG DẪN KẺ BẢNG VẾT (TRACE TABLE) CHO THUẬT TOÁN A*
Khi thi tự luận, luôn kẻ bảng gồm các cột bắt buộc sau:

| Bước | Đỉnh được xét (Lấy ra) | Tập biên Open (Fringe) | Tập đóng Closed (Explored) | Ghi chú cập nhật |
|:---:|:---|:---|:---|:---|
| 0 | - | `[ (Gốc, f, g) ]` | `[ ]` | Khởi tạo |
| 1 | `Đỉnh có f nhỏ nhất` | Danh sách các đỉnh chờ duyệt, dạng `(Node, f=..., parent)` | `[Các đỉnh đã duyệt]` | Tính $g, h, f$ cho các đỉnh con. |
| ... | ... | *Sắp xếp Open tăng dần theo $f$* | ... | *Lưu lại cha để truy vết* |

*   **Dấu hiệu dừng:** Đỉnh **Mục tiêu (Goal)** được lấy ra khỏi tập **Open** (Không phải lúc vừa sinh ra).
*   **Truy vết đường đi:** Dò ngược từ Goal qua các đỉnh cha (parent pointer) lưu trong Open.