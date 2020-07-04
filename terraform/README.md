# Terraform Assets for Cloud Resources 

1. Amazon Web Services (aws)

Setup AWS credentials at following path:

```bash
prateek~$ls -ltr ~/.aws/credentials ~/.aws/config
-rw-------  1 prateek  staff  116 Jul  4 02:08 /Users/prateek/.aws/credentials
-rw-------  1 prateek  staff   43 Jul  4 02:08 /Users/prateek/.aws/config
```

2. Microsoft Azure (azure)

Setup Azure credentials in your .bashrc or .bash_profile as: 

```bash
export ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
export ARM_TENANT_ID=$ARM_TENANT_ID
```

3. Google Cloud Platform (gcp)

Setup GCP Credentails in your .bashrc or .bash_profile as: 

```bash
export GOOGLE_APPLICATION_CREDENTIALS=/Users/prateek/Documents/Cloud/gcp/DataEngineeringE2E.json
```
