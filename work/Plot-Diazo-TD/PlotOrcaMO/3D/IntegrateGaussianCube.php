<?php

function CompactArray( $src ) {
    $dst = array();
    foreach ($src as $value) if(strlen($value)>0) $dst[] = (double) $value;
    return $dst;
}

function SumArray( $src, &$N ) {
    $Sum = 0.0;
    foreach ($src as $value) { $Sum += $value*$value; $N++; }
    return $Sum;
}

function PrintArray( $src ) {
    echo "[ ";
    foreach ($src as $value) echo " $value;";
    echo "] ";
}

function IntegrateGaussianCube($csvFile) {
    $Num = 0;
    $Sum = 0.0;
    $r = array();
    $file_handle = fopen($csvFile, 'r');

    $n=0;
    while (!feof($file_handle) ) {
	$line = CompactArray(fgetcsv($file_handle, 40000, " "));
	$n++;
	if($n>19) break;
//	if(count($line)>5) break;
    }

    $n=0; $Num=0;
    while (!feof($file_handle) ) {
        $line = CompactArray(fgetcsv($file_handle, 40000, " "));
	$Sum += SumArray($line, $Num);
	PrintArray($line);
	$n++;
//	var_dump($line);
	printf("%ld %ld\n", $n, count($line));
//	$r[] = $line;
    }
    fclose($file_handle);
    echo "Num = $Num;    Sum = $Sum\n";
    return $Sum;
}

$Name = $argv[1];
$Cube = IntegrateGaussianCube($Name);

?>