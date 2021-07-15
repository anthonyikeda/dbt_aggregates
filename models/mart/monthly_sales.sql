with monthly_sales as (
    select *
    from {{source('tutorial','orders')}}
),
final as (
    select to_char(order_approved_at, 'YYYY-MM') as month,
    count(*) as total
    from monthly_sales
    where order_approved_at is not null
    group by to_char(order_approved_at, 'YYYY-MM')
    order by month
)
select *
from final
