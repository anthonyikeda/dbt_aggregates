with customer_orders as (
    select *
    from {{source('tutorial', 'customer_orders') }}
),
final as (
    select
        state_name,
        count(*) as total_orders
    from customer_orders
    where order_status = 1
    group by state_name
)
select *
from final
