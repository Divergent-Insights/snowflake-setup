{% macro snowflake_setup_create(env=1, database=target.database) %}

    {% do log("snowflake_setup started", info=True) %}

    {% if env == 1 %}
        {{ snowflake_setup.setup1_create(database=database) }}
    {% endif %}

    {% do log("snowflake_setup finished", info=True) %}
  
{% endmacro %}
