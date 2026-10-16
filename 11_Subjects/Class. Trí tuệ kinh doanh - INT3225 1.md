---
tags:
  - class
category:
  - "[[Class]]"
people:
  - "[[PGS.TS Nguyễn Trí Thành]]"
location:
  - T3-(4-6)-208-B,T4-(1-3)-204-B
Mã LHP: INT3225 1
Điểm:
Số tín: "4"
aliases:
  - BI
---
---

>[!tip] Nội quy 
> - 10% cc (điểm danh + **btvn** thầy gắt vụ này) + 30% gk (kiểm tra online) + 60% ck (project)
> - đến trễ = ko điểm danh
> - 2 bạn 1 nhóm 
> - 2 giáo trình lý thuyết + 3 giáo trình thực hành nếu theo domain này
> - cho phép mang vở ghi

```dataview
TABLE 
    created,
    category, 
    project, 
    tags
FROM "1_Notes"
WHERE contains(subject, this.file.link)
SORT created ASC, project ASC
```
# Syllabus
### <mark style="background: #FFF3A3A6;">Lecture</mark>
- **Introduction**
    - General concept
    - The meaning and role of BI
    - Distinguish between BI systems and operational systems
    - BI System Architecture
    - Methods for building a BI system
    - Development life cycle of BI systems

**Split class assignment selection group**

- **Build a data warehouse**
    - Data warehouse
    - Data warehouse architecture
    - The process of building a data warehouse
- **Descriptive analysis**
    - Statistical models for business analysis
    - Regression models for business analysis
    - Data visualization
    - Information dashboards
    - Optimize current business processes

### <mark style="background: #FFF3A3A6;">Power BI desktop tool practices</mark>

- **Introducing the Power BI tool**
    - Power BI ecosystem
    - Power BI desktop
        - Access to data
        - Create a data model
        - Data analysis
        - Create and publish dashboards
    - Power BI service
        - Display and edit dashboard
        - Create dashboard
        - Share and collaborate
        - Access the reports
    - **Power BI Desktop**
        - Install
        - Introduction to tools, functions
        - Create a calculated data field
        - Data visualization
    - **Connect and transform data**
        - Input data connection
        - Data transformation
        - Join, copy, and insert queries
        - View and download data
    - **Create data models and calculations**
        - Create a data model
        - Create a calculated field
    - **In-depth analysis**
        - Data segmentation
        - Navigation features for data analysis
        - Advanced visual features
    - **Create a final report**
        - Prepare the final report
        - Create final report pages
        - Publish a report to the Power BI service
        - Use reports on the Power BI service

# Tài liệu
**Giáo trình**: 
Lý thuyết
[[Businessanalytics.pdf]] (thực chiến)
[[BusinessIntelligence.pdf]] (hàn lâm, sách gối đầu giường)

**Thực hành**:
Sách 1: [[(Thuc Hanh) Pro Data Mashup for Power BI Powering Up with Power Query and the M Language to Find, Load, and Transform Data (Adam Aspin) (z-library.sk, 1lib.sk, z-lib.sk).pdf]]
Sách 2: [[(Thuc Hanh 2) MasteringPowerBI.pdf]]
### Slides
[[BI01.pdf]]
### Ôn thi
##### GK
##### CK (Projects)
BI Proj reqs: [[BIprojectRequirements2026.docx]]


# Overview Canvas
\[\[this.canvas\]\]

