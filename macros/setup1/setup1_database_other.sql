{% macro setup1_database_other(database) %}

    create transient database if not exists {{ database }};

    -- Ingest
    grant all on database {{ database }} to role ingest_nonprod;
    grant all on database {{ database }} to role ingest_prod;

    -- Loader
    grant all on database {{ database }} to role loader_nonprod;
    grant all on database {{ database }} to role loader_prod;

    -- Report
    grant all on database {{ database }} to role report;

{% endmacro %}
