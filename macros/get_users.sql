{% macro get_users() %}

    {{ 
        return
        (
            [
                {"first_name" : "Mandy", "last_name" : "Pan", "email" : "mandy.pan@tenzing.co.nz"},
                {"first_name" : "Mark", "last_name" : "Hubbard", "email" : "mark.hubbard@tenzing.co.nz"},
                {"first_name" : "Farhan", "last_name" : "Shafiq", "email" : "farhan.shafiq@tenzing.co.nz"},
                {"first_name" : "Shane", "last_name" : "Sinclair", "email" : "shane.sinclair@tenzing.co.nz"},
                {"first_name" : "Satish", "last_name" : "Rajkumar", "email" : "satish.rajkumar@tenzing.co.nz"},
                {"first_name" : "Nasir", "last_name" : "Khan", "email" : "nasir.khan@tenzing.co.nz"},
                {"first_name" : "Duane", "last_name" : "EvansParker", "email" : "duane.evans-parker@tenzing.co.nz"},
                {"first_name" : "Wayne", "last_name" : "Lanting", "email" : "wayne.lanting@tenzing.co.nz"},
                {"first_name" : "Yuffy", "last_name" : "Liang", "email" : "yuffy.liang@tenzing.co.nz"},                
                {"first_name" : "Cesar", "last_name" : "Tirado", "email" : "cesar.tirado@tenzing.com.nz"},
                {"first_name" : "Wilson", "last_name" : "Vaquen", "email" : "wilson.vaquen@divergentinsights.com.au"},
            ]
        )
    }}

{% endmacro %}