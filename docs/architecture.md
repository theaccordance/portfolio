# Architecture

## Service Diagram
![Top-level Service Diagram](./images/diagram-services.png)

My Sandbox is divided into two zones, `mainwaring.dev` and `knowwhere.space`: 
* `mainwaring.dev`: Mainwaring.dev encompasses all of my cloud computing services from a variety of different providers, including DigitalOcean, Vercel, Carrd.co and others.
* `knowhere.space`: Knowhere is my edge-computing zone, with the DNS routing to a NAS server or Raspberry PIs within my home. I use this zone to serve content primarily within my home, as well as services which are either experimental, or cost-prohibitive in the cloud.
