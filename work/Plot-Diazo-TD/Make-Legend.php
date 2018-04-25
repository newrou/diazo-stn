<?php

$f = fopen('php://stdin',"r");
if($f) {
    while (!feof ($f)) {
        $s = fgets($f);
	if( strpos($s,'T(')===0 ) {
    	    if( strpos($s,'Aliphatic')>0 ) {printf("ctx.strokeStyle = \"rgb(204,102,000)\";\nctx.fillStyle = \"rgb(204,102,000)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Getero')>0 ) {printf("ctx.strokeStyle = \"rgb(255,000,051)\";\nctx.fillStyle = \"rgb(255,000,051)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Phenil')>0 ) {printf("ctx.strokeStyle = \"rgb(000,051,255)\";\nctx.fillStyle = \"rgb(000,051,255)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'NO-Pyridine')>0 ) {printf("ctx.strokeStyle = \"rgb(051,204,102)\";\nctx.fillStyle = \"rgb(051,204,102)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Pyridine')>0 ) {printf("ctx.strokeStyle = \"rgb(051,153,204)\";\nctx.fillStyle = \"rgb(051,153,204)\";\n");printf("%s",$s);continue;}

    	    if( strpos($s,'Singlet-Singlet')>0 ) {printf("ctx.strokeStyle = \"rgb(204,102,000)\";\nctx.fillStyle = \"rgb(204,102,000)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Triplet-Triplet')>0 ) {printf("ctx.strokeStyle = \"rgb(255,000,051)\";\nctx.fillStyle = \"rgb(255,000,051)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Triplet-Singlet')>0 ) {printf("ctx.strokeStyle = \"rgb(000,051,255)\";\nctx.fillStyle = \"rgb(000,051,255)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Minimal-Singlet')>0 ) {printf("ctx.strokeStyle = \"rgb(051,153,204)\";\nctx.fillStyle = \"rgb(051,153,204)\";\n");printf("%s",$s);continue;}

    	    if( strpos($s,'Singlet')>0 ) {printf("ctx.strokeStyle = \"rgb(204,102,000)\";\nctx.fillStyle = \"rgb(204,102,000)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Triplet')>0 ) {printf("ctx.strokeStyle = \"rgb(255,000,051)\";\nctx.fillStyle = \"rgb(255,000,051)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Doublet')>0 ) {printf("ctx.strokeStyle = \"rgb(000,051,255)\";\nctx.fillStyle = \"rgb(000,051,255)\";\n");printf("%s",$s);continue;}
    	    if( strpos($s,'Minimal')>0 ) {printf("ctx.strokeStyle = \"rgb(051,153,204)\";\nctx.fillStyle = \"rgb(051,153,204)\";\n");printf("%s",$s);continue;}

	}
	printf("%s",$s);
      }
    fclose($f);
}

?>
