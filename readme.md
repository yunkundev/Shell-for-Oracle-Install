# Shell for Oracle install 

The Shell Script for the Oracle Database 11gR2 install in the RHEL6.4

### step1: Check

Check the hardware/software requirement(Package requirement)

### step2: Configure(OS)

1, Creating Required Operating System Groups and Users

2, Creating required Directories

3, Configuring Kernel parameters and Resource Limits


### Step3: Configure(User)

Configuring the oracle User's Enviroment

Implement:
```source /home/oracle/.bash_profile```

### Step4: install

prepare response file

run the install command

```
./runInstaller -silent -ignoreSysPrereqs -force -ignorePrereq -responseFile /home/oracle/oracle_install.rsp
```

Use root user to complete all the install

```
[oracle@xclora] :The following configuration scripts need to be executed as the "root" user.
 #!/bin/sh
 #Root scripts to run
/u01/app/oracle/product/11.2.0/db_1/root.sh
To execute the configuration scripts:
         1. Open a terminal window
         2. Log in as "root"
         3. Run the scripts
         4. Return to this window and hit "Enter" key to continue
```