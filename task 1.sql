select 
count(*) as total_mes,
case(from_user_id) 
	when 42 then to_user_id 
	else from_user_id
end as `id`
from messages 
where
(from_user_id = 42 and to_user_id in (
select 
case(initiator_user_id) 
	when 42 then target_user_id 
	else initiator_user_id
end as `id` from friend_requests
where (initiator_user_id = 42 or target_user_id = 42) and status = 'approved'))
or
(to_user_id = 42 and from_user_id in (
select 
case(initiator_user_id) 
	when 42 then target_user_id 
	else initiator_user_id
end as `id` from friend_requests
where (initiator_user_id = 42 or target_user_id = 42) and status = 'approved'))
group by from_user_id, to_user_id having count(*)>0
order by total_mes desc limit 1;