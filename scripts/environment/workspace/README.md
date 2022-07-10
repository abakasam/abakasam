	dwEnvironment Setup 

(CentOS 7.2 UNTESTED, Ubuntu 20.04 TESTED), Windows Server 2016 UNTESTED

Step                         |Script (.sh / .ps1)
-----------------------------|--------------------
Install Runtime and Login    |setup-environment
 GitHub Login                | login-github
 Node.js Install             | install-node
 Environmental Variables     | setup-variables
CentOS Package Install       |install-package
 CentOS Package Save         | save-dependencies

Bash variables are stored in "my.config"

login-github      > save-github
setup-variables   > bin
setup-environment : local/bin + products/abakasam -> webser
save-dependencies : codeanywhere <-> github, centos 7 iso
