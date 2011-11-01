<?php

require_once 'HamlPHP/src/HamlPHP/HamlPHP.php';
require_once 'HamlPHP/src/HamlPHP/Storage/DontEvaluateStorage.php';

$compiler = new Compiler(new HamlPHP(new DontEvaluateStorage(dirname(__FILE__ . '/tmp/'))));
echo $compiler->parseString(stream_get_contents(STDIN));
