<?php

// $eh=4.35974418e-18;
$eh=2625.499748; // кДж/моль
$BASIS="RB3LYP-aug-cc-pVDZ";
$mprop=array();

function get_component($str,$k) {
    $r = array();
    $lst = explode(" ",$str);
    foreach ($lst as $s) {
	$comp=ltrim(rtrim($s));
	if(strlen($comp)<1) continue;
	if(strcasecmp($comp, "+") == 0) continue;
//	$ml=preg_split('/^\d+$/',$comp);
////	$ml = sscanf($comp,"%f%s");
////	if($ml[0]==NULL) $ml=array(1.0,$comp);
////	$ml[0]*=$k;
//	echo '<'.implode(',',$ml).'> ';
	$ml=array($k,$comp);
	array_push($r, $ml);
    }
    return $r;
}


function get_reaction($str) {
    list($src, $dst) = explode("=", $str);
    $msrc = get_component($src,-1.0);
    $mdst = get_component($dst,1.0);
    return(array_merge($msrc,$mdst));
}

function read_prop($name) {
/*
Group N4-N3-C0 Distance C-N=1.4319 Distance N-N=1.1073 Angle=175.61
Ring C0-C1-C2-N9-N8-N7 SumAnges=720.00(100.00%) SumDistance=0.0005
LUMO=-0.35447
HOMO=-0.47157
*/
    global $mprop,$mmt,$eh,$BASIS;

    $prop = array( 'HOMO'=>0.0, 'LUMO'=>0.0, 'C-N'=>0.0, 'N-N'=>0.0, 'AngCNN'=>0.0, 'RSD'=>0.0 );
    $fname = sprintf("prop/$name.prop");
//    echo "fname=$fname\n";
    $f = fopen($fname,"r");
    if(!$f) return $prop;
    while (!feof ($f)) {
        $s = rtrim(ltrim(fgets($f))); if(strlen($s)<1) continue; 
//	echo "s=[$s]\n";
        if( ($p=strpos($s,'HOMO='))!==false ) $prop['HOMO'] = floatval( substr($s,$p+5,$p+14) );
        if( ($p=strpos($s,'LUMO='))!==false ) $prop['LUMO'] = floatval( substr($s,$p+5,$p+14) );
        if( ($p=strpos($s,'C-N='))!==false ) $prop['C-N'] = floatval( substr($s,$p+4,$p+10) );
        if( ($p=strpos($s,'N-N='))!==false ) $prop['N-N'] = floatval( substr($s,$p+4,$p+10) );
        if( ($p=strpos($s,'Angle='))!==false ) $prop['AngCNN'] = floatval( substr($s,$p+6,$p+12) );
        if( ($p=strpos($s,'SumDistance='))!==false ) $prop['RSD'] = floatval( substr($s,$p+12,$p+18) );
//	printf("*** [%s] %p \n", $s, strpos($s,'C-N=') );
      }
    fclose($f);
    $mprop[$name] = $prop;
//    var_dump($prop);
    return $prop;
}

function read_reactions($fname) {
    $m = array();
    $row = 1;
    if (($f = fopen($fname, "r")) !== FALSE) {
	fgets($f);
	while (($data = fgetcsv($f, 1000, ";")) !== FALSE) {
	    $num = count($data);
	    $row++;
	    $rs = $data[0];
	    $dE = $data[1];
	    $dG = $data[2];
	    $dH = $data[3];
	    $dST = $data[4];
//	    printf("\"%s\"; %.5f; %.5f; %.5f; %.5f;\n", $rs, $dE, $dG, $dH, $dST );
	    $m[$rs] = array( 'reaction'=>$rs, 'dE'=>$dE, 'dG'=>$dG, 'dH'=>$dH, 'dST'=>$dST );
	}
	fclose($f);
    }
    return($m);
}

function get_N2($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet + N2-USinglet = $Name-N2+-USinglet"][$P];
    $E2 = $m["$Name+-UTriplet + N2-USinglet = $Name-N2+-USinglet"][$P];
    $dE = max( $E1, $E2 );
    return $dE;
}

function get_N2_S($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet + N2-USinglet = $Name-N2+-USinglet"][$P];
    return $E1;
}

