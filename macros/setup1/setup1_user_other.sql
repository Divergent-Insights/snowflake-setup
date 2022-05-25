{% macro setup1_user_other(database) %}
    
    {% set password = "DivergentInsights1" %}

    -- Ingest
    -- NonProd
    {% set user = "ingest_nonprod".upper() %}
    {% set role = "ingest_nonprod".upper() %}
    {% set warehouse = "nonprod_warehouse1" %}
    create or replace user {{ user }} password = '{{ password }}'; -- must_change_password = true;

    alter user {{ user }} set 
        default_role = '{{ role }}' 
        default_warehouse = '{{ warehouse }}'
        default_namespace = '{{ database }}'
        comment = 'User created by dbt-snowflake-setup';
        --rsa_public_key = '{{ public_key }}'        

    grant role {{ role }} to user {{ user }};

    -- Prod
    {% set user = "ingest_prod".upper() %}
    {% set role = "ingest_prod".upper() %}
    {% set warehouse = "prod_warehouse1" %}
    create or replace user {{ user }} password = '{{ password }}'; -- must_change_password = true;

    alter user {{ user }} set 
        default_role = '{{ role }}' 
        default_warehouse = '{{ warehouse }}'
        default_namespace = '{{ database }}'
        comment = 'User created by dbt-snowflake-setup';
        --rsa_public_key = '{{ public_key }}'        

    grant role {{ role }} to user {{ user }};    

    -- Loader 
    -- NonProd
    {% set user = "loader_nonprod".upper() %}
    {% set role = "loader_nonprod".upper() %}
    {% set warehouse = "nonprod_warehouse1".upper() %}
    create or replace user {{ user }} password = '{{ password }}'; -- must_change_password = true;

    alter user {{ user }} set 
        default_role = '{{ role }}' 
        default_warehouse = '{{ warehouse }}'
        default_namespace = '{{ database }}'
        comment = 'User created by dbt-snowflake-setup';
        --rsa_public_key = '{{ public_key }}'        

    grant role {{ role }} to user {{ user }};

    -- Prod
    {% set user = "loader_prod".upper() %}
    {% set role = "loader_prod".upper() %}
    {% set warehouse = "prod_warehouse1".upper() %}
    create or replace user {{ user }} password = '{{ password }}'; -- must_change_password = true;

    alter user {{ user }} set 
        default_role = '{{ role }}' 
        default_warehouse = '{{ warehouse }}'
        default_namespace = '{{ database }}'
        comment = 'User created by dbt-snowflake-setup';
        --rsa_public_key = '{{ public_key }}'        

    grant role {{ role }} to user {{ user }};

    -- Report
    {% set user = "report".upper() %}
    {% set role = "report".upper() %}
    {% set warehouse = "nonprod_warehouse1".upper() %}
    create or replace user {{ user }} password = '{{ password }}'; -- must_change_password = true;

    alter user {{ user }} set
        default_role = '{{ role }}'
        default_warehouse = '{{ warehouse }}'
        default_namespace = '{{ database }}'
        comment = 'User created by dbt-snowflake-setup';
        --rsa_public_key = '{{ public_key }}'

    grant role {{ role }} to user {{ user }};

{% endmacro %}
