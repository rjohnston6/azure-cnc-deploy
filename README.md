# Cisco Cloud Network Controller deployment on Azure
## Overview
The automated deployment of Cisco Cloud Network Controller (CNC) on azure.


### Requirements:
- azure CLI
- Azure Subscription

### Envrionment Variables
Definition of the following environment variables is required to allow for deployment.
```
AZ_CNC_SUBSCRIPTION='<subscription-id>'
AZ_CNC_PASSWORD='<superstrongpassword>'
AZ_CNC_SSHPUBKEY='<ssh-rsa superlongkey>'
```

## Usage
The usage of the included scripts eases deployment of CNC in scenarios of learning and demoing of CNC capabilities. Two scripts are included:

1. `cnc_deploy.sh`
2. `cnc_cleanup.sh`

### Deploy Cloud Network Controller
To deploy the CNC using the provided bash scripts start by ensuring the required environment variables are configured.

```
  export AZ_CNC_SUBSCRIPTION='<subscription-id>'
  export AZ_CNC_PASSWORD='<superstrongpassword>'
  export AZ_CNC_SSHPUBKEY='<ssh-rsa superlongkey>'
```

Next run the deploy script, upon execution az login will launch a browser window to allow for authentication to Azure and allow the the deployment to proceed.

```
  source cnc_deploy.sh
```

Once the deployment is complete please allow approximately 5-10 minutes to allow CNC UI to become completely available. The IP address assigned to CNC will be presented at the end of the console.

To access CNC UI navigate to `http://<cnc_ip>` and complete first time setup.

### Cleanup and Undeploy Cloud Network Controller
To save on costs during testing and demoing the included `cnc_cleanup.sh` script can be used to remove the deployed resource group in turn removing all resources deployed as part of the deploy stage. Use with care.

```
   source cnc_cleanup.sh
```

Note: As part of the deploy action the cloudnetworkcontroller VM is provided the contributor role, following clean up access the Azure Portal IAM for the specific subscription and remove the role association.


### Available Parameters
The following are some of the parameters available to customize the deployment of CNC. Please review before deploying. The required parameters are included in the `cnc_deploy.sh` script. Not all parameters listed in template are included as they are rarely require changing especially in testing and demoing situations.

| Parameter  | Required | Default |
| ---------- | -------- | ------- |
| location | No | resourceGroup().location |
| vmName | No | CloudNetworkController |
| adminUsername | No | capicuser |
| adminPasswordOrKey | Yes | $AZ_CNC_PASSWORD |
| adminPublicKey | Yes | $AZ_CNC_SSHPUBKEY |
| InfraVNETPOOL | No | 10.10.0.0/24 |
| ExternalSubnets | No | 0.0.0.0/0 |

## Acknowledgements
The provided scripts where based off scripts created by [soumukhe](https://github.com/soumukhe) and updated to support current releases. Recommend checking out for more examples of automating the deployment of Cloud Network Controller <https://unofficialaciguide.com/2022/04/18/deploying-capic-on-azure-with-terraform/#ref>.