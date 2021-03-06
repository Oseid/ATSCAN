#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

##############################################################################################
##############################################################################################
##
our(@c);
our (@INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION, @INTERSearchScans, %INTERSearchScans, @INTERdork, %INTERdork, @INTERtarget, %INTERtarget, @INTERlevel, %INTERlevel);

## MODULES
our %MODULES=('normal'=>'normal scan mode', 'advanced'=>'advanced scan mode');
our @MODULES=('normal', 'advanced');

## SCANS
our @SCANS=("sql", "lfi", "joomrfi", "wpafd", "admin", "shost", "sites", "wp", "joom", "upload", "zip", "decrypt", "email", "ip", "ports", "commands", "form");
our %SCANS=("sql"=>"sqli and xss scan", "lfi"=>"local file inclusion", "joomrfi"=>"joomla rfi", "wpafd"=>"wp file download", "admin"=>"find admin page", "shost"=>"get subdomains",
           "sites"=>"get sites in server", "wp"=>"get wordpress sites", "joom"=>"get joomla sites", "upload"=>"get upload files", "zip"=>"get zip files", "decrypt"=>"md5/(en/de)code64",
           "email"=>"colect emails", "ip"=>"colect ips", "ports"=>"scan ports", "commands"=>"extern command", "form"=>"post/get data");

## SEARCH ENGINE
@INTERSearchScans=('unique', 'motor', 'm-random', 'zone');
%INTERSearchScans=("unique"=>"unique tesults", "motor"=>"engine motor", "m-random"=>"random engine", "zone"=>"search zone");

## TARGET
@INTERtarget=('target', 'ping');
%INTERtarget=("target"=>"target", "ping"=>"check is alive");

## SEARCH LEVEL
@INTERlevel=('level');
%INTERlevel=("level"=>"engine results number");

## SEARCH DORK
@INTERdork=('dork');
%INTERdork=("dork"=>"search dork");

## ALL ARGUMENTS
our %ARGUMENTSALL=("status"=>"status code", "valid"=>"content by string", "exp"=>"exploit", "full"=>"full replace", "proxy"=>"use proxy", "proxy-random"=>"random proxy", "save"=>"output file",
                   "replace"=>"String to replace", "with"=>"String for replace", "ifinurl"=>"valid url by string", "noquery"=>"remove query string", "b-random"=>"random browser",
                   "content"=>"response content", "expHost"=>"exploit host", "expIp"=>"exploit target ip", "timeout"=>"browser time out", "host"=>"host name");
our @ARGUMENTSALL=('status', 'valid', 'exp', 'full', 'proxy', 'proxy-random', 'save', 'replace', 'with', 'ifinurl', 'noquery', 'b-random', 'content', 'expHost', 'expIp', 'timeout', 'host');

## NOT REQUIRE A VALUE
our @NoValRequierd=('none', 'host', 'tcp', 'udp', 'full', 'unique', 'nobanner', 'beep', 'noinfo', 'update', 'ip', 'noquery', 'ifend', 'post', 'get', 'b-random', 'm-random', 'content', 'ping',
                   'HOST', 'PORT', 'HOSTIP', 'TARGET', 'sql', 'lfi', 'wpafd', 'admin', 'sites', 'wp', 'joom', 'upload', 'zip', 'email  ip', 'ports', 'commands', 'form', 'search', 'normal',
                   'advanced', 'joomrfi', 'shost', 'email', 'decrypt');

## DATA ARGUMENTS
our @INTERDataScan=('post', 'get', 'data', 'header');
our %INTERDataScan=("post"=>"post methode", "get"=>"get methode", "data"=>"data to post/get", "header"=>"data headers");

## SHELL LFI
our @INTERshell=('shell');
our %INTERshell=("shell"=>"shell url");

## PORTS
our @INTERPortScan=('port', 'tcp', 'udp');
our %INTERPortScan=("port"=>"port", "udp"=>"udp port type", "tcp"=>"tcp port type");

## PAYLOADS
our @INTERpayload=("payload");
our %INTERpayload=("payload"=>"payload");

## SQL INJECT PARAMETER
our @INTERparam=("param");
our %INTERparam=("param"=>"inject parameter");

## DECRYPT
our @INTERdecryp=("md5", "encode64", "decode64");
our %INTERdecryp=("md5"=>"generate md5", "encode64"=>"encode base64", "decode64"=>"decode base64");

## EXTERN PROCESS
our @INTERcomnd=("command");
our %INTERcomnd=("command"=>"extern process");

## ALL ENGINE COMMANDES
our @ENGINEARGUMENTS=(@INTERdork, @INTERtarget, @INTERSearchScans, @INTERlevel);
our %ENGINEARGUMENTS=(%ENGINEARGUMENTS, %INTERdork, %INTERtarget, %INTERSearchScans, %INTERlevel);

## ADVANCED MODE
our @INTERadvanced=("nobanner", "beep", "noinfo", "ifend", "freq", "regex", "sregex", "none", "notin", "source", "limit");
our %INTERadvanced=("nobanner"=>"hide banner", "beep"=>"beep sound", "noinfo"=>"hide target info", "ifend"=>"beep at end", "freq"=>"random frequency", "regex"=>"get matching regex",
                    "sregex"=>"valid url by regex", "none"=>"negative validation", "notin"=>"no string in html", "source"=>"html output folder", "limit"=>"max positive scans");
##############################################################################################

1;
