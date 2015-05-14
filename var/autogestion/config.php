<?php

return array(
    'global' => array(
        'produccion' => false,
        'usar_personalizaciones' => true,
        'sesion_timeout' => 10000,
        'sesion_maxtime' => 10000,
        'dir_attachment' => '/tmp',
        'ssl' => false,
        'imagen_alumno_dir' => '/var/local/autogestion/src/siu/www/_comp/_img_alumnos',
        'salt' => '9bf057558b90263987bd8f99caf2e92f7efc1a13',
        'url_kolla' => 'http://localhost/kolla/3.4/',
        'captcha' => array(
            'activo' => true,
            'intentos_login' => 3,
            'public_key' => '6Ldja84SAAAAAKdiYZIbx6qjQMtAdzWXiW474_Af',
            'private_key' => '6Ldja84SAAAAABchqHlz65yICNXJQ8ENbZpLvmS5',
        ),
        'proxy' => array(
            'activo' => false,
            'proxy_host' => 'proxy.xxxxxxxxx',
            'proxy_port' => 8080,
            'proxy_username' => 'PROXY-USERNAME',
            'proxy_password' => 'PROXY-PASSWORD'
        ),
        'google_analytics' => array(
            'activo'  => true,
            'account' => 'UA-xxx-y'
        ),
        'log' => array(
            'activo' => true,
            'nivel' => 'debug',
            'barra_dev' => true,
        ),
        'ini_debug' => false,
        'memcached' =>	array(
            'server_1' => array(
                'host' => 'localhost',
                'port' => 11211,
                'peso' => 1,
            ),
        ),
        'smtp' => array(
            'from' => 'guarani.siu@gmail.com',
            'host' => 'smtp.gmail.com',
            'seguridad' => 'ssl',
            'auth' => true,
            'port' => 465,
            'usuario' => 'guarani.siu@gmail.com',
            'clave' => '',
            'reply_to' => 'guarani.siu@gmail.com'
        ),
        //Cantidad de emails que se desencolaran y enviaran cada vez que se ejecute el cron o tarea programada (0 para ilimitado)
        'cant_emails_a_enviar_por_corrida_cron' => 10,
        'accesos' => array(
            'des01' => array(
                'ua' => 5,
                'personalizacion' => NULL,
                'database' => array(
                    'vendor' => 'pgsql',
                    'dbname' => 'toba_guarani',
                    'schema' => 'negocio',
                    'host' => 'pg',
                    'port' => 5432,
                    'pdo_user' => 'postgres',
                    'pdo_passwd' => 'postgres',
                ),
            ),
        ),
    ),
);