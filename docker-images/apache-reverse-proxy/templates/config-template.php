<?php
  $dynamic_app1 = getenv('DYNAMIC_APP1');
  $dynamic_app2 = getenv('DYNAMIC_APP2');
  $static_app1 = getenv('STATIC_APP1');
  $static_app2 = getenv('STATIC_APP2');
?>
<VirtualHost *:80>
	ServerName demo.res.ch

	#ErrorLog ${APACHE_LOG_DIR}/error.log
	#CustomLog ${APACHE_LOG_DIR}/access.log combined
	
	<Proxy 'balancer://dynamic'>
    BalancerMember 'http://<?php print "$dynamic_app1"?>'
	BalancerMember 'http://<?php print "$dynamic_app2"?>'
    ProxySet lbmethod=byrequests
	</Proxy>
	
	<Proxy 'balancer://static'>
	BalancerMember 'http://<?php print "$static_app1"?>/'
	BalancerMember 'http://<?php print "$static_app2"?>/'
    ProxySet lbmethod=byrequests
	</Proxy>
	
	ProxyPass '/api/animals/' 'balancer://dynamic/'
	ProxyPassReverse '/api/animals/' 'balancer://dynamic/'
    
	ProxyPass '/' 'balancer://static/'
	ProxyPassReverse '/' 'balancer://static/'	
</VirtualHost>