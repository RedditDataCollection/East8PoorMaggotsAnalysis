SELECT PST_time,
       MOD(pst_time + 3, 24) AS EST_time,
       MOD(pst_time + 15, 24) AS DONG_8_QIONG_QU_time,
       count
FROM (
  SELECT EXTRACT(HOUR FROM TO_TIMESTAMP(created_utc)) AS PST_time,
         COUNT(*) AS count
  FROM dfs.`/tmp/user_comment.json`
  GROUP BY 1
) t
ORDER BY 3;


+----------+----------+----------------------+-------+
| PST_time | EST_time | DONG_8_QIONG_QU_time | count |
+----------+----------+----------------------+-------+
| 9        | 12       | 0                    | 10    |
| 10       | 13       | 1                    | 2     |
| 16       | 19       | 7                    | 6     |
| 17       | 20       | 8                    | 20    |
| 18       | 21       | 9                    | 4     |
| 20       | 23       | 11                   | 2     |
| 22       | 1        | 13                   | 3     |
| 0        | 3        | 15                   | 1     |
| 1        | 4        | 16                   | 1     |
| 4        | 7        | 19                   | 5     |
| 5        | 8        | 20                   | 12    |
| 6        | 9        | 21                   | 3     |
| 7        | 10       | 22                   | 9     |
| 8        | 11       | 23                   | 13    |
+----------+----------+----------------------+-------+
