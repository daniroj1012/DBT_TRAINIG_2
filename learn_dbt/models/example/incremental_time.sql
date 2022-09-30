
{{config(materialized='incremental')}}

select *
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
where t_time<=hour(current_time())

{%if is_incremental() %}
and t_time > (select max(t_time) from {{this}})
{%endif%}
