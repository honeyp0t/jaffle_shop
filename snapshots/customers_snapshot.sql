{% snapshot customers_snapshot %}
    {{
        config(
            unique_key='customer_id',
            strategy='check',
            check_cols=['first_name'],
            invalidate_hard_deletes=true
        )
    }}

    select *
    from {{ref('customers')}}

{% endsnapshot %}