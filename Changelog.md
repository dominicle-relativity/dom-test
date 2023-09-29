0.0.3
--------
* [STVD-87445]: Added an endpoint to create service principals. Added support for GitHub secrets

0.8.9
--------
* [STVD-96706]: Small style changes to improve code readability

0.8.8
--------
* [STVD-96706]: Check permissions on KVs before updating them
=======
0.8.7
--------
* [STVD-95099]: Fixed issue with rotating valid secrets

0.8.6
--------
* [STVD-90379]: Fix missed testing code changes, update documentation

0.8.5
--------
* [STVD-88083]: Only rotates creds if there are no existing valid creds

0.8.4
--------
* [STVD-90379]: Get App/SP properties endpoint for Managed SP's & Usability Enhancements

0.8.3
--------
* [misc]: Updated the README: removed the note about making our SP the owner of the onboarded SP and updated example script

0.8.2
--------
* [STVD-91762]: Updated Newtonsoft.Json nuget package to address vulnerabilities

0.8.1
--------
* [STVD-93454]: Fixed GetAzureApplicationEntryAsync. Now querying for applicationId instead of by partition key.

0.8.0
--------
* [STVD-93454]: Adding support to rotate harness key vault secret managers

0.7.5
--------
* [STVD-93124]: Sending slack alerts on failures

0.7.4
--------
* [misc]: Updated the README onboard endpoint introduction

0.7.3
--------
* [misc]: Changed time of triggering rotation function from 6:00 AM to 6:15 AM

0.7.2
--------
* [STVD-89427]: Feature request, add custom email alert list

0.7.1
--------
* [STVD-89153]: Added support for updating key vault secrets in different directories

0.7.0
--------
* [STVD-]: Add government support

0.6.0
--------
* Fix json syntax in README
* Add/Modify scripts to make onboarding simpler

0.5.2
--------
* [STVD-89426]: STVD-89426 Put Tenant name into subject of email

0.5.1
--------
* [STVD-88804]: Add exclusion lists for alerts

0.5.0
--------
* [STVD-87439]: Option to store secrets as base64

0.4.9
--------
* [STVD-86503]: Enhanced logging

0.4.8
--------
* [misc-update-documentation]: Update documentation

0.4.7
--------
* [STVD-86484-fix-integration-test]: Integration test and misc bug fixes

0.4.6
--------
* [STVD-86484]: Option to keep old creds after cred rotation

0.4.5
--------
* [STVD-86725]: Add app setting toggle to turn off unused alert

0.4.4
--------
* [STVD-86725]: Fix service principal sign in logs

0.4.3
--------
* [STVD-86483-integrationtest-bugfix]: Update integration test to use new data model for onboarding request

0.4.2
--------
* [AlertsBugfix]: Get owners for greater than one year and sp login alerts

0.4.1
--------
* [STVD-86483]: Alert Owners of Automatic Cred Rotation

0.4.0
--------
* [AlertsBugfix]: Email client needs access to user in different directory to email, setup with app credential graph service client

0.3.8
--------
* [AlertsBugfix]: Alerts greater than one year using wrong threshold logic

0.3.7
--------
* [STVD-74646]: Add logging statements for credential rotation failure and success.

0.3.6
--------
* [STVD-74643]: Update ReadMe documentation for external teams to onboard

0.3.5
--------
* [misc]: Setting the TenantId for AzureApplications and AzureServicePrincipals

0.3.4
--------
* [misc] Ignoring some integration tests due to jenkins-infrastructure-identity not having sufficient permissions to add app registrations. Fixing misspelling of applicationId property for AzureApplications. Onboard function searches for cosmosdb entry based off of c.applicationId instead of c.id

0.3.3
--------
* [STVD-85421](https://jira.kcura.com/browse/STVD-85421) [STVD-85421]: Fixing defects introduced when switching partition key from application 
id to object id. Remove logging statement that prints out a request's bearer token.

0.3.2
--------
* [misc] Updating Jenkinsfile so integration tests run for PRs from develop branch. Fixing unit tests so they don't fail when run on the 1st of the month

0.3.1
--------
* [STVD-82026](https://jira.kcura.com/browse/STVD-82026) [STVD-82026]: Bugfix credential rotation for objectId partition key

0.3.0
--------
* [STVD-82026](https://jira.kcura.com/browse/STVD-82026) [STVD-82026]: Fix service principal sign in logs, convert from all sign in logs to last sign in, Convert partition key from application id to object id, Bugfixes on removals and sign ins

0.2.2
--------
* [STVD-83632](https://jira.kcura.com/browse/STVD-83632) Refactoring delta query functions to address null reference bugs

0.2.1
--------
* [misc] Querying azure ad directly for getting service principal and application information for alerting on credential expiration

0.2.0
--------
* [STVD-84484](https://jira.kcura.com/browse/STVD-84484) Adding Integration Tests, and fix bug in ManagedSPRequestAuth

0.1.9
--------
* [STVD-74641](https://jira.kcura.com/browse/STVD-74641) ManagedSPs - Endpoint to onboard Service Principals

0.1.8
--------
* [STVD-74644](https://jira.kcura.com/browse/STVD-74644) Bugfix null check for key credentials and password credentials when listing service principals and apps with expired creds

0.1.7
--------
* [STVD-74644](https://jira.kcura.com/browse/STVD-74644) Adding alertContext property for logs in AlertHelper class to be used by azure dashboard

0.1.6
--------
* [STVD-74644](https://jira.kcura.com/browse/STVD-74644) Adding app config toggle to disable email client

0.1.5
--------
* [STVD-84469](https://jira.kcura.com/browse/STVD-84469) Cloud Security gets notified for alerts on SPs/Apps with no owners

0.1.4
--------
* [STVD-74645](https://jira.kcura.com/browse/STVD-74645) Automated SP Cred Rotation - Documentation.

0.1.3
--------
* [STVD-74642](https://jira.kcura.com/browse/STVD-74642) Adding http trigger and timer function to rotate service principal credentials.

0.1.2
--------
* [STVD-83750](https://jira.kcura.com/browse/STVD-83750) Alert on Secrets with expiration over a year

0.1.1
--------
* [STVD-83599](https://jira.kcura.com/browse/STVD-83599) ManagedSPs - Automated Rotation Authentication

0.1.0
--------
* [STVD-82024](https://jira.kcura.com/browse/STVD-82024) Migrate Service Principal Functions from Terminator to ManagedSPs

0.0.4
--------
* [STVD-81470](https://jira.kcura.com/browse/STVD-81470) Update Trident node label from latest to az6

0.0.3
--------
* [STVD-81470](https://jira.kcura.com/browse/STVD-81470) Update Trident node label from az4 to latest

0.0.2
--------
* [STVD-80304](https://jira.kcura.com/browse/STVD-80304) Migrate infrastructure pipeline from r1.jenkinsdsl to CasCSeeder

0.0.1
--------
* [STVD-74637](https://jira.kcura.com/browse/STVD-74637) Initial commit. Skeleton azure function
