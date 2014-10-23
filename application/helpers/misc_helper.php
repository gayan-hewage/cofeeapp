<?php
/**
* Author : Gayan Chathuranga  Software Engineer <gayan.c@pluspro.com>
* Liecence : Free2Vape UK Ltd Www.free2vape.co.uk
* Description : Misselanious Helper 
* User Defined function to use with USORT function
* Reference : http://php.net/manual/en/function.usort.php
*/
function cmp($a, $b)
{
    if ($a == $b) {
        return 0;
    }
    return ($a < $b) ? -1 : 1;
}

function cmpObj($a, $b)
{
    return strcmp($a->total, $b->total);
}
