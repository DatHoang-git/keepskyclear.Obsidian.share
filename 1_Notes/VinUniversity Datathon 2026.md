---
created: 2026-03-25
tags:
category:
  - "[[Skill]]"
day_start: 2026-04-17
day_end: 2026-05-24
status:
  - "[[In progress]]"
---
---
```dataview
TABLE 
    created, 
    subject, 
    category,
    file.folder AS "comes_from",
    tags
FROM "1_Notes" OR "11_Subjects"
WHERE contains(project, this.file.link)
SORT created DESC, category ASC, subject ASC
```