function get_N2_T($m, $Name, $P) {
    $E1 = $m["$Name+-UTriplet + N2-USinglet = $Name-N2+-USinglet"][$P];
    return $E1;
}

function get_N2_D($m, $Name, $P) {
    $E1 = $m["$Name-UDoublet + N2-USinglet = $Name-N2-UDoublet"][$P];
    return $E1;
}

function get_SE($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet = $Name-UDoublet"][$P];
    $E2 = $m["$Name+-UTriplet = $Name-UDoublet"][$P];
    $dE = max( $E1, $E2 );
    return $dE;
}

function get_SE_S($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet = $Name-UDoublet"][$P];
    return $E1;
}

function get_SE_T($m, $Name, $P) {
    $E2 = $m["$Name+-UTriplet = $Name-UDoublet"][$P];
    return $E2;
}

function get_SE_all($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet = $Name-UDoublet"][$P];
    $E2 = $m["$Name+-UTriplet = $Name-UDoublet"][$P];
    $E3 = $m["$Name-N2+-USinglet = $Name-N2-UDoublet"][$P];
    $E4 = $m["$Name-N2+-UTriplet = $Name-N2-UDoublet"][$P];
    return array( 'US'=>$E1, 'UT'=>$E2, 'N2US'=>$E3, 'N2UT'=>$E4 );
}

function get_ST($m, $Name, $P) {
    $dE = $m["$Name+-USinglet = $Name+-UTriplet"][$P];
    return $dE;
}

function get_N2_ST($m, $Name, $P) {
    $dE = $m["$Name-N2+-USinglet = $Name-N2+-UTriplet"][$P];
    return $dE;
}

