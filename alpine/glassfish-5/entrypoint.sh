#!/bin/sh

if [[ -z $ADMIN_PASSWORD ]]; then
	ADMIN_PASSWORD=password
fi

echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd1
echo "AS_ADMIN_NEWPASSWORD=${ADMIN_PASSWORD}" >> /tmp/glassfishpwd1
asadmin --user admin --passwordfile /tmp/glassfishpwd1 change-admin-password --domain_name domain1
rm /tmp/glassfishpwd1

echo "AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}" > /tmp/glassfishpwd2
asadmin start-domain domain1
asadmin --user admin --passwordfile /tmp/glassfishpwd2 enable-secure-admin
rm /tmp/glassfishpwd2

asadmin stop-domain domain1

asadmin start-domain --verbose