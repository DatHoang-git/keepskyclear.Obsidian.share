---
tags:
  - categories
---
---
```dataview
TABLE 
    created, 
    project, 
    subject, 
    file.folder AS "comes_from",
    tags
FROM "1_Notes" OR "11_Subjects"
WHERE contains(category, this.file.link)
SORT created ASC, project ASC, subject ASC
```
