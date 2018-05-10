<?php

function CompactArray( $src ) {
    $dst = array();
    foreach ($src as $value) if(strlen($value)>0) $dst[] = (double) $value;
    return $dst;
}

function ReadGaussianCube($csvFile) {
    $r = array();
    $file_handle = fopen($csvFile, 'r');

    $n=0;
    while (!feof($file_handle) ) {
	$line = CompactArray(fgetcsv($file_handle, 40000, " "));
	$n++;
	if($n>20) break;
//	if(count($line)>5) break;
    }

    $n=0;
    while (!feof($file_handle) ) {
        $line = CompactArray(fgetcsv($file_handle, 40000, " "));
	$n++;
	var_dump($line);
	printf("%ld %ld\n", $n, count($line));
//	$r[] = $line;
    }
    fclose($file_handle);
    return $r;
}

$Name = $argv[1];
$Cube = ReadGaussianCube($Name);

?>

