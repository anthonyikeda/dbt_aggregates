with daily_sales as (
    select *
    from {{source('tutorial','orders')}}
),
final as (
    select to_char(order_approved_at, 'YYYY-MM-DD') as day,
    count(*) as total
    from daily_sales
    where order_approved_at is not null
    group by to_char(order_approved_at, 'YYYY-MM-DD')
    order by day
)
select *
from final
