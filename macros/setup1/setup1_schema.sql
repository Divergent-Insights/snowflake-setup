{% macro setup1_schema(role, schema, database) %}

    -- Dev user
    create schema if not exists {{ database }}.{{ schema }} with managed access;

    grant usage on schema {{ database }}.{{ schema }} to role {{ role }};

    grant create file format on schema {{ database }}.{{ schema }} to role {{ role }};
    grant create table on schema {{ database }}.{{ schema }} to role {{ role }};
    grant create stage on schema {{ database }}.{{ schema }} to role {{ role }};
    grant create view on schema {{ database }}.{{ schema }} to role {{ role }};

    -- Providing developers with access to raw data
    {% set schema_ingest = "raw_prod".upper() %}
    grant usage on schema {{ database }}.{{ schema_ingest }} to role {{ role }};
    grant select on all tables in schema {{ database }}.{{ schema_ingest }} to role {{ role }};
    grant select on future tables in schema {{ database }}.{{ schema_ingest }} to role {{ role }};

    {% set schema_ingest = "raw_nonprod".upper() %}
    grant usage on schema {{ database }}.{{ schema_ingest }} to role {{ role }};
    grant select on all tables in schema {{ database }}.{{ schema_ingest }} to role {{ role }};
    grant select on future tables in schema {{ database }}.{{ schema_ingest }} to role {{ role }};

    {% set schema_loader = "data_nonprod".upper() %}
    grant usage on schema {{ database }}.{{ schema_loader }} to role {{ role }};
    grant select on all tables in schema {{ database }}.{{ schema_loader }} to role {{ role }};
    grant select on future tables in schema {{ database }}.{{ schema_loader }} to role {{ role }};

    {% set schema_loader = "data_nonprod".upper() %}
    grant usage on schema {{ database }}.{{ schema_loader }} to role {{ role }};
    grant select on all tables in schema {{ database }}.{{ schema_loader }} to role {{ role }};
    grant select on future tables in schema {{ database }}.{{ schema_loader }} to role {{ role }};
    
{% endmacro %}
