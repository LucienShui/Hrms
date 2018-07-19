-- 取上个月最后一天
SELECT LAST_DAY(DATE_SUB(NOW(),INTERVAL 1 MONTH)) AS `date`;

SELECT * FROM (
	SELECT `staff`.`s_id` AS `s_id`, `s_name`, `d_name`, `p_name`, `p_hiredate`
	FROM `staff`, `post`,  `department`, `transfer`
	WHERE 
	`staff`.`d_id` = `department`.`d_id` and `staff`.`p_id` = `post`.`p_id` and `staff`.`s_id` = `transfer`.`s_id`
) AS `tmp`
WHERE `p_hiredate` > ?

SELECT `staff`.`s_id` AS `s_id`, `s_name`, `d_name`, `p_name`, `r_leavedate`
FROM `staff`, `post`, `department`, `resigned`
WHERE
`staff`.`d_id` = `department`.`d_id` AND
`staff`.`p_id` = `post`.`p_id` AND
`staff`.`s_id` = `resigned`.`s_id`


SELECT `staff`.`s_id` AS `s_id`, `s_name`, `d_name`, `p_hiredate`
FROM `staff`, `department`, `transfer`
WHERE
`transfer`.`d_id` <> 0 AND
`transfer`.`d_id` = `department`.`d_id` AND
`staff`.`s_id` = `transfer`.`s_id`
ORDER BY `p_hiredate`


SELECT `staff`.`s_id` AS `s_id`, `s_name`, `p_name`, `p_hiredate`
FROM `staff`, `post`, `transfer`
WHERE
`transfer`.`p_id` <> 0 AND
`transfer`.`p_id` = `post`.`p_id` AND
`staff`.`s_id` = `transfer`.`s_id`
ORDER BY `p_hiredate`





select `staff`.`s_id` as `s_id`, `staff`.`s_name` as `s_name`, `department`.`d_name` as `d_name`, `p_hiredate`
from (
	select `s_id`, `d_id`, MIN(`p_hiredate`) as `p_hiredate`
	from `transfer`
	group by `s_id`, `d_id`) as `tmp`, `department`, `staff`
where `staff`.`s_id` = `tmp`.`s_id` and `tmp`.`d_id` = `department`.`d_id`


select `staff`.`s_id` as `s_id`, `staff`.`s_name` as `s_name`, `post`.`p_name` as `d_name`, `p_hiredate`
from (
	select `s_id`, `d_id`, MIN(`p_hiredate`) as `p_hiredate`
	from `transfer`
	group by `s_id`, `d_id`) as `tmp`, `post`, `staff`
where `staff`.`s_id` = `tmp`.`s_id` and `tmp`.`d_id` = `post`.`p_id`


