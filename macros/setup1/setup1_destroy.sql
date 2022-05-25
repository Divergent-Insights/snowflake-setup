{% macro setup1_destroy(database) %}

    {% do log("snowflake_setup1_destroy started", info=True) %}
    {% set main %}
    
        drop database if exists {{ database }};        

        {% for user in get_users() %}
            {% do log("Destroying user " ~ user["first_name"] ~ " " ~ user["last_name"] ~ " <" ~ user["email"] ~ ">", info=True) %}
            {% set dev_userid = user["first_name"].upper() ~ "_" ~ user["last_name"].upper() %}
            {% set dev_schema = "DEV_" ~ dev_userid %}
            {% set dev_role = "DEV_" ~ dev_userid %}
            {% set dev_user = "DEV_" ~ dev_userid %}            
            {% do log("Schema " ~ dev_schema ~ " Role: " ~ dev_role ~ " User: " ~ dev_user, info=True) %}            

            drop role if exists {{ dev_role }};
            drop user if exists {{ dev_user }};
        {% endfor %}

        drop role if exists ingest_nonprod;
        drop role if exists ingest_prod;
        drop role if exists loader_nonprod;
        drop role if exists loader_prod;
        drop role if exists report;

        drop user if exists ingest_nonprod;
        drop user if exists ingest_prod;
        drop user if exists loader_nonprod;
        drop user if exists loader_prod;
        drop user if exists report;

        drop warehouse if exists nonprod_warehouse1;
        drop warehouse if exists prod_warehouse1;

    {% endset %}
    {% do run_query(main) %}

    {% do log("snowflake_setup1_destroy finished", info=True) %}
{% endmacro %}