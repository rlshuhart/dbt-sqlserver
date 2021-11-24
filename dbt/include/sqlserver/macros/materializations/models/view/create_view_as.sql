{% macro sqlserver__create_view_exec(relation, sql) -%}
    {%- set temp_view_sql = sql.replace("'", "''") -%}
    execute('create view {{ relation.include(database=False) }} as
    {{ temp_view_sql }}
    ');
{% endmacro %}


{% macro sqlserver__get_create_view_as_sql(relation, sql) -%}
    USE [{{ relation.database }}];
    {{ sqlserver__create_view_exec(relation, sql) }}
{% endmacro %}