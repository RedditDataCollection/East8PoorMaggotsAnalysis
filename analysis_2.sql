SELECT PST_time,
       MOD(pst_time + 3, 24) AS EST_time,
       MOD(pst_time + 15, 24) AS DONG_8_QIONG_QU_time,
       count
FROM (
  SELECT EXTRACT(HOUR FROM TO_TIMESTAMP(created_utc)) AS PST_time,
         COUNT(*) AS count
  FROM dfs.`/tmp/comments.json`
  GROUP BY 1
) t
ORDER BY 3;


+----------+----------+----------------------+-------+
| PST_time | EST_time | DONG_8_QIONG_QU_time | count |
+----------+----------+----------------------+-------+
| 9        | 12       | 0                    | 2     |
| 10       | 13       | 1                    | 3     |
| 16       | 19       | 7                    | 2     |
| 17       | 20       | 8                    | 6     |
| 18       | 21       | 9                    | 10    |
| 19       | 22       | 10                   | 9     |
| 20       | 23       | 11                   | 11    |
| 21       | 0        | 12                   | 32    |
| 22       | 1        | 13                   | 25    |
| 23       | 2        | 14                   | 17    |
| 0        | 3        | 15                   | 8     |
| 1        | 4        | 16                   | 11    |
| 2        | 5        | 17                   | 15    |
| 3        | 6        | 18                   | 11    |
| 4        | 7        | 19                   | 15    |
| 5        | 8        | 20                   | 27    |
| 6        | 9        | 21                   | 13    |
| 7        | 10       | 22                   | 9     |
| 8        | 11       | 23                   | 8     |
+----------+----------+----------------------+-------+
