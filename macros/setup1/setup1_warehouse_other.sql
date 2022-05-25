{% macro setup1_warehouse_other() %}

    create warehouse if not exists nonprod_warehouse1
        with warehouse_size = xsmall, auto_suspend = 180, auto_resume = true, comment = 'Warehouse created by dbt-snowflake-setup';

    create warehouse if not exists prod_warehouse1
        with warehouse_size = xsmall, auto_suspend = 180, auto_resume = true, comment = 'Warehouse created by dbt-snowflake-setup';

    -- Ingest
    grant usage, operate, monitor on warehouse nonprod_warehouse1 to role ingest_nonprod;
    grant usage, operate, monitor on warehouse prod_warehouse1 to role ingest_prod;

    -- Loader
    grant usage, operate, monitor on warehouse nonprod_warehouse1 to role loader_nonprod;
    grant usage, operate, monitor on warehouse prod_warehouse1 to role loader_prod;

    -- Report
    grant usage, operate, monitor on warehouse nonprod_warehouse1 to role report;
    grant usage, operate, monitor on warehouse prod_warehouse1 to role report;

{% endmacro %}
