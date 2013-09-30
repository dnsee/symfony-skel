class symfony::dbal {

    if ($do_schema_update == "yes" and $database_name != undef) {

        if ($em == undef) {
            $em = "default"
        }
        
        exec {
            'schema-drop':
                require => Database[$database_name],
                command => "/usr/bin/php app/console doctrine:schema:drop --em=${em} --env=dev --force",
                cwd => '/vagrant';
            'schema-create':
                require => Database[$database_name],
                command => "/usr/bin/php app/console doctrine:schema:create --em=${em} --env=dev",
                cwd => '/vagrant';
            'schema-drop-test':
                require => Database["${database_name}_test"],
                command => "/usr/bin/php app/console doctrine:schema:drop --em=${em} --env=test --force",
                cwd => '/vagrant';
            'schema-create-test':
                require => Database["${database_name}_test"],
                command => "/usr/bin/php app/console doctrine:schema:create --em=${em} --env=test",
                cwd => '/vagrant'
        }
    }

}
