<?php
$CONFIG = [
  'skeletondirectory' => '',
  'default_language' => 'de',
  'default_locale' => 'de',
  'default_phone_region' => 'DE',
  'allow_user_to_change_display_name' => false,
  'objectstore_multibucket' => [
    'class' => '\\OC\\Files\\ObjectStore\\S3',
    'arguments' => [
      'num_buckets' => 64,
      'bucket' => 'nextcloud-',
      'autocreate' => true,
      'key'    => 'TODO',
      'secret' => 'TODO',
      'hostname' => 'eu2.contabostorage.com',
      'port' => 443,
      'use_ssl' => true,
      'region' => 'default',
      'use_path_style'=>true
    ],
  ],
];
