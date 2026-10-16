---
created: 2026-10-12
tags:
  - "#lecture_note"
category:
  - "[[Class]]"
subject:
  - "[[Class. Hệ quản trị cơ sở dữ liệu - INT3202 1|DBMS]]"
---
---
/src: [[L3_Physical_Storage_Data_Organization.pdf]]  

Bài này sẽ lqan tới proj: 
- Định luuwu trữ như nào? 
- Có xx bản ghi, ghi bao nhiêu trang, chia ra như nào? tổ chức như nào

Logical Schema --> Record layout --> Page / block --> File / table space --> Buffer pool --> Measured footprint

### Khái niệm về block
Từ Record sang Page như nào?

File: Object storagee
Block/Page: Fixed-length storage and transfer unit [[Phân trang, bảng trang.excalidraw|giống bảng trang trong môn OS]]
Record: Là một đơn vị biểu diễn vật lý cho một tuple (đo dưới đơn vị byte)

- **Blocking factor:** Trong một trang chứa được tối đa bao nhiêu bản ghi 
$$
bfr =   B / R
$$
Trong đó: 
$B$: Block / page size
$R$: Record size
Cần làm tròn xuống vì ko thể tồn tại nửa bảng trang

- Biết số hàng tính được số bảng trang và "storage footprint"?
...
>[!important] Đây chính là METRICS để đánh giá các thực nghiệm !!!
>Và cũng phải tự vin vào đây để giải thích

```python
B = 16384
bfr = 16384 // 128
b = 1000000 // bfr # N / bfr
S = b * B
print(f"B = {B}, bfr = {bfr}, b = {b}, S = {S}")
```

>[!note] ### Các công thức cần nhớ
> 1. Record size ![[L3_Physical_Storage_Data_Organization.pdf#page=7&rect=60,338,464,450|L3_Physical_Storage_Data_Organization, p.7]]
> 2. Bao nhiêu bản ghi mà trong *một bảng có thể chứa*?![[L3_Physical_Storage_Data_Organization.pdf#page=8&rect=57,346,464,459|L3_Physical_Storage_Data_Organization, p.8]]
> 3. Các phần bị phung phí![[L3_Physical_Storage_Data_Organization.pdf#page=8&rect=450,190,878,308|L3_Physical_Storage_Data_Organization, p.8]]
> 4. Cho biết số hàng, đếm số trang và "storage footprint"![[L3_Physical_Storage_Data_Organization.pdf#page=9&rect=53,329,878,459|L3_Physical_Storage_Data_Organization, p.9]]
> 5. Chuyển từ Bytes sang Pages, với InnoDB![[L3_Physical_Storage_Data_Organization.pdf#page=27&rect=52,226,909,456&color=yellow|L3_Physical_Storage_Data_Organization, p.27]]
> 6. Physical Bytes Per Row![[L3_Physical_Storage_Data_Organization.pdf#page=28&rect=43,344,914,455&color=yellow|L3_Physical_Storage_Data_Organization, p.28]]

# Tổ chức file và các mô hình lưu trữ
Tùy vào nhu cầu mà sử dụng các mô hình khác nhau, dựa vào các [[L3_Physical_Storage_Data_Organization.pdf#page=19&rect=46,181,920,457&color=yellow|pattern]]

Có các kiểu lưu trữ:
- Theo hàng (row-oriented)
- Theo cột (column-oriented): *Cái này khá niche? Vì nếu lưu theo cột thì mất hết thông tin về **row context**. Vì vậy tôi nghĩ chỉ nên sử dụng cho các trường hợp ko cần qtam tới context, thuần mang yếu tố thống kê và phân phối của 1 cột (or tôi hiểu sai)*


# Buffer pool và InnoDB Mapping
![[L3_Physical_Storage_Data_Organization.pdf#page=23&rect=50,153,916,452&color=yellow|L3_Physical_Storage_Data_Organization, p.23]]
>*Ủa, thế có khác gì cache ko? Tại sao lại sài từ "buffer" mà ko sài cache? Ở đây cũng tra cứu trong buffer (cache), buffer hit (cache hit), miss thì lại đọc từ storage?* ![[L3_Physical_Storage_Data_Organization.pdf#page=24&rect=53,345,902,451&color=yellow|L3_Physical_Storage_Data_Organization, p.24]]

### InnoDB mapping
Cơ bản là cách của engine storage hoạt động, từ logical sang physical
![[L3_Physical_Storage_Data_Organization.pdf#page=25&rect=20,72,940,535&color=yellow|L3_Physical_Storage_Data_Organization, p.25]]

>[!tips] Tại sao phải tính cái này? Để khi vào dự án còn biết máy có chứa nổi và xử lý nổi cái DB đó hay ko

>[!bug] Các Metric tốt thì bao gồm những gì
>![[L3_Physical_Storage_Data_Organization.pdf#page=29&rect=41,91,922,461&color=yellow|L3_Physical_Storage_Data_Organization, p.29]]

# Lab


>[!tips] Khi làm proj cuối kì, cần đưa ra các con số này nhằm mục đích mô tả
> >[!PDF|yellow] [[L3_Physical_Storage_Data_Organization.pdf#page=26&selection=6,0,14,41&color=yellow|L3_Physical_Storage_Data_Organization, p.26]]
> > SELECT table_name, table_rows, avg_row_length, data_length, index_length, data_free FROM information_schema.tables WHERE table_schema = 'l3_demo' ORDER BY data_length + index_length DESC;
> 
>![[Pasted image 20261012111349.png]]

Ta có thể tính được dựa 
```python
print((1589248 + 1196032) / 15420)
```


