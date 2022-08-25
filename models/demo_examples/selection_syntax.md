Syntax overview: https://docs.getdbt.com/reference/node-selection/syntax

Common Orchestration Methods
-Time based 
    -- ex: run entire project every 5 hours 
    -- can also use tags to indicate which directories should be in which frequency
        ---# Run all models tagged "daily": $ dbt run --select tag:daily
-Folder directory
    --Transformation stage (stage, intermediate, mart) or Team Ownership 
        ---# Run all models under staging: $ dbt run --select models/staging
        ---# Run all intermediate models and their parents: $ dbt run --select +models/marts/intermediate 

