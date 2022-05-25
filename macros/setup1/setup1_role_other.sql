{% macro setup1_role_other() %}

    -- ingest
    -- NonProd
    {% set role = "ingest_nonprod".upper() %}
    create role if not exists {{ role }};
    grant role {{ role }} to role sysadmin; -- Allows existing administrators to control the new environment
    -- Prod
    {% set role = "ingest_prod".upper() %}
    create role if not exists {{ role }};
    grant role {{ role }} to role sysadmin; -- Allows existing administrators to control the new environment

    -- Loader
    -- NonPro
    {% set role = "loader_nonprod".upper() %}
    create role if not exists {{ role }};
    grant role {{ role }} to role sysadmin; -- Allows existing administrators to control the new environment    
    -- Prod
    {% set role = "loader_prod".upper() %}
    create role if not exists {{ role }};
    grant role {{ role }} to role sysadmin; -- Allows existing administrators to control the new environment    

    -- Report
    {% set role = "report".upper() %}
    create role if not exists {{ role }};
    grant role {{ role }} to role sysadmin; -- Allows existing administrators to control the new environment

{% endmacro %}
