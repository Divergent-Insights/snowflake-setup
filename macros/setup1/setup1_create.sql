{% macro setup1_create(database) %}

    {% do log("setup1 started", info=True) %}

    {% set begin_transaction %}
    begin transaction;
    {% endset %}
    {% do run_query(begin_transaction) %}

    {% do log("Snowflake Setup", info=True) %}
    {% set main %}
        {{ snowflake_setup.setup1_account() }}
        {% do log("Account setup", info=True) %}

        {% set database = database.upper() %}

        -- Other roles: ingest, loader, report
        {{ snowflake_setup.setup1_role_other() }}        
        {{ snowflake_setup.setup1_database_other(database) }}
        {{ snowflake_setup.setup1_schema_other() }}
        {{ snowflake_setup.setup1_warehouse_other() }}
        {{ snowflake_setup.setup1_user_other(database) }}

        -- Dev: schema, role and user
        {% for user in get_users() %}
            {% do log("Creating user " ~ user["first_name"] ~ " " ~ user["last_name"] ~ " <" ~ user["email"] ~ ">", info=True) %}
            {% set dev_userid = user["first_name"].upper() ~ "_" ~ user["last_name"].upper() %}
            {% set dev_role = "DEV_" ~ dev_userid %}
            {% set dev_schema = "DEV_" ~ dev_userid %}
            {% set dev_user = "DEV_" ~ dev_userid %}            
            {% do log("Schema " ~ dev_schema ~ " Role: " ~ dev_role ~ " User: " ~ dev_user, info=True) %}

            -- Role
            {{ snowflake_setup.setup1_role(dev_role) }}
            {% do log("Role setup: " ~ dev_role, info=True) %}

            -- Database
            {{ snowflake_setup.setup1_database(dev_role, database) }}
            {% do log("Database setup: " ~ database, info=True) %}

            -- Schema
            {{ snowflake_setup.setup1_schema(dev_role, dev_schema, database) }}
            {% do log("Schema setup: " ~ dev_schema, info=True) %}

            -- Internal Stage
            {% set internal_stage = "internal_stage" %}
            {% set file_format = "json" %}
            {{ snowflake_setup.setup1_internal_stage(dev_role, internal_stage, file_format, database, dev_schema) }}
            {% do log("Internal Stage setup: " ~ internal_stage, info=True) %}
            {% do log("Internal Stage file format: " ~ file_format, info=True) %}

            -- Warehouses
            {% set nonprod_warehouse1 = "nonprod_warehouse1" %}        
            {{ snowflake_setup.setup1_warehouse(dev_role, nonprod_warehouse1) }}
            {% do log("Warehouse setup: " ~ nonprod_warehouse1, info=True) %}
            {% set prod_warehouse1 = "prod_warehouse1" %}        
            {{ snowflake_setup.setup1_warehouse(dev_role, prod_warehouse1) }}
            {% do log("Warehouse setup: " ~ prod_warehouse1, info=True) %}             

            -- User
            {% set password = "DivergentInsights1" %}
            {{ snowflake_setup.setup1_user(dev_role, dev_user, password, "nonprod_warehouse1", database) }}
            {% do log("User setup: " ~ user, info=True) %}
            {% do log("Account details: " ~ target.account, info=True) %}
        {% endfor %}        

    {% endset %}    
    {% do run_query(main) %}

    {% set end_transaction %}
    commit;
    {% endset %}
    {% do run_query(end_transaction) %}

    {% do log("snowflake_setup1 finished", info=True) %}
{% endmacro %}
