# Kubernetes Multi-Cluster Platform Project
<!-- [MermaidChart: f0a3e18e-7f18-4634-8821-0b6b929f109a] -->
<!-- Check or Edit diagram from above.  MermaidJS plugin is required -->
<img src="https://github.com/asixxctl/cloud-infra/blob/main/assets/images/Multiclusterrouting.png" width="300">

## Overview

This project aims to create a Kubernetes-based platform on Azure, designed for high availability, scalability, and multi-cloud adaptability. It will start with Azure Kubernetes Service (AKS) but be generic enough to apply to other cloud providers.

## Objectives

- Multi-cluster and multi-region setup with an active-active configuration for high availability.
- A simple, geo-replicated database setup for consistent data management across regions.
- Network connectivity between clusters using Azure's default CNI and paired networks.
- Integration of Istio for secure, encrypted service-to-service communication and multi-cluster service mesh capabilities.
- Disaster recovery planning with cluster backups and consideration for data replication.
- Observability tools and systems for future integration, focusing on logging, monitoring, and alerting.
- CI/CD using GitHub and GitHub Actions for automated deployments across clusters.
- Scalability and load balancing managed by a web-tier load balancer, initially considering NGINX.
- Cost management with a focus on minimization and proper tagging for cost aggregation.

## Requirements

### Cloud Providers

- Primary: Azure
- Designed for adaptability across multiple cloud providers.

### Kubernetes Distribution

- Generic setup adaptable to any Kubernetes distribution, starting with AKS.

### State Management

- Simple database with geo-replication in a single region.

### Network Connectivity

- Paired networks with default AKS CNI.
- Istio for multi-cluster service mesh and encryption in transit.

### Disaster Recovery

- Active-active clusters with backup strategies.
- Data replication considered but not an immediate requirement.

### Security and Compliance

- Encryption in transit managed by Istio.

### Observability

- Considerations for future integration.

### Continuous Deployment

- GitHub for version control.
- GitHub Actions for CI/CD.

### Scalability and Load Balancing

- Web-tier load balancing with NGINX or other suitable solutions, adaptable to new cluster additions.

### Cost Management

- Efforts to minimize costs.
- Proper tagging for cost tracking and aggregation.

## Future Considerations

- Detailed observability strategy.
- Expansion to other cloud providers.
- Evaluation of alternative load balancing solutions.
