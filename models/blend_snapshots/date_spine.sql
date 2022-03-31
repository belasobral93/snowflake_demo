{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2022-03-30' as date)",
    end_date="cast('2022-04-30' as date)"
   )
}}