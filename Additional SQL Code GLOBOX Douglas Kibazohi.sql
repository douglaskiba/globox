-- Extra code for extra analysis, not included in Report but used to help create Presentation.

-- Percent of Users by Gender (used to determine ratio)

select gender, 
count(id)  as total_users, 
round(count(id)/(select count(id) from users)::numeric, 2) as percent_of_total_users
from users 
group by 1
order by 1

-- Breakdown of users and revenue by device

select gr.device, 
count(gr.uid) as total_users, 
round(count(gr.uid)/(select count(uid) from groups)::numeric, 2) as percent_of_total_users,
round(sum(spent)) as total_spent,
round(sum(spent)/(select sum(spent) from activity), 2) as percent_of_total_spend,
round(sum(spent)/count(gr.uid), 2) as avg_spend_per_user
from groups gr
left join activity using (uid)
where gr.device is not null 
group by 1

-- Users and Revenue by Device and Country

select  country, gr.device, 
count(gr.uid) as no_of_users,
round(sum(spent)/count(gr.uid), 2) as avg_spend_per_user
from groups gr
left join users u on u.id = gr.uid
left join activity using (uid)
where gr.device is not null and country is not null
group by 1,2
order by 1,2





























