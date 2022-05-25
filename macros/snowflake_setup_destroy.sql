{% macro snowflake_setup_destroy(env=1, database=target.database) %}

    {% do log("snowflake_setup_detroy started", info=True) %}

    {% if env == 1 %}
        {{ snowflake_setup.setup1_destroy(database=database) }}
    {% endif %}

    {% do log("snowflake_setup_destroy finished", info=True) %}
  
{% endmacro %}
