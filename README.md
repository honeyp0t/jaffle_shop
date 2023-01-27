## Schema override propagation bug

Forked jaffle_shop to illustrate bug in snapshot destination property propagation

### Steps to reproduce

- Modify `profiles.yml` so that it contains details to a database you can connect to
- Modify `dbt_project.yml` so that the "+target_schema" configuration points to a schema other than the one you defined in profiles.yml
- Run `dbt seed --profiles-dir . --target local`
- Run `dbt run --profiles-dir . --target local`
- Run `dbt snapshot --profiles-dir . --target local`

### Expected behaviour

Snapshot is created in schema 'whatwewant'

### Actual behaviour

Snapshot is created in the default schema ("wedontwantthis") defined in `profiles.yml`.
Now delete the 'meta' property in snapshots/customers_snapshot.yml and run `dbt snapshot --profiles-dir . --target local` again.
The snapshot will now be created in the 'whatwewant' schema