function make_reactions( $fname, $m ) {

    $out_ST = fopen("Table/Table-TD-ST-Ar+.csv", "w");
    fprintf($out_ST,"Reaction; dE; dG; LUMO(S); LUMO(T); Ring Deviation (S); Ring Deviation (T);\n");

    $out_ST_N2 = fopen("Table/Table-TD-ST-Ar-N2+.csv", "w");
    fprintf($out_ST_N2,"Reaction; dE; dG; LUMO(S); LUMO(T); Ring Deviation (S); Ring Deviation (T); Angle C-N-N (S); Angle C-N-N (T); Dist C-N (S); Dist C-N (T); Dist N-N (S); Dist N-N (T);\n");

    $out_N = fopen("Table/Table-TD-Nitriding.csv", "w");
    fprintf($out_N,"Reaction; dE; dG; LUMO(Ar+); LUMO(Ar-N2+); Ring Deviation Ar+; Ring Deviation (Ar-N2+); Angle C-N-N; Dist C-N; Dist N-N;\n");

    $out_SE = fopen("Table/Table-TD-SE-Ar+.csv", "w");
    fprintf($out_SE,"Reaction; dE; dG; LUMO(Ar+); LUMO(Ar); Ring Deviation (Ar+); Ring Deviation (Ar);\n");

    $out_SE_N2 = fopen("Table/Table-TD-SE-Ar-N2+.csv", "w");
    fprintf($out_SE_N2,"Reaction; dE; dG; LUMO(Ar-N2+); LUMO(Ar-N2); Ring Deviation (Ar-N2+); Ring Deviation (Ar-N2); Angle C-N-N (Ar-N2+); Angle C-N-N (Ar-N2); Dist C-N (Ar-N2+); Dist C-N (Ar-N2); Dist N-N (Ar-N2+); Dist N-N (Ar-N2);\n");


//    $out_N2 = fopen("TD-table-ST.csv", "r");
    if (($f = fopen($fname, "r")) !== FALSE) {
//	fgets($f);
	while ( ($Str = fgets($f)) !== FALSE) {
	    $Name = ltrim(rtrim($Str));
	    if(strlen($Name)<2) continue;

	    $dE_N2_S = get_N2_S($m, $Name, 'dE'); // if($dE_N2_S<-2000.0 || $dE_N2_S>2000.0) continue;
	    $dG_N2_S = get_N2_S($m, $Name, 'dG');
	    $dE_N2_T = get_N2_T($m, $Name, 'dE'); // if($dE_N2_T<-2000.0 || $dE_N2_T>2000.0) continue;
	    $dG_N2_T = get_N2_T($m, $Name, 'dG');
	    $dE_N2_D = get_N2_D($m, $Name, 'dE'); // if($dE_N2_T<-2000.0 || $dE_N2_T>2000.0) continue;
	    $dG_N2_D = get_N2_D($m, $Name, 'dG');

	    $dE_N2 = get_N2($m, $Name, 'dE'); // if($dE_N2<-2000.0 || $dE_N2>2000.0) continue;
	    $dG_N2 = get_N2($m, $Name, 'dG');
	    $dE_SE = get_SE($m, $Name, 'dE'); // if($dE_SE<-2000.0 || $dE_SE>2000.0) continue;
	    $dG_SE = get_SE($m, $Name, 'dG');

	    $SE = get_SE_all($m, $Name, 'dE');
	    $dE_SE_S = $SE['US'];
	    $dE_SE_T = $SE['UT'];
	    $dE_SE_N2_S = $SE['N2US'];
	    $dE_SE_N2_T = $SE['N2UT'];

	    $SE = get_SE_all($m, $Name, 'dG');
	    $dG_SE_S = $SE['US'];
	    $dG_SE_T = $SE['UT'];
	    $dG_SE_N2_S = $SE['N2US'];
	    $dG_SE_N2_T = $SE['N2UT'];

	    $dE_ST = get_ST($m, $Name, 'dE'); // if($dE_ST<-2000.0 || $dE_ST>2000.0) continue;
	    $dG_ST = get_ST($m, $Name, 'dG');
	    $pS = read_prop("$Name+-USinglet");
	    $pT = read_prop("$Name+-UTriplet");
	    $pD = read_prop("$Name-UDoublet");
	    $RSD_S = $pS['RSD'];
	    $RSD_T = $pT['RSD'];
	    $RSD_D = $pT['RSD'];
	    $LUMO_S = $pS['LUMO'];
	    $LUMO_T = $pT['LUMO'];
	    $LUMO_D = $pD['LUMO'];
	    $HOMO_S = $pS['HOMO'];
	    $HOMO_T = $pT['HOMO'];
	    $HOMO_D = $pD['HOMO'];
	    $LUMO_min = min($LUMO_S,$LUMO_T);
	    if($LUMO_S > $LUMO_T) $State = 1; else $State=0;

	    $dE_N2_ST = get_N2_ST($m, $Name, 'dE'); // if($dE_ST<-2000.0 || $dE_ST>2000.0) continue;
	    $dG_N2_ST = get_N2_ST($m, $Name, 'dG');
	    $pS_N2 = read_prop("$Name-N2+-USinglet");
	    $pT_N2 = read_prop("$Name-N2+-UTriplet");
	    $pD_N2 = read_prop("$Name-N2-UDoublet");
	    $RSD_S_N2 = $pS_N2['RSD'];
	    $RSD_T_N2 = $pT_N2['RSD'];
	    $RSD_D_N2 = $pD_N2['RSD'];
	    $AngCNN_S_N2 = $pS_N2['AngCNN'];
	    $AngCNN_T_N2 = $pT_N2['AngCNN'];
	    $AngCNN_D_N2 = $pD_N2['AngCNN'];
	    $LUMO_N2_S = $pS_N2['LUMO'];
	    $LUMO_N2_T = $pT_N2['LUMO'];
	    $LUMO_N2_D = $pD_N2['LUMO'];
	    $CN_S_N2 = $pS_N2['C-N'];
	    $CN_T_N2 = $pT_N2['C-N'];
	    $CN_D_N2 = $pD_N2['C-N'];
	    $NN_S_N2 = $pS_N2['N-N'];
	    $NN_T_N2 = $pT_N2['N-N'];
	    $NN_D_N2 = $pD_N2['N-N'];
	    if($State==1) { $CN_min=$CN_T_N2; $NN_min=$NN_T_N2; } else { $CN_min=$CN_S_N2; $NN_min=$NN_S_N2; }

	    fprintf($out_ST,"\"%s+(S) = %s+(T)\"; %.2f; %.2f; %.6f; %.6f; %.4f; %.4f;\n", $Name, $Name, $dE_ST, $dG_ST, $LUMO_S, $LUMO_T, $RSD_S, $RSD_T);
	    fprintf($out_ST_N2,"\"%s-N2+(S) = %s-N2+(T)\"; %.2f; %.2f; %.6f; %.6f;", $Name, $Name, $dE_N2_ST, $dG_N2_ST, $LUMO_N2_S, $LUMO_N2_T );
	    fprintf($out_ST_N2," %.4f; %.4f; %.0f; %.0f;", $RSD_S_N2, $RSD_T_N2, $AngCNN_S_N2, $AngCNN_T_N2 );
	    fprintf($out_ST_N2," %.4f; %.4f; %.4f; %.4f;\n", $CN_S_N2, $CN_T_N2, $NN_S_N2, $NN_T_N2);

	    fprintf($out_N,"\"%s+(S) + N2 = %s-N2+(S)\"; %.2f; %.2f; %.6f; %.6f;", $Name, $Name, $dE_N2_S, $dG_N2_S, $LUMO_S, $LUMO_N2_S);
	    fprintf($out_N," %.4f; %.4f; %.0f; %.4f; %.4f;\n", $RSD_S, $RSD_S_N2, $AngCNN_S_N2, $CN_S_N2, $NN_S_N2);
	    fprintf($out_N,"\"%s+(T) + N2 = %s-N2+(S)\"; %.2f; %.2f; %.6f; %.6f;", $Name, $Name, $dE_N2_T, $dG_N2_T, $LUMO_T, $LUMO_N2_S);
	    fprintf($out_N," %.4f; %.4f; %.0f; %.4f; %.4f;\n", $RSD_T, $RSD_S_N2, $AngCNN_S_N2, $CN_S_N2, $NN_S_N2);

	    fprintf($out_SE,"\"%s+(S) + e = %s(D)\"; %.2f; %.2f; %.6f; %.6f; %.4f; %.4f;\n", $Name, $Name, $dE_SE_S, $dG_SE_S, $LUMO_S, $LUMO_D, $RSD_S, $RSD_D);
	    fprintf($out_SE,"\"%s+(T) + e = %s(D)\"; %.2f; %.2f; %.6f; %.6f; %.4f; %.4f;\n", $Name, $Name, $dE_SE_T, $dG_SE_T, $LUMO_T, $LUMO_D, $RSD_T, $RSD_D);

	    fprintf($out_SE_N2,"\"%s-N2+(S) + e = %s-N2(D)\"; %.2f; %.2f; %.6f; %.6f;", $Name, $Name, $dE_SE_N2_S, $dG_SE_N2_S, $LUMO_N2_S, $LUMO_N2_D);
	    fprintf($out_SE_N2," %.4f; %.4f; %.0f; %.0f;",$RSD_S_N2, $RSD_D_N2, $AngCNN_S_N2, $AngCNN_D_N2);
	    fprintf($out_SE_N2," %.4f; %.4f; %.4f; %.4f;\n", $CN_S_N2, $CN_D_N2, $NN_S_N2, $NN_D_N2);
	    fprintf($out_SE_N2,"\"%s-N2+(T) + e = %s-N2(D)\"; %.2f; %.2f; %.6f; %.6f;", $Name, $Name, $dE_SE_N2_T, $dG_SE_N2_T, $LUMO_N2_T, $LUMO_N2_D);
	    fprintf($out_SE_N2," %.4f; %.4f; %.0f; %.0f;",$RSD_T_N2, $RSD_D_N2, $AngCNN_T_N2, $AngCNN_D_N2 );
	    fprintf($out_SE_N2," %.4f; %.4f; %.4f; %.4f;\n", $CN_T_N2, $CN_D_N2, $NN_T_N2, $NN_D_N2);

	}
	fclose($f);
    }
    fclose($out_ST);
    fclose($out_ST_N2);
    fclose($out_N);
    fclose($out_SE);
    fclose($out_SE_N2);
}

$mtd = read_reactions('src/TD-All.dat');
make_reactions('php://stdin', $mtd);

?>
