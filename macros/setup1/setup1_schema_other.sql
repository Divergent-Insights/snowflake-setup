{% macro setup1_schema_other() %}

    -- Ingest
    -- NonProd
    {% set schema_ingest = "raw_nonprod".upper() %}
    {% set role_ingest = "ingest_nonprod".upper() %}
    create schema if not exists {{ database }}.{{ schema_ingest }} with managed access;

    grant usage on schema {{ database }}.{{ schema_ingest }} to role {{ role_ingest }};

    grant create file format on schema {{ database }}.{{ schema_ingest }} to role {{ role_ingest }};
    grant create table on schema {{ database }}.{{ schema_ingest }} to role {{ role_ingest }};
    grant create view on schema {{ database }}.{{ schema_ingest }} to role {{ role_ingest }};

    -- Prod
    {% set schema_ingest = "raw_prod".upper() %}
    {% set role_ingest = "ingest_prod".upper() %}
    create schema if not exists {{ database }}.{{ schema_ingest }} with managed access;

    grant usage on schema {{ database }}.{{ schema_ingest }} to role {{ role_ingest }};

    grant create file format on schema {{ database }}.{{ schema_ingest }} to role {{ role_ingest }};
    grant create table on schema {{ database }}.{{ schema_ingest }} to role {{ role_ingest }};
    grant create view on schema {{ database }}.{{ schema_ingest }} to role {{ role_ingest }};

    -- Loader
    -- NonProd - Source
    {% set schema_loader = "raw_nonprod".upper() %}
    {% set role_loader = "loader_nonprod".upper()%}
    grant usage on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant select on all tables in schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant select on future tables in schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};

    -- NonProd - Destination
    {% set schema_loader = "data_nonprod".upper() %}
    {% set role_loader = "loader_nonprod".upper()%}
    create schema if not exists {{ database }}.{{ schema_loader }} with managed access;
    grant usage on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant create file format on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant create table on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant create stage on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant create view on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};

    -- Prod - Source
    {% set schema_loader = "raw_prod".upper() %}
    {% set role_loader = "loader_prod".upper()%}
    grant usage on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant select on all tables in schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant select on future tables in schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};

    -- Prod - Destination
    {% set schema_loader = "data_prod".upper() %}
    {% set role_loader = "loader_prod".upper() %}
    create schema if not exists {{ database }}.{{ schema_loader }} with managed access;
    grant usage on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant create file format on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant create table on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant create stage on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};
    grant create view on schema {{ database }}.{{ schema_loader }} to role {{ role_loader }};

    -- Report
    -- NonProd
    {% set schema_report = "data_nonprod".upper() %}
    {% set role_report = "report".upper()%}
    grant usage on schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    grant select on all tables in schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    grant select on future tables in schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    grant select on all views in schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    grant select on future views in schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    -- Prod
    {% set schema_report = "data_prod".upper() %}
    {% set role_report = "report".upper()%}
    grant usage on schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    grant select on all tables in schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    grant select on future tables in schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    grant select on all views in schema {{ database }}.{{ schema_report }} to role {{ role_report }};
    grant select on future views in schema {{ database }}.{{ schema_report }} to role {{ role_report }};

{% endmacro %}
