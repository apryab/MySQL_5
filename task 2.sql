select count(*) as total from likes
where like_to_user_id in (
select user_id from profile
where birthday >= '2018-04-21'
);

select user_id, birthday from profile
order by birthday desc limit 10;