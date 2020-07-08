select
(select count(*) as total from likes 
where like_from_user_id in(
select user_id from profile
where gender = 'm'
)) as men_total_likes,
(select count(*) as total from likes 
where like_from_user_id in(
select user_id from profile
where gender = 'f'
)) as women_total_likes;



